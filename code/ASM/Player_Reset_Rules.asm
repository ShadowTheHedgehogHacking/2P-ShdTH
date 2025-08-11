#Inject @ 80204854

BossStageCheck:
  lis r4, 0x8057
  ori r4, r4, 0xD748
  lwz r4, 0(r4)

  cmpwi r4, 700
  beq noReset
  cmpwi r4, 210
  beq resetStage
  cmpwi r4, 310
  beq resetStage
  cmpwi r4, 410
  blt- noReset
  cmpwi r4, 500
  blt- resetStage #410,411,412
  cmpwi r4, 510
  blt- noReset #500,501,502,503
  cmpwi r4, 512
  blt- resetStage #510,511
  cmpwi r4, 610
  bge- resetStage #final bosses
  
noReset:
  li r4, 8
  b end

resetStage:
  li r4, 7
  
end: