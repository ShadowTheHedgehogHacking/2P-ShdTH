## HERO SHADOW ACTIVATION:
#Fix for playerAllocations
# Inject @ 800af458 [HeroShadow point check]
cmpw r4, r0 # original compare
bge- end # if points exceed the 30k amount, continue to activation

# check playerAllocations
lis r15, 0x8057
ori r15, r15, 0x5FA4
lwz r15, 0x0(r15)
cmpwi r15, 2
blt- end # continue 

# check P1 state
lis r15, 0x807D
ori r15, r15, 0x71A0
lwz r16, 0x0(r15)
lwz r16, 0x0(r16)
lbz r16, 0xAF(r16) # get ChaosStateByte
andi. r16, r16, 0x4 # (00000100b) - HeroShadow
cmpwi r16, 0x4 # Check for HeroShadow state
beq- end # continue to activation

# check P2 state
lwz r16, 0x8(r15)
lwz r16, 0x0(r16)
lbz r16, 0xAF(r16) # get ChaosStateByte
andi. r16, r16, 0x4 # (00000100b) - HeroShadow
cmpwi r16, 0x4 # Check for HeroShadow state
beq- end # continue to activation

cmpw r4, r0 # re-do original compare to fail the activation check (outside this code)

end:

## DARK SHADOW ACTIVATION:
# Inject @ 800af438 [DarkShadow point check]
cmpw r4, r0 # original compare
bge- end # if points exceed the 30k amount, continue to activation

# check playerAllocations
lis r15, 0x8057
ori r15, r15, 0x5FA4
lwz r15, 0x0(r15)
cmpwi r15, 2
blt- end # continue 

# check P1 state
lis r15, 0x807D
ori r15, r15, 0x71A0
lwz r16, 0x0(r15)
lwz r16, 0x0(r16)
lbz r16, 0xAF(r16) # get ChaosStateByte
andi. r16, r16, 0x8 # (00001000b) - DarkShadow bitflag
cmpwi r16, 0x8 # Check for DarkShadow state
beq- end # continue to activation

# check P2 state
lwz r16, 0x8(r15)
lwz r16, 0x0(r16)
lbz r16, 0xAF(r16) # get ChaosStateByte
andi. r16, r16, 0x8 # (00001000b) - DarkShadow bitflag
cmpwi r16, 0x8 # Check for DarkShadow state
beq- end # continue to activation

cmpw r4, r0 # re-do original compare to fail the activation check (outside this code)

end:

## IDLE DRAIN:

# Inject @ 800a49e8  (context aware idle drain rate with bitflag)
# r6 safe to use as scratch

# check P1 state
lis r15, 0x807D
ori r15, r15, 0x71A0
lwz r16, 0x0(r15)
lwz r16, 0x0(r16)
lbz r16, 0xAF(r16) # get ChaosStateByte
andi. r5, r16, 0x4 # (00000100b) - HeroShadow bitflag
cmpwi r5, 0x4 # HeroShadow
beq- checkP2
andi. r6, r16, 0x8 # (00001000b) - DarkShadow bitflag
cmpwi r6, 0x8 #DarkShadow
beq- checkP2
bne- loadr5 # if neither match, we don't reduce the CC drain rate

checkP2:
lwz r16, 0x8(r15)
lwz r16, 0x0(r16)
lbz r16, 0xAF(r16) # get P2 ChaosStateByte
andi. r15, r16, 0x4 # (00000100b) - HeroShadow bitflag
cmpw r15, r5 # Check P2 matches with P1 (HeroShadow)
beq- loadr5
andi. r16, r16, 0x8 # (00001000b) - DarkShadow bitflag
cmpw r16, r6 # Check P2 matches with P1 (DarkShadow)

loadr5:
lwz r5, 0x002C (sp) # original line (load value of ChaosPower Idle)
bne- end # use last compare to skip (regardless of jump)

reduceDrainRate:
addi r5, r5, 0xC

end: