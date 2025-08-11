# We updated our Chunks loop to now return 0/1/2/3; Original game is just 0/1 for chunk render status. Then in our actual render function, we can operate based on these values
# Assumes that we already updated our base chunks distance check code to detect both players


#Stack writes to 0 for all chunks [ Fixed Index Version ]
#Inject @ 8003A8F4 
# r5 = visibilityChunk (r30 add r27 to get) | we can use this reg | restore before end
# r26 = targetChunkNumber (retrieved from lwz r26, 0 (r5)) | we can use this reg | restore before end
# r27 = visibilityData offset to reach current visibility chunk, guaranteed to be 0x0 for offset 0 | we can use this reg
# r28 = constant per heap, relevant to setting/getting visibility flag data (can't use)
# r30 = visibiltyData (each visiblityChunk is size 0x20) per chunk - its constant per heap creation | we can NOT use this reg
# r31 = visibilityChunkNumber | we can use this reg, restore as 0 at end

cmpwi r31, 0
bne- exit # if r31 is not the first visibilityChunk skip this code

lwz r15, 0x0034 (r28)
lwz r15, 0x0040 (r15) # r15 = visibilityChunkSize
li r16, 0 # constant 0 for writes

wipeGeoRenderState:
add r5, r30, r27 # get current visibility chunk
lwz r26, 0 (r5) # get targetChunkNumber
rlwinm r5, r26, 1, 0, 30 (7fffffff) # get write position for targetChunk
addi r3, sp, 8 # read chunkStore from stack (should be constant?)
sthx r16, r3, r5 # write 0 to chunkStore+writePosition

addi r27, r27, 0x20 # increment visibilityStruct offset
addi r31, r31, 1
cmpw r31, r15 # check if we're iterated over visibilityChunkSize
blt+ wipeGeoRenderState

# restore registers to expected values for first visibilityChunk read
li r27, 0
li r31, 0

exit:
add r5, r30, r27 # original line

#############################
#Inject @ 8003AAA0 (Version 4 - Check splitscreen status first)

# ASSUMPTION: Prior branch above this already checked for chunkDraw = 0, so we only need to check 1/2/3 (1 = P1, 2 = P2, 3 = Draw on both splits)

li r3, 1 # set to renderTrue by default
lis r15, 0x8057
ori r15, r15, 0xD710
lwz r15, 0(r15) # get SplitNumber acting on for render() 0 = P1, 1 = P2
cmpwi r15, 0
bne- P2 # P2 is rendering this frame

P1:
cmpwi r0, 2
bne- end # implies 1 or 3
li r3, 0 # if the value is 2, we don't render this chunk
b end

P2:
cmpwi r0, 1
bne- end
li r3, 0 # if the value is 1, we don't render chunk

end: