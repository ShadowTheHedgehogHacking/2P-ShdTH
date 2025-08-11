#Fix the flipping other player bug
#----
#Cause: When checkpoint warping, the last frame the player warps away, the SetGravityCollision object still executes the distance check, so in scenarios when the opposing player is closer after the warp they will be affected instead.
#Fix:
#For GravityChangeCollision object, check if either player is in the ExternalControl state. If true, skip executing a gravity change collision.
#This should not cause any issues since we are no longer calling delete until the object is out of range, so the following frames when the proper 'warped-to' GravityCollisionChanged object should have no noticable difference, where the 'warped-to' one will be ignored and then deleted. 
#ExternalControl ID = 0x20
#PlayerStruct -> 0x0 -> 0x0 -> 0x22C -> 0x30 -> 0x10 = BehaviorID


## Inject @ 80247854 (on GravityChangeCollision exec, when a player is within the 'activation' range, not the render range, and the object itself has passed the sBitFlag check successfully) 

# 8057D728 GLOBAL FRAME COUNTER
# 80513CB8 JUNK MEM for lastExternalCommand while near GravityChangeCollision
  lis r22, 0x8057
  ori r22, r22, 0xD728 # Global Frame Counter
  lis r23, 0x8051
  ori r23, r23, 0x3CB8 # junk MEM

  lis r15, 0x807D
  ori r15, r15, 0x71A0 # P1
  lwz r16, 0(r15) # save r15 for P2 check later
  lwz r16, 0(r16)
  lwz r16, 0x22C(r16)
  lwz r16, 0x30(r16)
  lwz r16, 0x10(r16)
  cmpwi r16, 0x20 # check for ExternalControl state (checkpoint warping and warphole behavior)
  beq- externalControlDetected
  lwz r16, 0x8(r15) # P2 check
  lwz r16, 0(r16)
  lwz r16, 0x22C(r16)
  lwz r16, 0x30(r16)
  lwz r16, 0x10(r16)
  cmpwi r16, 0x20 # check for ExternalControl state (checkpoint warping and warphole behavior)
  beq- externalControlDetected

frameCountCheck:
# neither player is in the state, but we still need to check the frameCounter
  lwz r15, 0x0(r22)  
  lwz r16, 0x0(r23)
  cmpw r15, r16
  blt- skipExecuting # global frame counter is less than the lastExternalCommand frame count, skipExecuting
  b executeNormally
  
externalControlDetected:
  lwz r15, 0x0(r22) # get current frame count
  addi r15, r15, 10 # add 10 frames to current frameCount
  stw r15, 0x0(r23) # Store frameCount+10 

skipExecuting:
nop # (MCM replace with b 0x8024788C) -> exit GravityChangeCollision::Exec for this frame without applying a gravity change

executeNormally: