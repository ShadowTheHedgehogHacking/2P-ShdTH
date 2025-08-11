#Castle Monster 2P Fix
#r31 Contains Monster Struct
#Initial Spawn @ 80138C54 | 0x30
#Chase Seq @ 80138F48

  mr r17, r31
  addi r17, r17, 0x30
  lwz r17, 0x0(r17) # embedded
  nop # replaced by MCM INJECT SharedFunc
  li r5, 0x1
  blt- end
  li r5, 0x0

end:
  nop # 48000000 replaced by MCM