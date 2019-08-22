# Note that the new method for use in v2.0 will be a downscale on all enemy/gdt/stage textures in the game instead of per-stage.

## Buffer(s) Issue Identification

So far three buffers have been confirmed via the PS2 executable :
* GLOBAL
* EVENT
* ETC


Overflowing for the types:

* GLOBAL (Texture) = May crash during play or if level completes successfully RankUI will not draw. After this occurs the game is unstable. Next levels may crash at any time
* AUDIO = Just causes distorted audio while too many sound sources are playing. No adverse effect. Unknown if related to 3 buffers
* EVENT = May crash during EVENT cutscene or after reaching a Goal (after Fade to white on mission completion)
* ETC (Effects) = Same crash type as GLOBAL (Texture)
#### Glyphic Canyon
* Solution: NOT NEEDED
* AUDIO
#### Lethal Highway
* Solution: 32x32 for tile, 1/2 for all other
* GLOBAL (Texture)
#### Circus Park
* Solution: 32x32 for tile, 1/2 for all others
* GLOBAL (Texture)
#### Central City
* Solution: 32x32 DXT1 (XBOX TEX)
* GLOBAL (Texture)
* EVENT (StoryMode Intro & GoalEvent)
#### The Doom
* Solution: 32x32 for non-anim, 1/2 for screens
-> Attempt 1 FAILED
* ETC (Effects)
#### Sky Troops
* Solution: NOT NEEDED
* AUDIO
#### Lost Impact
* Solution: 32x32 for non-anims, 1/2 for screens, skybox
-> Attempt 1 FAILED (need more reduction)
* GLOBAL (Texture)
* AUDIO
#### GUN Fortress
* Solution: 32x32 stage GDT, reduce textures over 64x64, w Attempt 1 changes
-> Attempt 1 FAILED / Attempted: 32x32, Divide by 2 for same-ratio, reduce textures over 64x64
* GLOBAL (Texture)
* EVENT (GoalEvent)
#### Black Comet
* Solution: 32x32, reduce textures over 64x64
* EVENT (GoalEvent)
#### Cosmic Fall
* Solution : 32x32, half large except earth, and 32x32 GDT
* GLOBAL (Texture)
#### Final Haunt
* Solution: 32x32, reduce textures over 64x64
* EVENT (GoalEvent)
#### Last Way
* Solution: 32x32, reduce textures over 64x64
* GLOBAL (Texture)