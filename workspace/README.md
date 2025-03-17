# How to Build From Scratch without XDELTA
This mod is modular, so we combine the below when creating a release:
1. 2P-ShdTH (this repo) - Merge `ISO EDITS`
2. [shadow-model-fixes](https://github.com/ShadowTheHedgehogHacking/shadow-model-fixes)
3. [Widescreen-ShadowTH](https://github.com/ShadowTheHedgehogHacking/Widescreen-ShadowTH) (for non-original aspect editions)
4. If you are playing on Wii/GameCube, you must also apply the `console-compatibility-textures` branch, which reduces texture sizes to have mostly stable gameplay with only 24MB of RAM. Apply it last.

### Building the ISO / Setting up Dolphin
1. Get the latest release or dev Dolphin - [Dolphin 2503 or newer](https://dolphin-emu.org/download/)
2. Before launching dolphin, create an empty file
   `portable.txt` in the same folder as Dolphin.exe
3. Ensure you have the NTSC-U version of ShadowTheHedgehog:
	* Right click the game in Dolphin, click Properties.
	* Click the Verify tab. Click Verify Integrity.
	* Hash should match this: 
	* CRC32: `f582cf1e`
	* or
	* SHA-1: `5dc81ad9c97549394e30bedc252bfa37d4db1de0`
   
### Extraction of Game / FST Format
1. Open Dolphin
2. Right-click Shadow The Hedgehog in the game list
3. Select Properties
4. Select FileSystem Tab
5. Right-click "Disc"
6. Select Extract Entire Disc...
7. Select a new folder where you will store the game content and modify its files

### Replacement of Files & Converting FST to ISO
1. Open the newly extracted folder and merge/overwrite the `sys` and `files` files with the two folders in `ISO EDITS`.
2. Make any additional changes you want (ex: Sonic over YellowAndroid, other [CharacterMods](https://github.com/ShadowTheHedgehogHacking/CharacterMods), or any other changes you want. REMINDER: THIS CAUSES MORE CRASHES - Be wary of the warning on the MTP code's description.
3. Open Dolphin
4. Open Config (next to Graphics and Controllers)
5. Select Paths Tab
6. Select "Add" for Game Folders
7. Navigate to the folder where you extracted the game
8. Open the `sys` folder, and select "Select Folder"
9. Close the confirmation pane, your games list should populate a new 0 filesize game of Shadow The Hedgehog. The 0 filesize entry is the FST format game.
10. Right click the FST format game and pick `Convert File...`
11. The Convert window will appear, click "Convert..." and name it `game.iso` for Nintendont, or `2PShdTH.iso` for Dolphin.
12. Move/Save the ISO to the Path Dolphin detects your games. A new 2P Mod Shadow entry should appear in your Dolphins game list with greater than 0 filesize and with a custom banner. Use this when playing the game. 
13. If the game does not appear as you expect, in Dolphin's menu bar select `View` -> `Purge Game List Cache`.

### Customizing DOL Injected Codes / Patching a fresh .dol
This should not be necessary as we ship a patched `main.dol` in the repo. However, this is how we would create the `main.dol` from scratch. Also not the `main.dol` is the Widescreen Edition, it would be necessary to use MCM to disable this for Original Aspect editions.
1. Download MCM (Melee Code Manager) if you haven't: https://github.com/DRGN-DRC/Melee-Code-Manager/releases
2   . You will need to overwrite configurations to make it work with Shadow. After extracting v4.4.1 or newer:
In `\Original DOLs` place your ORIGINAL game's `main.dol` from `YourExtractedGame\sys` (not the overwritten one, re-extract it if needed) in this folder, renaming as `NTSC 1.06.dol`.
In `\lib` place/overwrite the `settings.py` from the repo's `\code\MCM`
In `\Mods Library` place the .txt files from the repo's `\code\MCM`. It is also recommended to grab the [ShdTH-Reloaded](https://github.com/ShadowTheHedgehogHacking/ShdTH-Reloaded/tree/master/code/MCM) repo's `\code\MCM` too, just to ensure cross-code references are working as expected. NOTE: Do not overwrite existing MCM configs from 2P-ShdTH, as the shared common file may be outdated for Reloaded.
9. Launch MCM. Select your built ISO from step 6. It should show the currently enabled codes across the four files.
Note: You can open the original game, which will then ask what version is the ROM. Specify 1.06 if ever asked. Note it will MODIFY the ISO that you pick with a MCM header declaring this version, so be sure to only use copies!
10. Place the `\code\GUPE8P.ini` file in `\GameSettings` of your `Dolphin User Folder`. You can find your `Dolphin User Folder` by launching Dolphin and clicking `File` on the menu bar, then `Open User Folder`.

