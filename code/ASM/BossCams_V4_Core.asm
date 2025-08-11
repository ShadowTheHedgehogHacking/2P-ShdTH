## This isn't the full code, but some of it

## Inject @ 80178C54
# Wipes 0x80515458 - 8051546B 
stwu r1, -48(r1)
lis r15, 0x8051
ori r15, r15, 0x5458
li r16, 0x0
stw r16, 0(r15)
stw r16, 4(r15)
stw r16, 8(r15)
stw r16, 0xC(r15)
stw r16, 0x10(r15)

## Inject @ 80291228
lis r15, 0x8051
ori r15, r15, 0x5458
lbz r16, 0x0(r15) # check which player to load
cmpwi r16, 0
addi r16, r30, 40 # get BossHolderRoot
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
lbz r0, 0x001A (r4) # original line

## Inject @ 80291478

lis r15, 0x8051
ori r15, r15, 0x5458
lbz r16, 0x0(r15) 
cmpwi r16, 0 # check which player to load

# get holderRoot
addi r16, r30, 40
lwz r16, 0(r16)

bne- P2_Holder 

P1_Holder:
stw r16, 0xC(r15) # (0x5464) (Root)
addi r16, r30, 44
lwz r16, 0(r16)
stw r16, 0x4(r15) # (0x545C)
b P1Exit

P2_Holder:
stw r16, 0x10(r15) # (0x5468) (Root)
addi r16, r30, 44
lwz r16, 0(r16)
stw r16, 0x8(r15) # (0x5460)
b P2Exit

P1Exit:
li r16, 1
stb r16, 0x0(r15) # set var to indicate now processing P2
mr r3, r30 # r30 contains the initial r3 arg
# TODO: stack adjustment? probably?

nop # b 0x80291220

P2Exit:
li r16, 0
stb r16, 0x0(r15) # reset var to indicate back to P1
lmw r30, 0x0108 (sp) # original line

# loop to start of function, but also need to handle stack AND vars passed initially