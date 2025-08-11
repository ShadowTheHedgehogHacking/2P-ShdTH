# Update Inject @ 80169BBC (hardcoded vibration)
# GongTop, Catapult, StretchGrass uses r30
lwz r5, 0(r30)
lwz r5, 0x54(r5)
cmpwi r5, 1  #if 1 or 0, we're good
beq- end
cmpwi r5, 0
beq- end

# if more than 0/1, we check r31
# Spring, GongSpring, LongSpring, DashRamp, DashRing use r31

lwz r5, 0(r31)
lwz r5, 0x54(r5)

end:
#########


# Vehicle Type # 800EB158 & 800E905C aka 0x20FC diff
lis r5, 0x800E
ori r5, r5, 0x905C
cmpw r0, r5 # r0 has the LR in it from start of func
beq- vehicle
addi r5, r5, 0x20FC
cmpw r0, r5
bne- otherChecks

# vehicle special case
vehicle:
lwz r5, 0x0054 (r30)
b end

otherChecks:
# GongTop, Catapult, StretchGrass uses r30
lwz r5, 0(r30)
lwz r5, 0x54(r5)
cmpwi r5, 1  #if 1 or 0, we're good
beq- end
cmpwi r5, 0
beq- end

# if more than 0/1, we check r31
# Spring, GongSpring, LongSpring, DashRamp, DashRing use r31
lwz r5, 0(r31)
lwz r5, 0x54(r5)

end: