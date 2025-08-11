# r31 contains Helicopter struct
# 0xF0 = x
# 0xF4 = y
# 0xF8 = z
# Inject @ 802f7624
  mr r17, r31
  addi r17, r17, 0xF0
  nop # replaced by MCM INJECT SharedFunc
  li r5, 0x1
  blt- end
  li r5, 0x0

end:
  nop # 48000000 replaced by MCM