<div align="center"><h1>2 Player Shadow The Hedgehog</h1>
<img src="https://raw.githubusercontent.com/ShadowTheHedgehogHacking/2P-ShdTH/master/res/main_banner.png" align="center" />
</div>

## About
This project aims to get 2 Players working in Shadow The Hedgehog (GameCube)'s 1P modes.

Story Mode, Select Mode, Expert Mode, Last Story.

## Level Status / Important Notes
# TURN OFF VIBRATION IN-GAME OR YOU WILL EXPERIENCE MORE CRASHES!
* All levels and modes are compatible v2.0+
* DO NOT USE GCR to build custom ISO! GCR causes problems with the extended DOL.
* Playing in Dolphin Extracted Format / FST IS NOT Recommended! Has a higher rate of crashing for this mod and game in general.
* You can change characters. Select 2P-VS, select characters, back out to the main menu at the 1-3 round select screen. Your character choices will carry over to 2P CO-OP.


## How to play / Setup
Please verify you are using a 1:1 ShadowTheHedgehog USA ISO: md5: `fc936c9b0144c925b45b805fd39da2ac`

To play this mod, you must:
1. Build a custom ISO overwriting any files in `sys` and `files` from the `ISO_EDITS` folder. (NOTE: sys is only available in the releases; Use the releases tab for easiest setup. Do not pull files from GitHub unless manually patching DOL with MCM).
2. Enable Cheats and use provided game config .ini (Dolphin) or .gct (Nintendont)
3. Optimize Dolphin Settings, OR use [Custom Nintendont build](https://github.com/ShadowTheHedgehogHacking/Nintendont-2PMod-Fix) for real hardware.

You can find a setup tutorial video by searching for "Shadow 2P Mod v2.2 - How To Setup by dreamsyntax" on YouTube


### Building the ISO / Setting up Dolphin
**NOTE: Even if you plan to play on real hardware, you will need Dolphin to build the Custom ISO!**
1. Get the latest beta or dev Dolphin - [dolphin-5.0-14344 or newer](https://dolphin-emu.org/download/)
2. Before launching dolphin, create an empty file
   `portable.txt` in the same folder as Dolphin.exe
3. Ensure you have the US version of ShadowTheHedgehog:
	* Right click the game in Dolphin, click Properties.
	* Click the Verify tab. Click Verify Integrity.
	* MD5 calculated should match: `fc936c9b0144c925b45b805fd39da2ac`
   
### Extraction of Game / FST Format
1. Open Dolphin
2. Right-click Shadow The Hedgehog in the game list
3. Select Properties
4. Select FileSystem Tab
5. Right-click "Disc"
6. Select Extract Entire Disc...
7. Select a new folder where you will store the game content and modify its files

### Replacement of Files & Converting FST to ISO
1. Open the newly extracted folder and merge/overwrite the `sys` and `files` files with the two folders in `ISO_EDITS`.
2. Make any additional changes you want (ex: Sonic over YellowAndroid, other [CharacterMods](https://github.com/ShadowTheHedgehogHacking/CharacterMods), or any other changes you want
3. Open Dolphin
4. Open Config (next to Graphics and Controllers)
5. Select Paths Tab
6. Select "Add" for Game Folders
7. Navigate to the folder where you extracted the game
8. Open the `sys` folder, and select "Select Folder"
9. Close the confirmation pane, your games list should populate a new 0 filesize game of Shadow The Hedgehog. The 0 filesize entry is the FST format game.
10. Right click the FST format game and pick `Convert File...`
11. The Convert window will appear, click "Convert..." and name it `game.iso` for Nintendont, or `2PShdTH-2021-06-26.iso` for Dolphin.
12. Move/Save the ISO to the Path Dolphin detects your games. A new 2P Mod Shadow entry should appear in your Dolphins game list with greater than 0 filesize. Use this when playing the game. 

### Configuring for Dolphin
*Skip this section if playing on Nintendont*
1. Close Dolphin if it is open
2. GUPE8P.ini needs to be moved/copied to `<Dolphin.exe Directory>\User\GameSettings\`
3. If you did not make portable.txt earlier, instead you will find the folder at `Documents\Dolphin Emulator\GameSettings\`
4. Unpack the [SD Texture Pack v1.1](https://mega.nz/file/Cfh2UBoC#z_Lhfz8mltDimmCl9TSfrSoaMI_y421hqP9OrhlDZGE) in `<Dolphin.exe Directory>\User\Load\Textures\` (the unzipped texturepack folder should be named `GUPE8P`)
5. If you want to use the 100% Save, place `8P-GUPE-SHADOWTHEHEDGEHOG.gci` GCI file at `<Dolphin.exe Directory>\User\GC\USA\Card A\`
6. Open Dolphin
7. Open Config, Enable Cheats
8. Open Graphics, Click Advanced Tab, Check/Enable Load Custom Textures and Prefetch Custom Textures

#### Dolphin 2P Mod Tweaks / Cheats Config
1. Right click the game and choose Properties
2. Choose the Gecko Codes tab
3. Here you can enable/disable some of the codes and customize some tweaks, such as enabling Independent Respawns.
4. Note some codes are embedded in the dol and are not able to be disabled.

#### Dolphin Performance & Enable Texture Pack Configuration
```
Select Graphics
	Under General:
		Set Backend to Direct3D 11 or Vulkan (as of 5.0-10912 Direct3D 12 can cause crashes for 2P-ShdTH)
		Set Aspect Ratio to Force 16:9 or Stretch to Window
	Under Enhancements:
		I recommend 3x Native if on a 1080p monitor, settings here are optional. If you are on a low end PC leave as 1x Native.
	Under Hacks:
		Check/Enable everything (big performance gain)
	Under Advanced:
		Check/Enable Load Custom Textures and Prefetch Custom Textures
```		

#### Dolphin FPS optimization (CPU variable)
```
	Adjust clockspeed while running the game (Note: Dolphin only saves this change for next run if your game is NOT running; You should find the value that runs best then close the game, set it again and it will stay there):
    
	It varies per system, some run better with underclock/overclock
	
	I recommend trying 80%, 120%, 165%, 189%, 217%, 230%, 287% 
	Note that higher clockspeeds may result in audio distortions, if it occurs lower the clockspeed.
	I run 217% on an AMD Ryzen 7 3800X, and ran 165% on a Intel i5-3570k with both having great FPS for most levels
How?:
	Select Config
    Select Advanced Tab
    Adjust CPU Clock Override slider

I recommend loading in Glyphic Canyon, have one player stay at the start and the other go to the first area with enemies and Knuckles.
Try adjusting the slider here to reach 60fps. (It will be ~30fps before adjustments)
```

### Configuring for Nintendont
*Skip this section if playing on Dolphin*


**This assumes you are familiar with Nintendont**
* If not, I recommend a quick read here: https://github.com/FIX94/Nintendont
* You MUST use my [custom Nintendont build](https://github.com/ShadowTheHedgehogHacking/Nintendont-2PMod-Fix), it will not work with any other games and the original Nintendont will not work with 2P-ShdTH v2.0+ mod
```
Copy GUPE8P.gct to the same directory as your game.iso (doesnt matter if its USB or SD)
	e.g. USB:/games/Shadow The Hedgehog [GUPE8P] should have:
		game.iso
		GUPE8P.gct
	in the folder.
Copy 'saves' folder to root of USB or SD (same one where game is)
    Nintendont should be configured as follows for the best experience:
        Cheats ON
        Force Widescreen OFF (ensure its not ON!) 
        Unlock Read Speed ON
		
    Optional:
       	Memcard Emulation ON (if you don't have a memcard with stages unlocked already)
		Video Width (Set to whatever fills your screen if you want the same aspect as Dolphin, in my case it was 714)
		Set your TV to "Stretch or Full Aspect" mode. Since the game originally is 4:3, with the 16:9 patches it should be displayed as a stretched image to get proper aspect ratio
```
* If you want to customize cheats for Nintendont, use [CodeManager2](https://github.com/CLF78/CodeManager2) with GUPE8P.ini to generate your own `.gct` for Nintendont

## Done so far:
* Nintendont support for v2.0+ (Requires [custom Nintendont build](https://github.com/ShadowTheHedgehogHacking/Nintendont-2PMod-Fix))
* Widescreen support for in-game UI and some other elements in GNCP files
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
* "Airbug" (occasionally P1 or P2 will be stuck in the floating state until hurt after entering wind/fan/elecfan objects) Fixed
* DevilDoom crashing fixed (P2's skin data will be transparent in DevilDoom stage until death as a side effect)
* DevilDoom is balanced for two players (ring collection is shared)
* Worm Enemies and Alien Gunships target closest player

## Other Known Issues (Not planned to be fixed)
* P2 spawns according to nukkoro2.inf initially fine, but on restart seems to occasionally be off by +-5 - +-20 (stage dependent, game bug)
* Item Bubbles / Hint Bubbles content render based on P1's camera's relative location
* If ChaosPoints are at 0, Dark/Hero orbs only activate P1's ChaosPowers
* Rare instance has been recorded where P1 uses a rocket but the rocket never takes off (state issue?)
* Checkpoint Bonus (Rings, Bubble, Lives) are based off P1's ring count if P2 activates checkpoint
* Phase 2 Warp for P2 in Diablon Boss
* Super P2 has transparent/missing skin data on DevilDoom until P2 dies and respawns
* Story Mode Route Menu (Y button when paused) remaps control to P1 until pause is closed

## Dev
* dreamsyntax
* DonutStopGaming

## Credits
* dreamsyntax for starting this project/everything
* DonutStopGaming for major contributions to chunks, P3/AI partner mapping, Airbug, CoasterFix, GravitySwitchers, PlayerPointer, SuperShadow, structs analysis, and numerous other address discoveries
* LimblessVector for his work on identifying objects, work on the initial memory list, SinglePlayer Widescreen Hack, Stray Pixel under HP Bars fix
* TheHatedGravity for red/yellow TrueBlackShadow textures, Additional work on widescreen gncp patches, HD font, v1.2+ MenuUI, v2.0 Banner, and a ton of testing
* Original Shadow vector used in banner by nibroc_rock (modified)
* Muzzarino for some symbol findings
* RaphaelDrewBoltman for the GitHub icon / HHC related textures

## Thanks
* DonutStopGaming for the many nights spent pair reversing and all the contributions to this project
* TryTwo for extremely useful new debugging features in Dolphin
* aldelaro5 for Dolphin Memory Engine
* igorseabra4 and Sewer56 for Heroes and Shadow file reversing work & editing tools (HeroesPowerPlant, HeroesONE-Reloaded, etc...)
* LimblessVector for Shadow file reversing work (HeroesPowerPlant, DME Memory List)
* TheHatedGravity, LimblessVector, Shadowth117, DonutStopGaming, my local friends, and all the randoms I played with on Parsec for playtesting
* Heroes Hacking Central (&Shadow) for keeping us insane during this project
* metaconstruct, UnclePunch, psiLupan, and DRGN of the SmashBoards / Melee Hacking Community for MCM and assistance with DOL expansion & modification