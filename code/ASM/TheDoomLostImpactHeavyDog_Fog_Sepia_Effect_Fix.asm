# The Doom/Lost Impact/Heavy Fog Sepia Effect Fix
# Inject @ 801fa2dc

# Stage Timer - 8057D734
lis r15, 0x8057
ori r15, r15, 0xD734
lfs f0, 0x0(r15)

# 0.2 float donor - 804EDC34
lis r15, 0x804E
ori r15, r15, 0xDC34
lfs f1, 0x0(r15)

fcmpo cr0, f0, f1
ble original

blr # skip function otherwise

# original line
original:
stwu sp, -0x0040 (sp)