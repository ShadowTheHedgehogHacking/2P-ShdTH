# 80575F80 - current stageAction

## Inject @ 80474038
lis r15, 0x8057
ori r15, r15, 0x5F80
lwz r15, 0x0(r15) # get currentStageAction
cmpwi r15, 0x3 # PlayAction
li r4, 0 # hide subtitles
beq- exit
lwz r4, 0x024C (r6) # if not PlayAction, render subtitles
exit:

## Inject @ 80474A5C
lis r15, 0x8057
ori r15, r15, 0x5F80
lwz r15, 0x0(r15) # get currentStageAction
cmpwi r15, 0x3 # PlayAction
li r0, 0 # hide subtitles
beq- exit
lwz r0, 0x024C (r4) # if not PlayAction, render subtitles
exit:
