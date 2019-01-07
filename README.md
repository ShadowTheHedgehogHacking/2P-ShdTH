<div align="center"><h1>2 Player Shadow The Hedgehog</h1>
<img src="https://raw.githubusercontent.com/ShadowTheHedgehogHacking/2P-ShdTH/master/res/main_banner.png" align="center" />
</div>

## About
This project aims to get 2 Players working in Shadow The Hedgehog (GameCube)'s 1P modes.
Story Mode, Select Mode, Expert Mode, Last Story.

## Level Status
![Current Level Map](./res/level_status.png)

## Problems (High Priority)
* Checkpoint Warping/Backtracking only moves P1
* Gravity switches on Space Gadget only alter P1's gravity
* Segments with automated spline sections (e.g. hang-rail in Circus Park) leaves other player behind, only activates on P1

## Problems (Low Priority)
* Air bug (occasionally P1 or P2 will be stuck in the floating state until hurt when activating a wind tunnel) - Break out with Chaos Blast or move back to the source of the wind
* Certain vehicles alter P1's camera if P2 uses it
* Certain vehicles only respond to P1's control pad
* Turrets alter P1's camera if P2 uses it
* Chaos control will leave other player behind; if P2 activates P1's camera is altered*
* SuperShadow only activates for P1
* Player 2 cannot pause/unpause

## Done so far:
* Display P2 UI components (Ring count, Ammo count)
* Level chunks load/unload based on both players (early version working, needs further verification)
* Load P2 in any mode (including camera)
* Enable splitscreen in 1P, disable when in cutscenes/event cameras* (chaos control is still an issue)
* Layout objects load when P2 is within render distance
* Carry over VS mode selected characters into CO-OP mode
* nukkoro2.inf spawn positions for every level
* P2 sound listener fixed (related to GameMode byte)
* Some segments where a vehicle is required will not have enough distance to cause a respawn (add 2x vehicles)
* Warphole object leaves other player behind (added safe platforms, will be solved when chunks load for P2)

## Known Issues (Not planned to be fixed)
* P2 spawns according to nukkoro2.inf initially fine, but on restart seems to occasionally be off by +-5 - +-20 (stage dependent, game bug).
* Partner/Mission Helpers (Sonic, Doom's Eye, Espio, etc...) only spawn if P1 sees them first (or is in-range). Side effect of current layout objects load patch.
* Culling issue on Final Haunt for P2's screen when near force-fields

## Credits
* DonutStopGaming for major contributions to chunks and other address discoveries
* Includes `True Black Shadow` by TheHatedGravity
* Includes `Rouge over YellowAndroidShadow` by Shadowth117
* SinglePlayer Widescreen Hack by LimblessVector
* Infinite Lives by Link Master
* Chaos Powers Activators by Zzetti 
* Thanks to igorseabra4 and Sewer56 for Heroes and Shadow editing tools (HeroesPowerPlant, HeroesONE-Reloaded, etc...)
* Thanks to LimblessVector for his work on identifying objects and his initial large memorylist
* Thanks to DonutStopGaming for ideas while function hunting
* Thanks to TheHatedGravity, LimblessVector, Shadowth117, DonutStopGaming, my local friends, and all the randoms I played with on Parsec for playtesting
* Thanks to DeadlyFugu, Muzzarino
* Thanks to Heroes Hacking Central (&Shadow)