# Item Capsule Camera Assignment @ 8010c29c
# Hint Ring Camera Assignment @ 80109a7c


# Inject @ 8010c29c

  addi r17, r30, 0x28
  nop # DistanceCheck replaced MCM
  li r5, 0x1
  blt- end
  li r5, 0x0

end:
  nop # 48000000 replaced by MCM