#!/usr/bin/perl
#########################################
# Emulationstation - quit script
# Created by: John Tisch
#########################################
use strict;
use warnings;

# goo for common stuff for my retro scripts
require "$ENV{RETROJET_HOME}/retrojet/retrojet.pl";
our ();

#################################
# short circuit if no 2nd monitor
# ###############################
if ($USE_SEC_MON == 0) {
        exit 0;
}
