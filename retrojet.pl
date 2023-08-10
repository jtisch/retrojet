#!/usr/bin/perl
#
# Main cheezy script include for retrojet system
#
use strict;
use warnings;

# auto flush prints
STDOUT->autoflush(1);

# These are the "exportable" common variables
=cut
our ($BASE_PATH, $RP_PATH, $ROM_PATH, $GL_PATH, $SCRIPT_PATH, $MEDIA_PATH, $GEEQIE_GEOMETRY, $GEEQIE_PATH, $SOURCE_PATH, $USE_SEC_MON, $SEC_MON_POS, $PRI_MON_NAME, $SEC_MON_NAME, $PRI_MON_GEOM, $SEC_MON_GEOM, $AMIX_CTR, $AMIX_DEV);
=cut

#
# System Paths
#

# retropie root folder
# ** $ENV{RETROJET_HOME} - Required environment variable, set in .bashrc or equiv! **
our $RP_PATH = $ENV{RETROJET_HOME};

# home of retropi user
our $BASE_PATH = $ENV{HOME};

# roms
our $ROM_PATH = "$RP_PATH/roms";

# scripts
our $SCRIPT_PATH = "$RP_PATH/retrojet";

# media
# $MEDIA_PATH/system/screenshots
# $MEDIA_PATH/system/videos
# $MEDIA_PATH/system/marquees
# $MEDIA_PATH/system/titles
our $MEDIA_PATH = "$RP_PATH/media";

# gamelists
our $GL_PATH = "$RP_PATH/gamelists";

# manual build sourcecode location
our $SOURCE_PATH = "$BASE_PATH/src";

# Video
our $GEEQIE_GEOMETRY="1280x720+1280+0";
#our $GEEQIE_GEOMETRY="1280x720+0+1024";
our $PRI_MON_NAME = "HDMI-0";
our $PRI_MON_GEOM = "1280x1024";
our $USE_SEC_MON = 1;
our $SEC_MON_NAME = "DP-0";
our $SEC_MON_GEOM = "1280x720";
our $SEC_MON_POS = "right-of";
#our $SEC_MON_POS = "below";

# bins
our $GEEQIE_PATH="/usr/bin/geeqie";

# Audio
our $AMIX_CTR = '0';
our $AMIX_DEV = 'Master';
