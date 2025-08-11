# Sourcecode

This entire mod was created in pure PPC ASM. C/C++/Python does not power this mod. GitHub reports this repo as 'Python' because of the single MCM configuration override.
MCM is just a tool to make injecting our mods directly into the dol easier.

Contains some of the raw assembly written while creating codes for this mod. I never properly documented/saved/pushed this, and instead we workshopped in chat channels typically.
For the latest real code, you can use CodeWrite - https://github.com/TheGag96/CodeWrite and convert from MCM file directly to ASM.
You just need to write it as:
```
C2[injection address without the first two bits] 99999999
[rest of code here]
```
Then press the reverse conversion button to get ASM from the code.

This will have some but not all codes, where I could salvage the original instructions.