# How to Build From Scratch without XDELTA
This mod is modular, so we combine the below when creating a release:
1. 2P-ShdTH (this repo) - Steps listed in [Applying 2P-ShdTH To A Clean ISO](#applying-2p-shdth-to-a-clean-iso); Note: Use MCM on original ISO first before steps 2-4.
2. [shadow-model-fixes](https://github.com/ShadowTheHedgehogHacking/shadow-model-fixes)
3. [shadow-event-fixes](https://github.com/ShadowTheHedgehogHacking/shadow-event-fixes)
4. [Widescreen-ShadowTH](https://github.com/ShadowTheHedgehogHacking/Widescreen-ShadowTH) (for non-original aspect editions)
5. If you are playing on Wii/GameCube, you must also apply the `console-compatibility-textures` branch, which reduces texture sizes to have mostly stable gameplay with only 24MB of RAM. Apply it last.

### Applying 2P-ShdTH To A Clean ISO
1. [Extract the Game](https://github.com/ShadowTheHedgehogHacking/2P-ShdTH?tab=readme-ov-file#extraction-of-game--fst-format)
2. Open the newly extracted folder and merge/overwrite the `sys` and `files` files with the two folders in `ISO EDITS`.
3. Apply other mods (shadow-model-fixes, Widescreen-ShadowTH)
3. [Repack the Game to ISO](https://github.com/ShadowTheHedgehogHacking/2P-ShdTH?tab=readme-ov-file#replacement-of-files--converting-fst-to-iso)
4. Use MCM (below) if needing to customize embedded codes.

### Customizing DOL Injected Codes / Patching a fresh .dol
This should not be necessary as we ship a patched `main.dol` in the repo. However, this is how we would create the `main.dol` from scratch.
1. Download MCM (Melee Code Manager) if you haven't: https://github.com/DRGN-DRC/Melee-Code-Manager/releases
2. You will need to overwrite configurations to make it work with Shadow. After extracting v4.4.1 or newer:
In `\Original DOLs` place your ORIGINAL game's `main.dol` from `YourExtractedGame\sys` (not the overwritten one, re-extract it if needed) in this folder, renaming as `NTSC 1.06.dol`.
In `\lib` place/overwrite the `settings.py` from the repo's `\code\MCM`
In `\Mods Library` place the .txt files from the repo's `\code\MCM`. It is also recommended to grab the [ShdTH-Reloaded](https://github.com/ShadowTheHedgehogHacking/ShdTH-Reloaded/tree/master/code/MCM) repo's `\code\MCM` too, just to ensure cross-code references are working as expected. NOTE: Do not overwrite existing MCM configs from 2P-ShdTH, as the shared common file may be outdated for Reloaded.
3. Launch MCM. Select your built ISO from step 6. It should show the currently enabled codes across the four files.
Note: You can open the original game, which will then ask what version is the ROM. Specify 1.06 if ever asked. Note it will MODIFY the ISO that you pick with a MCM header declaring this version, so be sure to only use copies!
4. Place the `\code\GUPE8P.ini` file in `\GameSettings` of your `Dolphin User Folder`. You can find your `Dolphin User Folder` by launching Dolphin and clicking `File` on the menu bar, then `Open User Folder`.