start:
  mtctr r12
  li r16, 0x0
  lis r15, 0x807D
  ori r15, r15, 0x71A0
  lwz r15, 0(r15)
  lwz r15, 0(r15)
  cmplw r15, r3
  lis r15, 0x8051
  ori r15, r15, 0x3CB0 # Junk MEM for storing
  bne- P2
  stw r16, 0x0(r15)
  beq- end

P2:
  stw r16, 0x4(r15)

end:
  blr 