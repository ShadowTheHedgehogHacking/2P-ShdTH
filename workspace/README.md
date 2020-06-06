## Source code for the mod / process

`dreamsyntax-notes.txt` was not intended for others.
Contains addresses I (dreamsyntax) found that are interesting and my process (if you can follow my notes).
As time went on the notes got more consistent/better and are more readable.

[GUPE8P.map](https://github.com/ShadowTheHedgehogHacking/shadow-disasm-and-dmw) is our latest self-defined symbols for Shadow The Hedgehog (US).

The `*.dmw` files are memory list files for Shadow The Hedgehog (US), which can be opened with [aldelaro5's Dolphin Memory Engine](https://github.com/aldelaro5/Dolphin-memory-engine)

Note: The .dmw files and symbols have moved to [shadow-disasm-and-dmw](https://github.com/ShadowTheHedgehogHacking/shadow-disasm-and-dmw)

Other misc files may be brief codes or descriptions used while trying to understand the game

Research files and struct definitions are by DonutStopGaming

# HOW TO CONTRIBUTE
## Setup / Getting Started

### Download/Verification
1. Build our fork of dolphin OR Get latest [dolphin-5.0-8930 or newer](https://dolphin-emu.org/download/)
2. Before launching dolphin, create an empty file

   `portable.txt` in the same folder as Dolphin.exe
3. Ensure you have the US version of ShadowTheHedgehog with md5:

   `fc936c9b0144c925b45b805fd39da2ac`
   
### Extraction of Game / FST Format
1. Open Dolphin
2. Right-click Shadow The Hedgehog in the game list
3. Select Properties
4. Select FileSystem Tab
5. Right-click "Disc"
6. Select Extract Entire Disc...
7. Select the folder where you will store the game content and modify its files

### Configuration of Dolphin
** IT IS RECOMMENDED YOU USE OUR DOLPHIN BUILD in the main repo with TryTwo's additional debugger features 
1. Open Dolphin
2. Select Configuration
3. Select Paths Tab
4. Select "Add" for Game Folders
5. Navigate to the folder where you extracted the game
6. Open the `sys` folder, and select "Select Folder"
7. Close the confirmation pane, your games list should populate a new 0 filesize game of Shadow The Hedgehog
   Where the 0 filesize entry is the FST format game.
8. Close Dolphin
9. Add -d to launch options on shortcut
10. Open Dolphin - note the new buttons.
11. Select 'View' in the menu bar and pick the things you need (Code, breakpoints, registers is a good start)

### Other
Use [aldelaro5's Dolphin Memory Engine](https://github.com/aldelaro5/Dolphin-memory-engine) instead of Dolphin's built in cheat-search/cheatengine.


I recommend building the latest master, but 0.5.0 is fine.

### ASM Editing/Gecko Codes
In Dolphin to generate the known GameCube symbols etc that aren't game specific:
1. Launch Game
2. Select Symbols submenu
3. Generate Symbols From...
4. Signature Database 


Note these symbols may be incorrect but it helps to have a few named even if they are wrong.

Be sure to grab our latest map for Shadow The Hedgehog linked above, the file is GUPE8P.map

Place it in the `Dolphin/user/maps` folder


Watch this video series if you aren't familiar with gecko/editing


https://www.youtube.com/watch?v=IOyQhK2OCs0&list=PL6GfYYW69Pa2L8ZuT5lGrJoC8wOWvbIQv
