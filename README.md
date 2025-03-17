<div align="center">
<h1>2 Player Shadow The Hedgehog</h1>
<img src="https://raw.githubusercontent.com/ShadowTheHedgehogHacking/2P-ShdTH/master/workspace/res/banner.png" align="center" />
<h3>A multiplayer mod for Shadow the Hedgehog NTSC-U (GameCube)</h3>
<img src="https://raw.githubusercontent.com/ShadowTheHedgehogHacking/2P-ShdTH/master/workspace/res/main_banner.png" align="center" />
</div>

## About
This project allows you experience Shadow The Hedgehog (GameCube)'s 1P modes with a second player. Story Mode, Select Mode, Expert Mode, and Last Story are all fully functional.

## Important
* You must set Dolphin to use 64MB of RAM to play this mod. This is done automatically if you add the `GUPE8P.ini` file. If you are playing on Wii/GameCube, you must apply the `console-compatibility-textures` variant of the mod, which reduces texture sizes to have mostly stable gameplay with only 24MB of RAM.
* WARNING: If Using the YellowAndroid MTP Animation Override code to have P2 be Sonic/Omega expect crashes. This is caused by a Partner BON matching the replaced Player BON. Example if you use Sonic's BON for P2, the game may crash on completion of Westopolis, Lethal Highway, Space Gadget, or Final Haunt. It is unknown if this can be fixed via code, instead of re-exporting animations/bon mappings.
* You can change characters. Select 2P-VS, select characters, back out to the main menu at the 1-3 round select screen. Your character choices will carry over to 2P CO-OP.

## How to play / Setup
This mod is only compatible with the NTSC-U GameCube version.

### ROM Validation
Please verify the ROM you are attempting to patch is a 1:1 ShadowTheHedgehog GameCube ISO.

GCZ/WIA/RVZ or any other format than ISO is not supported. Please convert to ISO, then compare your game to the table below.

You can convert your game by right-clicking your game in Dolphin's game list -> `Convert File...`

You can check your hashes by right-clicking your game in Dolphin's game list -> `Properties` -> `Verify` tab.

| ROM    | CRC32 Hash    | SHA-1 Hash                               |
| ------ | ------------- | ---------------------------------------- |
| NTSC-U | f582cf1e      | 5dc81ad9c97549394e30bedc252bfa37d4db1de0 |

### Summary
1. Patch your original NTSC-U ISO with the .xdelta of your choice
2. Dolphin: Ensure you placed `GUPE8P.ini`, Enabled Cheats, and set Force Aspect ratio
3. Nintendont: Ensure you are using Oversized ISO support version of Nintendont, Ensure you placed `GUPE.gct` file next to `game.iso`, In Nintendont configuration, set `Cheats ON` and `Unlock Read Speed ON`
4. Play! See below for detailed steps.

### Patching
#### Note: You need the GUPE8P.ini file for the mod to work properly, running just the ISO will not work!
1. Download [the latest release from here](https://github.com/ShadowTheHedgehogHacking/2P-ShdTH/releases) - choosing either the original aspect ratio version or the widescreen version.
2. Extract your chosen version release zip.
3. Visit https://shadowthehedgehoghacking.github.io/xdelta-wasm/ or any other xdelta3 patcher of your choice.
4. Select your original ISO as the `Source file`.
5. Select the `2P-ShdTH-[aspect]-[variant].xdelta` file you extracted as the `Patch file`.
6. Click `Apply Patch`: It will then 'download' the patched file as `ISO NAME-patched.iso` (nothing is actually uploaded/downloaded, it is all done on-device).
7. If you run into errors, likely the ISO is wrong hash for the xdelta you downloaded. Double check your original game in `Dolphin Verify` tab.
8. If you want to make additional modifications (such as CharacterMods) follow [Extra Mods](#extra-mods) 

### Dolphin
1. Get the latest Dolphin Emulator - [Dolphin 2503 or newer](https://dolphin-emu.org/download/)
2. (Optional) We recommend keeping a separate Dolphin instance just for this mod. Before launching Dolphin, create an empty file `portable.txt` in the same folder as `Dolphin.exe`
3. Launch Dolphin. On Dolphin's menu bar, click `File` -> `Open User Folder`. The folder that appears is your `<Dolphin User Folder>` in the below steps.
4. `GUPE8P.ini` from release zip needs to be moved/copied to `<Dolphin User Folder>\GameSettings\`
5. Move/Save the ISO to the Path Dolphin detects your games. A new 2P Mod Shadow entry should appear in your Dolphins game list with greater than 0 filesize and with a custom banner. Use this when playing the game. 
6. If the game does not appear as you expect, select `View` -> `Purge Game List Cache` from Dolphin's menu bar.
7. Enable Cheats in `Dolphin -> Config`. Right click the game the list and choose `Properties -> Gecko Codes` to change any configuration codes.
8. Under `Dolphin -> Config -> Advanced` enable `CPU Clock Override` and try various values (CPU dependent). I highly recommend at least `150%` if your CPU can handle it. See [Dolphin FPS optimization (CPU variable)](#dolphin-fps-optimization) 
9. Set Aspect Ratio in `Dolphin -> Graphics -> Aspect Ratio` to `Force 16:9` or `Stretch to Window`
10. (Optional) if using `Force 16:9` and you have black bars, you can enable `Crop` in `Dolphin -> Graphics -> Advanced -> Misc`
11. (Optional) Unpack the `Texture Fixes` in `<Dolphin User Folder>\Load\Textures\` (the unzipped texturepack folder should be named `GUPE8P`)
12. (Optional) To enable Custom Textures: `Dolphin -> Graphics -> Advanced` Enable `Load Custom Textures` and `Prefetch Custom Textures`
13. (Optional) If you want to use the 100% Save, place `8P-GUPE-SHADOWTHEHEDGEHOG.gci` GCI file at `<Dolphin User Folder>\GC\USA\Card A\`

### Nintendont (Wii/Wii U)
1. At time of release of v2.3c (2025/03/16) Nintendont does not officially support oversized ISOs.
2. You will need to use [this build of Nintendont instead](https://github.com/ShadowTheHedgehogHacking/Nintendont/releases) until [this PR is merged](https://github.com/FIX94/Nintendont/pull/1213). When the PR is merged, you can update your official Nintendont and switch to it.
3. If you want to customize cheats for Nintendont, use [CodeManager2](https://github.com/CLF78/CodeManager2) with GUPE8P.ini to generate your own `.gct` for Nintendont. A GCT is **required** as the split screen codes are exclusive to these.
4. Rename your patched ISO to `game.iso` and place it on your Nintendont SD or USB.
```
Copy GUPE8P.gct to the same directory as your game.iso
 e.g. USB:/games/Shadow The Hedgehog [GUPE8P] should have:
   game.iso
   GUPE8P.gct
 in the folder.
Copy 'saves' folder to root of USB or SD (same one where game is)
 Nintendont should be configured as follows for the best experience:
   Cheats ON
   Unlock Read Speed ON		
Optional:
   Memcard Emulation ON (If you want to use provided 100% save)
   Video Width (Set to whatever fills your screen without black bars, in my case it was 714)
``` 

### Dolphin FPS Optimization
`Config` -> `Advanced` -> `CPU Clock Override slider` 
```
Adjust clockspeed while running the game.
Note: Dolphin only saves this change for next run if your game is NOT running
You should find the value that runs best, close the game, then set it again.

I recommend loading in Glyphic Canyon, have one player stay at the start,
have the other go to the first area with enemies and Knuckles.
Try adjusting the slider here to reach 60fps. It will be ~30fps with default 100% clock.
    
It varies per system, some run better with underclock/overclock
	
I recommend trying 80%, 150%, 200%, 300% 
Note: Higher clockspeeds may result in audio distortions if your system can't keep up
If audio distortions occur, lower the clockspeed.
I use 300% for AMD Ryzen 9 5900X; Previously used 217% for AMD Ryzen 7 3800X, 165% for Intel i5-3570k
```

### Extra Mods
If you want to make additional modifications (such as Sonic over YellowAndroid) to the xdelta created ISO, you can follow the below extraction steps.

### Extraction of Game / FST Format
1. Open Dolphin
2. Right-click your 2P-ShdTH ISO you created in the game list
3. Select Properties
4. Select FileSystem Tab
5. Right-click "Disc"
6. Select Extract Entire Disc...
7. Select a new folder where you will store the game content and modify its files

### Replacement of Files & Converting FST to ISO
1. Open the newly extracted folder and make any additional changes you want, such as Sonic over YellowAndroid, other [CharacterMods](https://github.com/ShadowTheHedgehogHacking/CharacterMods), or any other changes you want.
REMINDER: Using Custom BON characters CAUSES MORE CRASHES - Be wary of the warning on the MTP code's description.
2. Open Dolphin
3. Open Config
4. Select Paths Tab
5. Select "Add" for Game Folders
6. Navigate to the folder where you extracted the game
7. Open the `sys` folder, and select "Select Folder"
8. Close the confirmation pane, your games list should populate a new 0 filesize game of Shadow The Hedgehog. The 0 filesize entry is the FST format game.
9. Right click the FST format game and pick `Convert File...`
10. The Convert window will appear, click "Convert..." and name it `game.iso` for Nintendont, or `2PShdTH.iso` for Dolphin.
11. Move/Save the ISO to the Path Dolphin detects your games. A new 2P Mod Shadow entry should appear in your Dolphins game list with greater than 0 filesize and with a custom banner. Use this when playing the game. 
12. If the game does not appear as you expect, in Dolphin's menu bar select `View` -> `Purge Game List Cache`.

## Credits
* dreamsyntax | Lead Developer | for starting this project/everything
* DonutStopGaming | Developer | major contributions to chunks, P3/AI partner mapping, Airbug, CoasterFix, GravitySwitchers, PlayerPointer, SuperShadow, structs analysis, and numerous other address discoveries, and much more.
* LimblessVector for his work on identifying objects, work on the initial memory list, SinglePlayer Widescreen Hack, Stray Pixel under HP Bars fix
* TheHatedGravity for red/yellow TrueBlackShadow textures, Additional work on widescreen gncp patches, HD font, v1.2+ MenuUI, v2.0 Banner, and a ton of testing
* Original Shadow vector used in banner by nibroc_rock (modified)
* Muzzarino for some symbol findings
* RaphaelDrewBoltman for the GitHub icon / HHC related textures

## Thanks
* DonutStopGaming for the many nights spent pair reversing and all the contributions to this project
* TryTwo for extremely useful new debugging features in Dolphin
* aldelaro5 & contributors for Dolphin Memory Engine
* igorseabra4 and Sewer56 for Heroes and Shadow file reversing work & editing tools (HeroesPowerPlant, HeroesONE-Reloaded, etc...)
* LimblessVector for Shadow file reversing work (HeroesPowerPlant, DME Memory List)
* TheHatedGravity, LimblessVector, Jesus_PK, Sora, Shadowth117, DonutStopGaming, SpectralStar, MainMemory, Link$$$/Polterpup, my local friends, and all the randoms I played with on Parsec for playtesting
* Heroes Hacking Central for keeping us insane during this project
* metaconstruct, UnclePunch, psiLupan, and DRGN of the SmashBoards / Melee Hacking Community for MCM and assistance with DOL expansion & modification

[Click here to learn how to build from source (not recommended for most users)](https://github.com/ShadowTheHedgehogHacking/2P-ShdTH/tree/master/workspace)