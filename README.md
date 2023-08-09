# retrojet

A set of perl scripts for RetroPie & EmulationStation (ubuntu/x86 and Raspberry Pi)

Things it does ..

- Turns a 2nd monitor into a marquee display

![dkong](https://github.com/jtisch/retrojet/webimages/dkong.jpg)

The main reason I wrote these scripts was because previous tools I found required modifications to EmulationStation itself which is not necessary. These scripts run entirely using the built in events already available in EmulationStation to the end user.

The scripts were developed under RetroPie x86 but they should work on a regular pi with simple config changes, feedback welcome.

## Install

First checkout to your RetroPie root folder.

1. `cd ~/RetroPie`
2. `git clone https://github.com/jtisch/retrojet;`

### Symlinks

1. `cd /opt/retropie/configs/all`
2. `ln -s /home/<user>/RetroPie/retrojet/runcommand-onend.pl runcommand-onend.pl`
3. `ln -s /home/<user>/RetroPie/retrojet/runcommand-onstart.pl runcommand-onstart.pl`

1. `cd ~/.emulationstation/scripts/game-select`
2. `ln -s /home/<user>/RetroPie/retrojet/es-game-select.pl es-game-select.pl`

1. `cd ~/.emulationstation/scripts/quit`
2. `ln -s /home/<user>/RetroPie/retrojet/es-quit.pl es-quit.pl`

1. `cd ~/.emulationstation/scripts/screensaver-game-select`
2. `ln -s /home/<user>/RetroPie/retrojet/es-screensaver-game-select.pl es-screensaver-game-select.pl`

1. `cd ~/.emulationstation/scripts/system-select`
2. `ln -s /home/<user>/RetroPie/retrojet/es-system-select.pl es-system-select.pl`
