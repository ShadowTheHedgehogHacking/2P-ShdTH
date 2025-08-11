# Inject @ 804188A0

# Custom MTP Crash Fix v4
lis r28, 0x8057
ori r28, r28, 0x5F80
lwz r28, 0x0(r28)
cmpwi r28, 0xA # StageAction::SaveAction
beq- skip
cmpwi r28, 0x10 # StageAction::EndAction
beq- skip
cmpwi r28, 0x6 # StageAction::GoalAction - skip ShadowMTN only
beq- skipShadowMTN
cmpwi r28, 0x1 # StageAction (Not init)
bne- continue

skip:
blr # skip function

skipShadowMTN:
lwz r28, 0x114(sp)
lis r0, 0x800B
ori r0, r0, 0x53D0
cmpw r28, r0
beq- skip

continue:
stwu sp, -0x0040 (sp)