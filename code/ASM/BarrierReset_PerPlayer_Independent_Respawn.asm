# Inject @ 8020453C

cmplwi r0, 0 # original line
beq- end # (second line after original) - take the branch outside if null

cmpwi r30, 0 # check which player (0 = P1, 1 = P2)
bne- P2

P1:
cmpwi r22, 31 # check dead state
beq- dead
bne- notDead

P2:
cmpwi r16, 31 # check dead state
bne- notDead

dead:
cmplwi r0, 0 # We know this check is not equal, so re-invoking will ensure we skip the branch outside, and reset the barrier/box state
b end

notDead:
cmpw r15, r15 # do a same register compare to force a beq outside

end: