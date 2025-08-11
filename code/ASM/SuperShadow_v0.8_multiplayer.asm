## 00110000 - Super Shadow bitflags

Inject @ 800A860C
lbz r16, 0xB(r4) # read polled controller byte
cmpwi r16, 0x40 # d-pad up
bne- exit # if the polled controller is not pressing d-pad up, exit immediately

lis r16, 0x807D
ori r16, r16, 0x71A0 # P1 struct
lis r15, 0x8056
ori r15, r15, 0xED4C # P1 controller
cmpw r15, r4
beq- SetSuperFly
addi r15, r15, 0x2C
cmpw r15, r4
bne- exit # partner or PORT3/4

P2:
# check playerAllocations
lis r15, 0x8057
ori r15, r15, 0x5FA4
lwz r15, 0x0(r15)
cmpwi r15, 2
blt- exit # skip P2 checks

addi r16, r16, 0x8

SetSuperFly:
lwz r16, 0x0(r16)
lwz r16, 0x0(r16)
lbz r15, 0xAF(r16)
andi. r6, r15, 0x30 # Super Shadow Flying Bitflags (00110000b)
cmpwi r6, 0x30
beq- disableFlying # jump to disable since already in flying state
ori r15, r15, 0x30 # set bits for flying state before calling setstate
b setState

disableFlying:
andi. r15, r15, 0xCF # Super Shadow Flying Inverse Bitflag (11001111b) - aka disable

setState:
stb r15, 0xAF(r16) # set SuperFly on/off state

exit:
li r6, 1

###########
#SuperFly JumpDash adjustment based on Flying or normal state
# Inject @ 800882FC
#r31 = pShadowExecutor
#0.100000001 =  3DCCCCCD desired while in superfly
#0.400000006 = 3ECCCCCD default jumpdash length
#Random static donor RAM that happens to have the value @ 805F97D8 

lis r16, 0x807D
ori r16, r16, 0x71A0 # P1 struct
lwz r16, 0x0(r16)
lwz r16, 0x0(r16)
lwz r15, 0x22C(r16)
lwz r15, 0x30(r15)
cmpw r15, r31
beq- checkState

# check playerAllocations
lis r15, 0x8057
ori r15, r15, 0x5FA4
lwz r15, 0x0(r15)
cmpwi r15, 2
blt- normal # skip P2 checks

lis r16, 0x807D
ori r16, r16, 0x71A8 # P2 struct
lwz r16, 0x0(r16)
lwz r16, 0x0(r16)
lwz r15, 0x22C(r16)
lwz r15, 0x30(r15)
cmpw r15, r31
bne- normal #partner

checkState:
lbz r15, 0xAF(r16)
andi. r15, r15, 0x30 # Super Shadow Flying state check (bitflag)
cmpwi r15, 0x30
bne- normal

super:
lfs f1, 0xF8 (rtoc) # 0.1 donor
b end

normal:
lfs f1, -0x6F40 (rtoc) # 0.4 default

end: