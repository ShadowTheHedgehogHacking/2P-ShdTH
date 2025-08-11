## On Open UI
mflr r0
lis r17, 0x8057
ori r17, r17, 0x5FE4
subi r19, r5, 0x1
mulli r19, r19, 0x1C
add r17, r17, r19
nop # replace in MCM with bl <DistanceCheck>
lis r15, 0x8051
ori r15, r15, 0x3C90 # prepare Junk MEM
blt- end

P1:
# Store P1 Task
stw r31, 0x0(r15)

end:
mtlr r0
b # return

#####
# -- Player to Warp --
# Inject @ 801176AC (target address)
lwz r5, 0x00EC (sp) # - gives us initial r31 value
lwz r5, 0x0040 (r5) # - current Task
lis r15, 0x8051
ori r15, r15, 0x3C90 # Get Junk MEM we use for storing last Task per player
lwz r16, 0x0 (r15)
lwz r16, 0x40 (r16) # TODO: Unsafe, need to do checks or something || Update : Instead we point to PlayerStruct which is guaranteed to have 2 depth layers
cmpw r5, r16
bne- P2

# P1 confirmed as target
P1:
# delete Task reference in Junk MEM
li r5, 0 # Target Player 1
beq- end

P2:
li r5, 1
#TODO: Probably check P2 instead of assuming

end:

##########

# Inject @ 80330FD8 # SavePointTask Destructor
lwz r15, 0x0040 (r30) # - current Task
lis r16, 0x8051
ori r16, r16, 0x3C90 # Get Junk MEM we use for storing last Task per player
lwz r19, 0x0 (r16)
lwz r19, 0x40 (r19) # - current Task (P1)
cmpw r15, r19
# bne- P2 Obsolete, optimized out
bne- end

P1:
# delete Task reference in Junk MEM, use P1 struct as 'not a task'
lis r15, 0x8057
ori r15, r15, 0x5FA8 # address of P1 Struct (always exists at SavePoint destructor time)
stw r15, 0x0 (r16)

end:
# original code
stwu sp, -0x0010 (sp)
b # return to injection point