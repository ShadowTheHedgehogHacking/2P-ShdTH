# Inject @ 8029396C
start:
  lwz r15, 0(r31) # get object class name
  lis r16, 0x804F
  ori r16, r16, 0x3CC8 # StringRef for GravityChangeCollision
  cmplw r15, r16 # compare string pointers
  lwz r17, 0x40(r31) # Position Data for GravityChangeCollision
  beq- phase2
  lwz r17, 0x34(r31) # Position Data for GravityChangeZone and GravityChangeSwitch
  
phase2:
mflr r4 # r4 confirmed to be scratch/replaced in following instruction
nop # replace with bl <DistanceCheck>
li r5, 0
bgt- end # acting on compare from DistanceCheck

# if less than, we set to P2
P2:
li r5, 1

end:
mtlr r4