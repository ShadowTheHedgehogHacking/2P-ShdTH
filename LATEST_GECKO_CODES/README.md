# Latest gecko codes

## USERS
You will only care about GUPE8P.ini in the root of this folder. Ignore the rest* (unless trying to customize DOL patches, then see DEVELOPERS section).


If you are going to use Nintendont / Play on real hardware use:

https://github.com/CLF78/CodeManager2


And open the GUPE8P.ini to generate a GCT


For v2.0-v2.2 of the 2P-ShdTH Mod, you need a special build of Nintendont if you want to play on real hardware.

Versions v1.0-v1.2 do not need the special build, standard Nintendont is required for these versions.

Versions v2.3+ may require Oversized Image supports builds of Nintendont.

v1.0-v1.2 Nintendont:

https://github.com/FIX94/Nintendont


v2.0-v2.2 Nintendont:

https://github.com/ShadowTheHedgehogHacking/Nintendont-2PMod-Fix

v2.3+ Nintendont:

https://github.com/ShadowTheHedgehogHacking/Nintendont/releases


## DEVELOPERS
### Customizing DOL patches
`2PMod_MCM_Format.txt` and `settings.py` are for [MeleeCodeManager v4.4.1 by DRGN](https://github.com/DRGN-DRC/Melee-Code-Manager)

Set the ISO to be read as v1.06 NTSC to properly edit the DOL.

Use that to change/adjust the patches applied to the DOL/ISO directly.



### Old legacy work
Note we have hit the Gecko limit, so `development_only` is only used for verifying codes.
Many need to be disabled to test new codes, keep this in mind if writing more codes.