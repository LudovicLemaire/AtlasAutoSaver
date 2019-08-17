# AtlasAutoSaver
An AutoSave program on Atlas for SoloPlayer.




**DESCRIPTION**


Each X minutes, the program will copy your SoloPlayer save folder into a backup folder with the current time as name.

It allows you to use theses back-up if you destoyed everything with an inentended command, or a mod that wasn't loaded so everything related to it is destroyed, or any others sad story.




**HOW TO USE**

Open the config.ini, then set :
  - your game path
  - your different save folders (the basic one is your current save folder, the backup one is where you want to save your backups)
  - time between each new backup, in minutes
 
 *(more infos on them below)*
  
I set default value in .ini as if your game was in C:\
With a new backup created every 15 minutes.

Once you set the different paths, launch AtlasAutoSaver.exe.

This will ask you if you want to save Ocean or Blackwood, then it will launch the game and save every X minutes.

The program will check if the game is running before each new save, and will Exit if not.




**.INI INFO**

*blackwoodSaveFolderPath* is the path of your current Blackwood save folder.

*blackwoodBackupFolderPath* is where you want to store your Blackwood backups.

*oceanSaveFolderPath* is the path of your current Ocean save folder.

*oceanBackupFolderPath* is where you want to store your Ocean backups.

*gamePath* is where Atlas is, should be "..\AtlasGame.exe".

*saveTime* is time between each new save, in minutes.
