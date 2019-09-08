<div align="center"><h1>2 Player Shadow The Hedgehog</h1>
<img src="https://raw.githubusercontent.com/ShadowTheHedgehogHacking/2P-ShdTH/master/res/main_banner.png" align="center" />
</div>

## About
This project aims to get 2 Players working in Shadow The Hedgehog (GameCube)'s 1P modes.

Story Mode, Select Mode, Expert Mode, Last Story.

## Level Status
# ALL LEVELS ARE NOW PLAYABLE!

## Road to 2.0 (WIP) | Release Date: 9/9/2019 (Tomorrow)
High Priority:
* Fix "Air bug" - (player state pointer overlap issue)

Normal Priority:
* Space Gadget Gravity Switchers fixed [v1.9 DONE; v2 WIP]
* Bosses should attack closest player [PARTIAL / All Bosses except Egg Dealer]
* Find another way for Vehicles/Turrets/Flyables Controls/Cams to detect which player uses them instead of holding X

#### Completed for 2.0
* Verify 1:1 misc/unknown bytes for level edits per HPP v0.7.6+
* Vehicles map to correct player's controlpad
* Fix "ChaosPowers activate for both players" - add underflow check
* Fix "Disable ScreenShake" - (occasional endless shake issue)
* Partner does not despawn if P1 is not in range of "RW:Range" activation patch for P2
* All bosses are free-cam
* Circus Park Hero Mission counts P2's rings
* GUN Fortress Security Camera segments are free-cam
* Culling issue for P2's screen when near force-fields / or near Vacuum effect (effect removed)
* Key Doors, Westopolis Triggers, Computer Room react to P2
* Android characters have unique JumpBall colors
* Individual death-to-checkpoint (Basic)
* Physics Rewrite for GUNMech Jumpers
* Downscale all stage and stage_gdt textures to reduce crashing
* Coaster/Pulley/Ziplines Fix v2
* Proper CameraHook for Turrets/Flyables/Vehicles
* Devil Doom / Super for P2
* Checkpoint Warping/Backtracking separate warping

## Problems
* "Air bug" (occasionally P1 or P2 will be stuck in the floating state until hurt when activating a wind tunnel) - Break out with Chaos Blast or move back to the source of the wind
* If Dark Partner is activated first, P3 remapping fails
* Phase 2 Warp for P2 in Diablon Boss
* Keys collected do not save

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
* Independent Warping/Backtracking via Checkpoints
* Coasters / Ziplines / Pulleys (e.g. hang-rail in Circus Park) activate on correct player
* Bosses (with the exception of Egg Dealer) will attack closest player
* Gravity Switchers on Space Gadget alter proper player's gravity
* SuperShadow/DevilDoom activates for both players

## Other Known Issues (Not planned to be fixed)
* P2 spawns according to nukkoro2.inf initially fine, but on restart seems to occasionally be off by +-5 - +-20 (stage dependent, game bug)
* Item Bubbles / Hint Bubbles content render based on P1's relative location
* If ChaosPoints are at 0, Dark/Hero orbs only activate P1's ChaosPowers
* Rare instance has been recorded where P1 uses a rocket but the rocket never takes off (state issue?)
* Worm Enemies and AlienShips will only target P1
* Checkpoint Bonus (Rings, Bubble, Lives) are based off P1's ring count if P2 activates checkpoint

## Bonus Roadmap
* Static weapon swaps for Metal Androids
* Optional BlackKnight style melee replacement
* Both players required to reach GoalRing for stage complete
* Physics Rewrite for GUNMech Jumpers [DONE]
* WeaponsTargeting & HomingAttack Other Player Enable/Disable

## Dev
* dreamsyntax
* DonutStopGaming

## Credits
* DonutStopGaming for major contributions to chunks, P3/AI partner mapping, CoasterFix, GravitySwitchers, PlayerPointer, structs analysis, and numerous other address discoveries
* LimblessVector for his work on identifying objects, work on the initial memory list, SinglePlayer Widescreen Hack, Stray Pixel under HP Bars fix, 
* TheHatedGravity for red/yellow TrueBlackShadow textures, v1.2+ MenuUI, v2.0 Banner, and a ton of testing
* Original Shadow vector used in banner by nibroc_rock (modified)
* Muzzarino for some symbol findings
* Chaos Powers Activators by Zzetti
* Infinite Lives by Link Master

## Thanks
* DonutStopGaming for the many nights spent pair reversing and all the contributions to this project
* TryTwo for extremely useful new debugging features in Dolphin
* aldelaro5 for Dolphin Memory Engine
* igorseabra4 and Sewer56 for Heroes and Shadow file reversing work & editing tools (HeroesPowerPlant, HeroesONE-Reloaded, etc...)
* LimblessVector for Shadow file reversing work (HeroesPowerPlant)
* TheHatedGravity, LimblessVector, Shadowth117, DonutStopGaming, my local friends, and all the randoms I played with on Parsec for playtesting
* Heroes Hacking Central (&Shadow) for keeping us insane during this project
