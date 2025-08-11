# Inject @ 8029152c (SpecialDetach load which camHolder to destroy)
# Load the camHolder based on loop counter, ignoring whatever is already in the parentHolder - to ensure no partial free
# r31 safe to use (overwritten right after)
# r3 contains camholder
####
lis r15, 0x8051
ori r15, r15, 0x5458
lbz r16, 0x1(r15) # check which player to load (specialDetach)
cmpwi r16, 0
addi r16, r3, 40 # get BossHolderRoot
bne- P2_Data

P1_Data:
lwz r0, 0x4(r15) # (0x545C) P1 Holder
stw r0, 0x4(r16) # overwrite BossHolder with stored value
lwz r0, 0xC(r15) # (0x5464) P1 HolderRoot
b end

P2_Data:
lwz r0, 0x8(r15) # (0x5460) P2 Holder
stw r0, 0x4(r16) # overwrite BossHolder with stored value
lwz r0, 0x10(r15) # (0x5468) P2 HolderRoot

end:
stw r0, 0x0(r16) # overwrite BossHolderRoot with stored value
mr. r30, r3 # original line (mr. for compare)
#######################################

# Inject @ 802915b0 (loop SpecialDetach)

# Repurpose 0x80515459 - 0x1A byte for P1 for this function's loop counter instead
 
lis r15, 0x8051
ori r15, r15, 0x5458
lbz r16, 0x1(r15) # loopCounter for SpecialFunction 
cmpwi r16, 0 # check which player to load

li r16, 0 # for clearing the stored cam refs
bne- P2_Destroy 

P1_Destroy:
stw r16, 0xC(r15) # (0x5464) (Root)
stw r16, 0x4(r15) # (0x545C)
b P1Exit

P2_Destroy:
stw r16, 0x10(r15) # (0x5468) (Root)
stw r16, 0x8(r15) # (0x5460)
b P2Exit

P1Exit:
li r16, 1
stb r16, 0x1(r15) # set var to indicate now processing P2
lwz r4, 0x0014 (sp) # get callstack
# check for heavy dog 0x80335A3C
lis r15, 0x8033
ori r15, r15, 0x5A3C
cmpw r4, r15
beq- heavyDogCase

normalCase:
li r4, 0 # Ensure FREE() is not called
b resumeP1Exit

heavyDogCase:
li r4, 1 # FREE() is called

resumeP1Exit:
mr r3, r30 # r30 contains the initial r3 arg (and is line we replaced)
nop # b 0x8029152c

P2Exit:
li r16, 0
stb r16, 0x1(r15) # reset var to indicate back to P1
mr r3, r30 # original line

###########################################################################

# Inject @ 802915a0
extsh. r0, r31
ble- exit

lis r15, 0x8051
ori r15, r15, 0x5458
lbz r16, 0x1(r15) # loopCounter for SpecialFunction 
cmpwi r16, 0 # compare its P1s loop # will influence outer ble-

exit:
# do nothing