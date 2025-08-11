Inject @ 8016F31C
# Init we set 1 ring to force
# death to fix skin bug
# access old LR at call from 0x80178044
lwz r0, 0x0044 (sp)
lis r15, 0x8017
ori r15, r15, 0x8048
cmpw r15, r0
li r0, 50
bne- end # normal

devildoom:
li r0, 1

end: