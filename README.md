<div align="center"><h1>2 Player Shadow The Hedgehog</h1>
<img src="https://raw.githubusercontent.com/ShadowTheHedgehogHacking/2P-ShdTH/master/res/main_banner.png" align="center" />
</div>

## About
This project aims to get 2 Players working in Shadow The Hedgehog (GameCube)'s 1P modes.

Story Mode, Select Mode, Expert Mode, Last Story.

## Level Status
# All levels and modes are compatible v2.0+

## Problems
* Not Compatible with Nintendont Since v2.0
* Memory leak found in Space Gadget [Fixed in v2.1 (not released yet)]
* "Air bug" (occasionally P1 or P2 will be stuck in the floating state until hurt after entering wind/fan/elecfan objects) [Fixed in v2.1 (not released yet)]
* DevilDoom crashes for some people [Fixed in v2.1 (not released yet)]
* DevilDoom fight is not balanced for two players (very hard to win) [Fixed in v2.1 (not released yet)] 

## Done so far:
* Level chunks load/unload based on both players
* ChaosPowers activate for both players
* Partner/Mission Helpers can be remapped to permanent AI or P3/SLOT3
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
* Culling issue for P2's screen when near force-fields / or near Vacuum effect (effect removed)
* Circus Park Hero Mission counts P2's rings
* Partner/Mission Helpers (Sonic, Doom's Eye, Espio, etc...) no longer despawn if P2 activates trigger without P1 being in range
* Vehicles/Turrets/Flyables properly assign Controls and Cameras based on player distance
* Key Doors, Westopolis Triggers, Computer Room react to P2
* Independent Warping/Backtracking via Checkpoints
* Coasters / Ziplines / Pulleys (e.g. hang-rail in Circus Park) activate on correct player
* Bosses will act on closest player
* Gravity Switchers on Space Gadget alter proper player's gravity* (Checkpoint warp/deaths may run into issues)
* SuperShadow/DevilDoom activates for both players
* 1:1 misc/unknown bytes for level edits per HPP v0.7.6+
* Fix "Disable ScreenShake" - (occasional endless shake issue)
* All bosses are free-cam
* GUN Fortress Security Camera segments are free-cam
* Android characters have unique JumpBall colors
* Individual death-to-checkpoint (Basic)
* Physics Rewrite for GUNMech Jumpers
* Downscale all stage and stage_gdt textures to make the game crashless
* P2's scores and rings add to game totals at ranking

## Other Known Issues (Not planned to be fixed)
* P2 spawns according to nukkoro2.inf initially fine, but on restart seems to occasionally be off by +-5 - +-20 (stage dependent, game bug)
* Item Bubbles / Hint Bubbles content render based on P1's camera's relative location
* If ChaosPoints are at 0, Dark/Hero orbs only activate P1's ChaosPowers
* Rare instance has been recorded where P1 uses a rocket but the rocket never takes off (state issue?)
* Worm Enemies and AlienShips will only target P1
* Checkpoint Bonus (Rings, Bubble, Lives) are based off P1's ring count if P2 activates checkpoint
* Phase 2 Warp for P2 in Diablon Boss
* Super P2 has transparent/missing skin data on DevilDoom until P2 dies and respawns
* Story Mode Route Menu (Y button when paused) remaps control to P1 until pause is closed

## Dev
* dreamsyntax
* DonutStopGaming

## Credits
* dreamsyntax for starting this project/everything
* DonutStopGaming for major contributions to chunks, P3/AI partner mapping, CoasterFix, GravitySwitchers, PlayerPointer, SuperShadow, structs analysis, and numerous other address discoveries
* LimblessVector for his work on identifying objects, work on the initial memory list, SinglePlayer Widescreen Hack, Stray Pixel under HP Bars fix
* TheHatedGravity for red/yellow TrueBlackShadow textures, v1.2+ MenuUI, v2.0 Banner, and a ton of testing
* Original Shadow vector used in banner by nibroc_rock (modified)
* Muzzarino for some symbol findings

## Thanks
* DonutStopGaming for the many nights spent pair reversing and all the contributions to this project
* TryTwo for extremely useful new debugging features in Dolphin
* aldelaro5 for Dolphin Memory Engine
* igorseabra4 and Sewer56 for Heroes and Shadow file reversing work & editing tools (HeroesPowerPlant, HeroesONE-Reloaded, etc...)
* LimblessVector for Shadow file reversing work (HeroesPowerPlant)
* TheHatedGravity, LimblessVector, Shadowth117, DonutStopGaming, my local friends, and all the randoms I played with on Parsec for playtesting
* Heroes Hacking Central (&Shadow) for keeping us insane during this project
* metaconstruct, UnclePunch, psiLupan, and DRGN of the SmashBoards / Melee Hacking Community for MCM and assistance with DOL expansion & modification