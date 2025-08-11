# Partner Control per-activated player's camera

#Inject @ 80093E18
# compare stored partner player struct with passed player struct
# need to keep compatible with ShadowRando, so need to account for infinite partners

# r4 = partnerStruct ref
# r5 = scratch, set to 0/1 for which cam to target
# r15 = hold partnerStruct static pointer that we increment in a loop
# r16 = scratch for partner comparison

# first PartnerStructSlot
lis r5, 0x807D
ori r5, r5, 0x71A0 # P1 struct
lis r15, 0x8057
ori r15, r15, 0x5F54 # Partner Slot Heap
lwz r15, 0x0(r15) # deref top layer, should be fine if some frames are invalid since per-exec should update fast enough
 Alloc Safe address
lwz r5, 0x0(r5) # deref level 1 - P1 struct for compare later
lwz r5, 0x0(r5) # deref level 2 - P1 struct for compare later

partnerCheckLoop:
lwz r16, 0x0(r15) # deref level 1
cmpwi r16, 0 # nullcheck, if null, we reached the end of partners without finding a match. Default to P1 if so
beq P1

# ensure this is the correct partner to check
lwz r16, 0x0(r16)
cmpw r16, r4
beq- partnerFound
addi r15, r15, 0x8 # check next PartnerSlot
b partnerCheckLoop

partnerFound:
# we found the proper partner, now we check which playerStruct its bound to
lwz r16, 0x290(r16)
lwz r16, 0x1C(r16)
cmpw r16, r5 # partnerPointing to playerStruct check
beq- P1
bne- P2

P1:
li r5, 0
b end

P2:
li r5, 1

end: