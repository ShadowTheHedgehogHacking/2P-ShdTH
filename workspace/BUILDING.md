# How to Build From Scratch without XDELTA
This mod is modular, so we combine the below when creating a release:
1. 2P-ShdTH (this repo)
2. [shadow-model-fixes](https://github.com/ShadowTheHedgehogHacking/shadow-model-fixes)
3. [Widescreen-ShadowTH](https://github.com/ShadowTheHedgehogHacking/Widescreen-ShadowTH) (for non-original aspect editions)
4. If you are playing on Wii/GameCube, you must also apply the `console-compatibility-textures` branch, which reduces texture sizes to have mostly stable gameplay with only 24MB of RAM. Apply it last.

### Building the ISO / Setting up Dolphin
1. Get the latest release or dev Dolphin - [Dolphin 2503 or newer](https://dolphin-emu.org/download/)
2. Before launching dolphin, create an empty file
   `portable.txt` in the same folder as Dolphin.exe
3. Ensure you have the US version of ShadowTheHedgehog:
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
This should not be necessary as we ship a patched `main.dol` in the repo and in release builds. However, this is how we would create the `main.dol` from scratch.
1. Download MCM (Melee Code Manager) if you haven't: https://github.com/DRGN-DRC/Melee-Code-Manager/releases
2   . You will need to overwrite configurations to make it work with Shadow. After extracting v4.4.1 or newer:
In `\Original DOLs` place your ORIGINAL game's `main.dol` from `YourExtractedGame\sys` (not the overwritten one, re-extract it if needed) in this folder, renaming as `NTSC 1.06.dol`.
In `\lib` place/overwrite the `settings.py` from the repo's `\code\MCM`
In `\Mods Library` place the .txt files from the repo's `\code\MCM`
9. Launch MCM. Select your built ISO from step 6. It should show the currently enabled codes across the four files.
Note: You can open the original game, which will then ask what version is the ROM. Specify 1.06 if ever asked. Note it will MODIFY the ISO that you pick with a MCM header declaring this version, so be sure to only use copies!
10. Place the `\code\GUPE8P.ini` file in `\GameSettings` of your `Dolphin User Folder`. You can find your `Dolphin User Folder` by launching Dolphin and clicking `File` on the menu bar, then `Open User Folder`.


-- TODO: Move this somewhere else

### Things to be fixed in v2.3
* Super P2 has transparent/missing skin data on DevilDoom until P2 dies and respawns | DONE - Partial (forced death on init)
* Story Mode Route Menu (Y button when paused) remaps control to P1 until pause is closed
* Checkpoint Bonus (Rings, Bubble, Lives) are based off P1's ring count if P2 activates checkpoint
* If ChaosPoints are at 0, Dark/Hero orbs only activate P1's ChaosPowers
* P2 can properly interact with helicopters | DONE
* Vibration for P2
* Rework core respawning to be based on independent respawns | DONE
* Remove 'game pause' on either player respawning
* Fix some independent respawn cases (downward rail and dark spline) | DONE
* Space Gadget gravity switcher rework | DONE (has one issue remaining with checkpoint warping)
* Boss cameras will act as the original game for both players | PARTIAL
* Player Targetting Preference Setting (ex: P1 can homing attack P2, and will aim at P2) | DONE
* CC/CB EventsCamera (Maybe)
* Devil Doom warping too frequently | DONE
* Checkpoint Warping System Reworked to allow other player unaffected | PARTIAL
* Fadescreen Added for most cases without interrupting play session with Independent Respawns | DONE
* Independent Chunk Culling / Overlap (Unlikely - but will attempt)

### Other Known Issues (Not planned to be fixed)
* P2 spawns according to nukkoro2.inf initially fine, but on restart seems to occasionally be off by +-5 - +-20 (stage dependent, game bug)
* Rare instance has been recorded where P1 uses a rocket but the rocket never takes off (state issue?)
* Phase 2 Warp for P2 in Diablon Boss
* Item Bubbles / Hint Bubbles content render based on P1's camera's relative location