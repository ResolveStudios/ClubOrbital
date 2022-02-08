This script was created by Reimajo and is sold at https://reimajo.booth.pm/
Please don't share or redistribute these asset files in any way.
Only use them within your own VRChat worlds after you paid for them.

Watch this video tutorial first: https://www.youtube.com/watch?v=OqEmOEOdMp8
This will explain how to set everything up.

Make sure to join my discord to receive update notifications, additional information 
and help for this asset: https://discord.gg/SWkNA394Mm

############################################################################
There is an online version of this documentation here which explains everything in full detail:
https://docs.google.com/document/d/1uN9viZNUo8AzQV6CKFMLwx4qPgSEsB0gNTUVLWVxPu0
############################################################################

If you have any issues, please contact me on Discord (https://discord.gg/SWkNA394Mm) 
or on Booth or on Twitter https://twitter.com/ReimajoChan

There is a sample scene included which shows the general setup. 
Simply copy the Object from this scene into your own scene as shown in the tutorial video.


The code documentation can be found by hovering with the cursor above a field in the Inspector in case you bought the script version and inside the script itself.

-------------------------------------------------------------------------------------------------------------------

Documentation: https://docs.google.com/document/d/1uN9viZNUo8AzQV6CKFMLwx4qPgSEsB0gNTUVLWVxPu0

-------------------------------------------------------------------------------------------------------------------

Please make sure you have the newest SDK3-Worlds (https://vrchat.com/home/download) and UdonSharp (https://github.com/Merlin-san/UdonSharp/releases/latest) imported into your project. In case you need to update your SDK or UdonSharp, please follow these steps:

0. Enter Playmode in each scene. If there are compile errors, remove the scripts that have an issue first.

1. Close the scene (e.g. by opening a new empty scene instead) and then close Unity (and Visual Studio if you have it open)

2. Backup your whole Unity Project folder, e.g. by zipping it

3. Delete the following files in "Assets":
```
VRCSDK.meta
VRChat Examples.meta
Udon.meta
UdonSharp.meta
```

4. Delete those folders in "Assets":
```
VRCSDK
VRChat Examples
Udon
UdonSharp
```

5. Open the project in Unity, ignore the console errors, DON'T open your world scene

6. Import newest VRCSDK3 for worlds (https://vrchat.com/home/download)

7. Import newest UdonSharp package (https://github.com/Merlin-san/UdonSharp/releases/latest)

8. Enter playmode in each of your world scenes now (!)


