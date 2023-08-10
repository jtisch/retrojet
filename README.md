# retrojet

A set of perl scripts for RetroPie & EmulationStation (ubuntu/x86 and Raspberry Pi)

Things it does ..

- Turns a 2nd monitor into a marquee display. Displays any artwork you wish on a 2nd monitor during game selection and screensaver cycling.

![(https://github.com/jtisch/retrojet/webimages/dkong.jpg)](https://github.com/jtisch/retrojet/blob/main/webimages/dkong.jpg)
![[gng](https://github.com/jtisch/retrojet/webimages/gng.jpg)](https://github.com/jtisch/retrojet/blob/main/webimages/gng.jpg)
![https://github.com/jtisch/retrojet/blob/main/webimages/frogger.jpg](https://github.com/jtisch/retrojet/blob/main/webimages/frogger.jpg)
![https://github.com/jtisch/retrojet/blob/main/webimages/mame.jpg](https://github.com/jtisch/retrojet/blob/main/webimages/mame.jpg)

No modifications to EmulationStation, simply inserts into new and existing systems.

* The scripts were developed under RetroPie x86 but they should work on a regular pi with simple config changes, feedback welcome.

## Install

# Dependencies

1. [geeqie](https://github.com/BestImageViewer/geeqie) - Image viewer used. Check your distro it migfht already be included.

### Download

First checkout to your RetroPie root folder.

1. `cd ~/RetroPie`
2. `git clone https://github.com/jtisch/retrojet`

### Add environment variable

1. Add an environment vairable called "RETROJET_HOME" which points to your RetroPie root folder. This is usually your home folder + RetroPie IE: /home/user/RetroPie. This can be set by updating your ~/.bashrc file.

### Copy media files

1. `cp -Rv ~/RetroPie/retrojet/media <your media location>`

### Symlinks

1. `cd ~/.emulationstation/scripts/game-select`
2. `ln -s ~/RetroPie/retrojet/es-game-select.pl es-game-select.pl`

1. `cd ~/.emulationstation/scripts/quit`
2. `ln -s ~/RetroPie/retrojet/es-quit.pl es-quit.pl`

1. `cd ~/.emulationstation/scripts/screensaver-game-select`
2. `ln -s ~/RetroPie/retrojet/es-screensaver-game-select.pl es-screensaver-game-select.pl`

1. `cd ~/.emulationstation/scripts/system-select`
2. `ln -s ~/RetroPie/retrojet/es-system-select.pl es-system-select.pl`
