<div align="center"><h1>2 Player Shadow The Hedgehog</h1>
<img src="https://raw.githubusercontent.com/ShadowTheHedgehogHacking/2P-ShdTH/dev/res/main_banner.png" align="center" />
</div>

## About
This project aims to get 2 Players working in Shadow The Hedgehog (GameCube)'s 1P modes.

Story Mode, Select Mode, Expert Mode, Last Story.

## Level Status
![Current Level Map](./res/level_status.png)

## Road to 2.0 (WIP) | PREVIEW / QA Build ETA: 6/20/2019 | Release ETA: 7/7/2019
* Flyables attach to correct player's camera
* Turrets attach to correct player's camera
* Checkpoint Warping/Backtracking separate warping
* Individual death-to-checkpoint / Don't reload level for both players
* **Buffer crash research / possible crash reductions if possible
* -> Verified problematic stages will have TXD reductions [PARTIAL]
* -> Reductions planned: See `Buffer(s) Issue Identication` section below

#### Completed for 2.0
* Verify 1:1 misc bytes for level edits per HPP v0.7.6+ [DONE]
* Vehicles map to correct player's controlpad and freecam [DONE]
* Fix "ChaosPowers activate for both players" - add underflow check [DONE]
* Fix "Disable ScreenShake" - (occasional endless shake issue) [DONE]
* Partner does not despawn if P1 is not in range of "RW:Range" activation patch for P2 [DONE]
* All bosses are free-cam [DONE]
* Circus Park Hero Mission counts P2's rings [DONE]
* GUN Fortress Security Camera segments are free-cam [DONE]
* Culling issue for P2's screen when near force-fields / or near Vacuum effect (effect removed) [DONE]
* Key Doors, Westopolis Triggers, Computer Room react to P2 [DONE]

#### Items expected not to make 2.0 deadline
* Fix "Air bug" - (player state pointer overlap issue)
* Space Gadget Gravity Switchers fixed [WIP / POC->Done, further issues identified / DonutStopGaming Task]
* Devil Doom [WIP / DonutStopGaming Task]
* Coasters (aka Pulley/Ziplines) fixed [WIP / DonutStopGaming Task]
* WeaponsTargeting & HomingAttack Other Player Enable/Disable

## Buffer(s) Issue Identification

So far three buffers have been confirmed via the PS2 executable :
* GLOBAL
* EVENT
* ETC


It is unknown if AUDIO is part of GLOBAL or ETC


Overflowing for the types:

* GLOBAL (Texture) = May crash during play or if level completes successfully RankUI will not draw. After this occurs the game is unstable. Next levels may crash at any time
* AUDIO = Just causes distorted audio while too many sound sources are playing. No adverse effect
* EVENT = May crash during EVENT cutscene or after reaching a Goal (after Fade to white on mission completion)
* ETC (Effects) = Same crash type as GLOBAL (Texture)
#### Glyphic Canyon
* Solution: NOT NEEDED
* AUDIO
#### Lethal Highway
* Solution: NOT YET ATTEMPTED
* GLOBAL (Texture)
#### Central City
* Solution: 32x32 DXT1
* GLOBAL (Texture)
* EVENT (StoryMode Intro & GoalEvent)
#### The Doom
* Solution: NOT YET ATTEMPTED
* ETC (Effects)
#### Sky Troops
* Solution: NOT NEEDED
* AUDIO
#### Lost Impact
* Solution: NOT YET ATTEMPTED
* GLOBAL (Texture)
* AUDIO
#### GUN Fortress
* Solution: FAILED / Attempted: Divide by 2 for same-ratio, reduce textures over 64x64
* GLOBAL (Texture)
* EVENT (GoalEvent)
#### Black Comet
* Solution: NOT YET ATTEMPTED
* EVENT (GoalEvent)
#### Final Haunt
* Solution: NOT YET ATTEMPTED
* EVENT (GoalEvent)

## Problems
* Checkpoint Warping/Backtracking only moves P1, only P1 controls Checkpoint UI
* Coasters / Segments with automated spline sections (e.g. hang-rail in Circus Park) leaves other player behind, only activates on P1
* Gravity switches on Space Gadget only alter P1's gravity
* "Air bug" (occasionally P1 or P2 will be stuck in the floating state until hurt when activating a wind tunnel) - Break out with Chaos Blast or move back to the source of the wind
* Turrets alter P1's camera if P2 uses it
* SuperShadow only activates for P1
* If Dark Partner is activated first, P3 remapping fails
* Phase 2 Warp for P2 in Diablon Boss
* Checkpoint Bonus (Rings, Bubble, Lives) are always 10 rings if P2 activates checkpoint

## Done so far:
* Level chunks load/unload based on both players
* ChaosPowers activate for both players
* Partner/Mission Helpers can be remapped to permanent AI or P3* (P3 has some issues depending on Partner activation order)
* ChaosPowers EventsCamera and ChaosControl Effects removed
* Load P2 in any mode (including camera)
* Enable splitscreen in 1P, disable when in cutscenes/event cameras
* SET objects load/unload based on both players
* Carry over VS mode selected characters into CO-OP mode
* nukkoro2.inf spawn positions for every level
* P2 Sound Listener
* P2 UI
* P2 can pause
* P2's flyables do not overwrite P1's camera
* Vehicles no longer disappear on P2 dismount if P1 is not nearby
* Some segments where a vehicle is required will not have enough distance to cause a respawn (add 2x vehicles)
* Spawners / Worms work properly
* Culling issue for P2's screen when near force-fields / or near Vacuum effect (effect removed)
* Circus Park Hero Mission counts P2's rings
* Partner/Mission Helpers (Sonic, Doom's Eye, Espio, etc...) no longer despawn if P2 activates trigger without P1 being in range
* Vehicles no longer alter P1's camera if P2 uses it; P2 can control CarType Vehicles if mounting while P1 is not driving
* Key Doors, Westopolis Triggers, Computer Room react to P2

## Other Known Issues (Not planned to be fixed)
* P2 spawns according to nukkoro2.inf initially fine, but on restart seems to occasionally be off by +-5 - +-20 (stage dependent, game bug)
* Item Bubbles / Hint Bubbles content render based on P1's relative location
* If ChaosPoints are at 0, Dark/Hero orbs only activate P1's ChaosPowers
* Worm Enemies and AlienShips will only target P1
* Heavy Dog / Blue Falcon do not damage P2
* Bosses (with the exception of Sonic & Diablon) only react to P1
* If P1 is in a Vehicle and P2 attempts to use a CarTypeVehicle, P1 will have control of P2
* Rare instance has been recorded where P1 uses a rocket but the rocket never takes off (state issue?)

## Bonus Roadmap
* Static weapon swaps for Metal Androids
* Optional BlackKnight style melee replacement

## Dev
* dreamsyntax
* DonutStopGaming

## Credits
* DonutStopGaming for major contributions to chunks, P3/AI partner mapping, CoasterFix, GravitySwitchers, PlayerPointer, structs analysis, and numerous other address discoveries
* LimblessVector for his work on identifying objects, work on the initial memory list, SinglePlayer Widescreen Hack, Stray Pixel under HP Bars fix, 
* TheHatedGravity for red/yellow TrueBlackShadow textures, v1.2+ MenuUI, v2.0 Banner
* Infinite Lives by Link Master
* Chaos Powers Activators by Zzetti
* Original Shadow vector used in banner by nibroc_rock (modified)
* Muzzarino for some symbol findings

## Thanks
* DonutStopGaming for the many nights spent pair reversing and all the contributions to this project
* igorseabra4 and Sewer56 for Heroes and Shadow file reversing work & editing tools (HeroesPowerPlant, HeroesONE-Reloaded, etc...)
* LimblessVector for Shadow file reversing work (HeroesPowerPlant)
* aldelaro5 for Dolphin Memory Engine
* TryTwo for extremely useful new debugging features in Dolphin
* TheHatedGravity, LimblessVector, Shadowth117, DonutStopGaming, my local friends, and all the randoms I played with on Parsec for playtesting
* DeadlyFugu, Muzzarino
* Heroes Hacking Central (&Shadow)