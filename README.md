# retrojet

A set of perl scripts for RetroPi & EmulationStation (ubuntu/x86 and Raspberry Pi)

Things it does ..

- Turns a 2nd monitor into a marquee display

The main reason I wrote these scripts was because previous tools I found required modifications to EmulationStation itself which is not necessary. These scripts run entirely using the built in events already available in EmulationStation to the end user.

The scripts were developed under Retropi x86 but they should work on a regular pi with simple config changes, feedback welcome.

## Install

First checkout to your RetroPie root folder.

`cd ~/RetroPie;
git clone https://github.com/jtisch/retrojet`

symlinks

`cd /opt/retropie/configs/all
ln -s /home/<user>/RetroPie/retrojet/runcommand-onend.pl runcommand-onend.pl
ln -s /home/<user>/RetroPie/retrojet/runcommand-onstart.pl runcommand-onstart.pl`

`cd ~/.emulationstation/scripts/game-select
ln -s /home/<user>/RetroPie/retrojet/es-game-select.pl es-game-select.pl`

`cd ~/.emulationstation/scripts/quit
ln -s /home/<user>/RetroPie/retrojet/es-quit.pl es-quit.pl`

`cd ~/.emulationstation/scripts/screensaver-game-select
ln -s /home/<user>/RetroPie/retrojet/es-screensaver-game-select.pl es-screensaver-game-select.pl `

`cd ~/.emulationstation/scripts/system-select
ln -s /home/<user>/RetroPie/retrojet/es-system-select.pl es-system-select.pl`
