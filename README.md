<div align="center"><h1>2 Player Shadow The Hedgehog</h1></div>


## About
This project aims to get 2 Players working in Shadow The Hedgehog (GameCube)'s 1P modes.
Story Mode, Select Mode, Expert Mode, Last Story.

## Currently working on:
* Display P2 UI components (Ring count, Ammo count)
* Layout objects load when P2 is within render distance
* nukkoro2.inf spawn positions for every level

## Problems
* Some levels default spawn positions cause instant death for P2
* Layout objects only load in when P1 is within render distance
* Certain vehicles alter P1's camera if P2 uses it
* Turrets alter P1's camera if P2 uses it
* Some segments where a vehicle is required will not have enough distance to cause a respawn
* Segments with automated spline sections (e.g. hang-rail in Circus Park) leaves other player behind
* Warphole object leaves other player behind
* Chaos control will leave other player behind; if P2 activates P1's camera is altered
* Gravity switches on Space Gadget only alter P1's gravity
* Level chunks load/unload based on P1 only

