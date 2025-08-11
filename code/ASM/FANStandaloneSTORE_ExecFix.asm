loc_0x0:
  lis r16, 0x8051
  ori r16, r16, 0x3CB0 # Junk MEM for later storing/reading from
  lis r22, 0x807D
  ori r22, r22, 0x71A0
  lwz r22, 0(r22)
  lwz r22, 0(r22)
  lwz r0, 16(r1)
  cmplw r22, r0
  bne- P2_store_check
  stw r31, 0x0(r16) # BAD Store in Executor MOVE TO JUNK | P1

P2_store_check:
  lis r22, 0x807D
  ori r22, r22, 0x71A8
  lwz r22, 0(r22)
  lwz r22, 0(r22)
  cmplw r22, r0
  bne- loc_0x3C
  stw r31, 0x4(r16) # BAD Store in Executor MOVE TO JUNK | P2

loc_0x3C:
  lwz r0, 36(r31)
  lis r22, 0x807D
  ori r22, r22, 0x71A0
  lwz r22, 0(r22)
  lwz r22, 0(r22)
  cmplw r22, r0
  beq- loc_0x60
  stw r22, 36(r31) # BAD Store in Fan
  bne- loc_0x74

loc_0x60:
  addi r16, r16, 0x4 # NEW: modify r16 so we store in P2
  lis r22, 0x807D
  ori r22, r22, 0x71A8
  lwz r22, 0(r22)
  lwz r22, 0(r22)
  stw r22, 36(r31) # BAD Store in Fan

loc_0x74:
  lwz r15, 0x0(r16) # BAD Store in Executor MOVE TO JUNK | 0x0 because we modify P1/P2 offset directly
  cmplw r15, r31
  beq- loc_0xA0
  cmplwi r15, 0
  bne- loc_0xA4
  lwz r15, 556(r22) # Getting behavior state ?
  lwz r15, 48(r15)
  lwz r15, 16(r15)
  cmpwi r15, 0x18
  bne- loc_0xA4
  stw r31, 0x0(r16) # BAD Store in Executor MOVE TO JUNK | 0x0 because we modify P1/P2 offset directly

loc_0xA0:
  stw r22, 16(r1)

loc_0xA4:
  lwz r0, 16(r1)
  blr 