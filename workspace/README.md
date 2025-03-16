## Source code for the mod / process

`dreamsyntax-notes.txt` was not intended for others.
Contains addresses I thought were interesting while exploring this game and my process (if you can follow my notes).
As time went on the notes got more consistent/better and are more readable. I would recommend steering away from this file and instead reference the below resources.

[GUPE8P.map](https://github.com/ShadowTheHedgehogHacking/shadow-disasm-and-dmw) is our latest self-defined symbols for Shadow The Hedgehog (NTSC-U).

The `*.dmw` files are memory list files for Shadow The Hedgehog (NTSC-U), which can be opened with [aldelaro5's Dolphin Memory Engine](https://github.com/aldelaro5/dolphin-memory-engine)

Note: The .dmw files and symbols have moved to [shadow-disasm-and-dmw](https://github.com/ShadowTheHedgehogHacking/shadow-disasm-and-dmw)

Other misc files may be brief codes or descriptions used while trying to understand the game

Early research files and struct definitions are a collaboration between LimblessVector / dreamsyntax/ DonutStopGaming

## Setup / Getting Started

### Download/Verification
1. Get the latest beta or dev Dolphin - [Dolphin 2503 or newer](https://dolphin-emu.org/download/)
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
7. Select the folder where you will store the game content and modify its files

### Configuration of Dolphin
1. Open Dolphin
2. Select Config
3. Select Paths Tab
4. Select "Add" for Game Folders
5. Navigate to the folder where you extracted the game
6. Open the `sys` folder, and select "Select Folder"
7. Close the confirmation pane, your games list should populate a new 0 filesize game of Shadow The Hedgehog. The 0 filesize entry is the FST format game.
8. Open Dolphin Config (next to Graphics and Controllers)
9. Click Interface on the Config settings window
10. Enable "Show Debugging UI", then close the window.
11. Select 'View' in the menu bar and pick the things you need (Code, breakpoints, registers is a good start)

### Other
Use [aldelaro5's Dolphin Memory Engine](https://github.com/aldelaro5/dolphin-memory-engine) instead of Dolphin's built in cheat-search/or cheatengine.

### ASM Editing/Gecko Codes
In Dolphin to generate the known GameCube symbols etc that aren't game specific:
1. Launch Game
2. Select Symbols submenu
3. Generate Symbols From...
4. Signature Database 


Note these symbols may be incorrect but it helps to have a few named even if they are wrong.

Be sure to grab our latest map for Shadow The Hedgehog linked above, the file is GUPE8P.map

Place it in the `<dolphin path>\User\Maps` folder. If it is not there/you cannot find it:
1. Launch Dolphin, and in the menu bar...
2. File -> Open User Folder


Watch this video series if you aren't familiar with gecko/editing


https://www.youtube.com/watch?v=IOyQhK2OCs0&list=PL6GfYYW69Pa2L8ZuT5lGrJoC8wOWvbIQv
or
https://youtu.be/vM4FFOI_UDI?list=PLlrnYXAhZBm1Y8pvPm9llnHIgHiEzwGQC
