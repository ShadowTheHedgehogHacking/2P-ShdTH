<div align="center"><h1>2 Player Shadow The Hedgehog</h1>
<img src="https://raw.githubusercontent.com/ShadowTheHedgehogHacking/2P-ShdTH/master/res/main_banner.png" align="center" />
</div>

## About
This project aims to get 2 Players working in Shadow The Hedgehog (GameCube)'s 1P modes.

Story Mode, Select Mode, Expert Mode, Last Story.

## Level Status
![Current Level Map](./res/level_status.png)

## Road to 2.0 (WIP)
* Verify 1:1 misc bytes for level edits per HPP v0.7.5 [BLOCKED, WAIT FOR HPP v0.7.6, FOUND BUG]
* Fix Air bug - (player state pointer overlap issue)
* Space Gadget, Devil Doom, Zipline/Pulleys fixed
* Turrets attach to correct player's camera
* Vehicles map to correct player's controlpad and camera [PARTIAL]
* Checkpoint Warping/Backtracking warps both players
* Key Door trigger patch for P2 [DONE]
* Fix "ChaosPowers activate for both players" - add underflow check [DONE]
* Fix "Disable ScreenShake" - (occasional endless shake issue) [DONE]
* Partner does not despawn if P1 is not in range of "RW:Range" activation patch for P2 [DONE]
* All bosses are free-cam [DONE]
* Circus Park Hero Mission counts P2's rings [DONE]
* GUN Fortress Security Camera segments are free-cam [DONE]
* Culling issue for P2's screen when near force-fields / or near Vacuum effect (effect removed) [DONE]
* **Buffer crash research / possible crash reductions if possible

## Problems
* Checkpoint Warping/Backtracking only moves P1
* Segments with automated spline sections (e.g. hang-rail in Circus Park) leaves other player behind, only activates on P1
* Gravity switches on Space Gadget only alter P1's gravity
* Air bug (occasionally P1 or P2 will be stuck in the floating state until hurt when activating a wind tunnel) - Break out with Chaos Blast or move back to the source of the wind
* CarType vehicles only map to P1's control pad
* Turrets alter P1's camera if P2 uses it
* SuperShadow only activates for P1
* If Dark Partner is activated first, P3 remapping fails
* Some triggers (see Westopolis) do not react to P2
* Worm Enemies will only target P1
* Heavy Dog / Blue Falcon do not damage P2

## Done so far:
* Level chunks load/unload based on both players* (crashes seem to be TextureBuffer related)
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
* Vehicles no longer alter P1's camera if P2 uses it
* Key Doors react to P2


## Other Known Issues (Not planned to be fixed)
* P2 spawns according to nukkoro2.inf initially fine, but on restart seems to occasionally be off by +-5 - +-20 (stage dependent, game bug)
* Item Bubbles / Hint Bubbles content render based on P1's relative location

## Bonus Roadmap
* Individual death-to-checkpoint / Don't reload level for both players
* Static weapon swaps for Metal Androids
* FriendlyFire Enable/Disable
* WeaponsTargeting & HomingAttack Other Player Enable/Disable

## Dev
* dreamsyntax
* DonutStopGaming

## Credits
* DonutStopGaming for major contributions to chunks, P3/AI partner mapping, and other address discoveries
* LimblessVector for his work on identifying objects and his initial large memory list
* Includes `True Black Shadow` by TheHatedGravity
* Includes `Rouge over YellowAndroidShadow` by Shadowth117
* SinglePlayer Widescreen Hack by LimblessVector
* Infinite Lives by Link Master
* Chaos Powers Activators by Zzetti 

## Thanks
* igorseabra4 and Sewer56 for Heroes and Shadow editing tools (HeroesPowerPlant, HeroesONE-Reloaded, etc...)
* DonutStopGaming for ideas while function hunting
* TryTwo for extremely useful new debugging features in Dolphin
* TheHatedGravity, LimblessVector, Shadowth117, DonutStopGaming, my local friends, and all the randoms I played with on Parsec for playtesting
* DeadlyFugu, Muzzarino
* Heroes Hacking Central (&Shadow)