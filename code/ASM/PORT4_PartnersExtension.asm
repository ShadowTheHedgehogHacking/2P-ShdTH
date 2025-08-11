# Inject @ 800A85C4

lis r31, 0x8056
ori r31, r31, 0xED4C
lwz r18, 0x10(r3)
sub r31, r18, r31
cmplwi r31, 0
beq- setPORT1MainController

lwz r18, 0x10(r3)
lis r31, 0x8056
ori r31, r31, 0xED78
cmplw r31, r18
bne- end

lwz r19, 0x314C(r13)
addi r19, r19, 0x1
stw r19, 0x314C(r13)
cmplwi r19, 1
beq- end

# partner case
lis r15, 0x8057
ori r15, r15, 0x5F54 # Partner Slot Heap
lwz r15, 0x0(r15)
lis r19, 0x804A # 804AF118 = SonicTypeExecuter
ori r19, r19, 0xF118
li r18, 0 # count of SonicTypeExecutersFound
li r17, 0 # count of Iterations

partnerCheckLoop:
lis r16, 0x8057
ori r16, r16, 0x5F50 # count of partnerStructs allocated
lwz r16, 0x0(r16)
cmpw r17, r16 
beq- countSonicExecuters # finished checking all structs

lwz r16, 0x0(r15) # deref level 1
lwz r16, 0x0(r16) # check for Npc::SonicTypeExecuter
lwz r16, 0x22C(r16)
lwz r16, 0x0(r16)
cmpw r16, r19
bne- next #if its a fly type, don't add to the count
addi r18, r18, 1 # add to count of SonicExecuters found

next:
addi r17, r17, 0x1 # increment counter
addi r15, r15, 0x8 # check next PartnerSlot
b partnerCheckLoop

countSonicExecuters:
cmpwi r18, 2
blt- PORT3

PORT4:   
  addi r18, r31, 0x58
  b STORE
  
PORT3:
  addi r18, r31, 0x2C
  
STORE:
  stw r18, 0x10(r3)
  b end

# REGULAR CODE
setPORT1MainController:
  lwz r18, 0x314C(r13)
  li r18, 0x0
  stw r18, 0x314C(r13)

end:
  mr r31, r3