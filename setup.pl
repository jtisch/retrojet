#!/usr/bin/perl
#
# Setup script for retrojet
#
use strict;
use warnings;

# goo for common stuff for my retro scripts
require "$ENV{RETROJET_HOME}/retrojet/retrojet.pl";
our ($MEDIA_PATH, $GEEQIE_GEOMETRY, $GEEQIE_PATH, $USE_SEC_MON);

# get home folder
my $HOMEDIR = $ENV{HOME};
print "Current user home folder: $HOMEDIR\n";

# change permissions on scripts
print "Setting executable rights for scripts\n";
system("chmod +x $HOMEDIR/RetroPie/retrojet/es-*");

# create symbolic links
print "Creating symbolic links for scripts\n";
system("ln -s $HOMEDIR/RetroPie/retrojet/es-game-select.pl $HOMEDIR/.emulationstation/scripts/game-select/es-game-select.pl");
system("ln -s $HOMEDIR/RetroPie/retrojet/es-quit.pl $HOMEDIR/.emulationstation/scripts/quit/es-quit.pl");
system("ln -s $HOMEDIR/RetroPie/retrojet/es-screensaver-game-select.pl $HOMEDIR/.emulationstation/scripts/screensaver-game-select/es-screensaver-game-select.pl");
system("ln -s $HOMEDIR/RetroPie/retrojet/es-system-select.pl $HOMEDIR/.emulationstation/scripts/system-select/es-system-select.pl");

exit 0;
