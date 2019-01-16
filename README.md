<div align="center"><h1>2 Player Shadow The Hedgehog</h1>
<img src="https://raw.githubusercontent.com/ShadowTheHedgehogHacking/2P-ShdTH/master/res/main_banner.png" align="center" />
</div>

## About
This project aims to get 2 Players working in Shadow The Hedgehog (GameCube)'s 1P modes.
Story Mode, Select Mode, Expert Mode, Last Story.

## Level Status
![Current Level Map](./res/level_status.png)

## Problems (High Priority)
* On P2 CC/CB activation P1's camera is altered and unloads P1's chunk
* Checkpoint Warping/Backtracking only moves P1
* Gravity switches on Space Gadget only alter P1's gravity
* Segments with automated spline sections (e.g. hang-rail in Circus Park) leaves other player behind, only activates on P1

## Problems (Low Priority)
* Air bug (occasionally P1 or P2 will be stuck in the floating state until hurt when activating a wind tunnel) - Break out with Chaos Blast or move back to the source of the wind
* Certain vehicles alter P1's camera if P2 uses it
* Certain vehicles only respond to P1's control pad
* Turrets alter P1's camera if P2 uses it
* SuperShadow only activates for P1
* Player 2 cannot pause/unpause
* Pausing/Unpausing causes SplitScreen to flash back to single screen for a frame
* Vehicles will disappear on P2 dismount if P1 is not nearby
* Partner/Mission Helpers (Sonic, Doom's Eye, Espio, etc...) despawn if P2 loads them first. May be related to above issue.
* DropShips/EnemySpawners are broken - HeroesPowerPlant related

## Done so far:
* P2 UI
* Level chunks load/unload based on both players
* Load P2 in any mode (including camera)
* Enable splitscreen in 1P, disable when in cutscenes/event cameras* (chaos control is still an issue)
* SET objects load/unload based on both players
* Carry over VS mode selected characters into CO-OP mode
* ChaosPowers activate for both players
* nukkoro2.inf spawn positions for every level
* P2 Sound Listener
* Some segments where a vehicle is required will not have enough distance to cause a respawn (add 2x vehicles)

## Known Issues (Not planned to be fixed)
* P2 spawns according to nukkoro2.inf initially fine, but on restart seems to occasionally be off by +-5 - +-20 (stage dependent, game bug).
* Culling issue on Final Haunt for P2's screen when near force-fields

## Bonus Roadmap
* Individual death-to-checkpoint / Don't reload level for both players
* Static weapon swaps for Metal Androids
* E3 Race Mode - Hero vs Dark objective race (only some stages)
* FriendlyFire Enable/Disable
** WeaponsTargeting & HomingAttack Other Player Enable/Disable
* Individual Chaos Powers points/activation

## Credits
* DonutStopGaming for major contributions to chunks and other address discoveries
* LimblessVector for his work on identifying objects and his initial large memory list
* Includes `True Black Shadow` by TheHatedGravity
* Includes `Rouge over YellowAndroidShadow` by Shadowth117
* SinglePlayer Widescreen Hack by LimblessVector
* Infinite Lives by Link Master
* Chaos Powers Activators by Zzetti 

## Thanks
* igorseabra4 and Sewer56 for Heroes and Shadow editing tools (HeroesPowerPlant, HeroesONE-Reloaded, etc...)
* DonutStopGaming for ideas while function hunting
* TheHatedGravity, LimblessVector, Shadowth117, DonutStopGaming, my local friends, and all the randoms I played with on Parsec for playtesting
* DeadlyFugu, Muzzarino
* Heroes Hacking Central (&Shadow)