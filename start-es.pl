#!/usr/bin/perl
#
# Script that starts up emulationstation
#
use strict;
use warnings;

# goo for common stuff for my retro scripts
require "$ENV{RETROJET_HOME}/retrojet/retrojet.pl";
our ($SCRIPT_PATH, $MEDIA_PATH, $GEEQIE_GEOMETRY, $GEEQIE_PATH, $USE_SEC_MON);

# force a sleep to prevent es going into background
print "Delay 2 seconds ...\n";
sleep (2);

# kill/start marquee viewer
print "Close any instances of geeqie ...\n";
system("killall -s HUP $GEEQIE_PATH");
if ($USE_SEC_MON eq 1) {
	print "Open geeqie with default image ...\n";
	system("$GEEQIE_PATH --geometry=$GEEQIE_GEOMETRY -t -f \"$MEDIA_PATH/system/titles/arcade.png\" &");
}

# force a sleep to prevent ES going into background
print "Delay 2 seconds ...\n";
sleep (2);

# start EmulationStation
print "Starting EmulationStation ...\n";
system("gnome-terminal --full-screen --hide-menubar -- emulationstation");
