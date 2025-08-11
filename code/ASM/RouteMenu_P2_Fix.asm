# Inject @ 801e329C
cmplwi r0, 16
beq- P1
# if P1 did not press Y check P2
addi r3, r3, 40
lwz r0, 0x30 (r3)
rlwinm r0, r0, 0, 27, 27
cmplwi r0, 16
beq- P2

P1:
li r15, 2
b end

P2:
li r15, 3

end:

##

# Inject @ 801e3d90 (Part 2, assumption from above)
mr r0, r15