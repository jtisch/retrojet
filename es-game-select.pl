#!/usr/bin/perl
#########################################
# Emulationstation - game-select script
# Created by: John Tisch
#########################################
use strict;
use warnings;
use File::Basename;
use File::Copy;

# Common include for retrojet scripts
require "$ENV{RETROJET_HOME}/retrojet/retrojet.pl";
our ($BASE_PATH, $RP_PATH, $SCRIPT_PATH, $MEDIA_PATH, $GEEQIE_GEOMETRY, $GEEQIE_PATH, $USE_SEC_MON);

# short circuit if no 2nd monitor
if ($USE_SEC_MON eq 0) {
	exit 0;
}

##################################
# User adjustable script variables
##################################
my $LOGFILE = "/tmp/es-game-select.log";
my $IMGROOT = "$MEDIA_PATH/%s/titles";
my $SYSTEMROOT = "$MEDIA_PATH/system/titles";
my $DEFIMG = $SYSTEMROOT . "/arcade.png";
my $GQCMD = "/usr/bin/geeqie --geometry=$GEEQIE_GEOMETRY -t -f -r File:\"%s\"";

#################
# Create log file
#################
open(my $fh, ">", $LOGFILE);

###########################
# input variable processing
###########################
if (scalar(@ARGV) != 4) {
    print "\nUsage: $0 <system_name> <rom_path> <game_name> <access_type>\n\n";
    print $fh "Usage: $0 <system_name> <rom_path> <game_name> <access_type>\n";
    exit;
}
my ($inSYSTEMNAME, $inROMPATH, $inGAMENAME, $inACCESSTYPE) = @ARGV;
print $fh "SYSTEMNAME: $inSYSTEMNAME\n";
print $fh "ROMPATH: $inROMPATH\n";
print $fh "GAMENAME: $inGAMENAME\n";
print $fh "ACCESSTYPE: $inACCESSTYPE\n";

#################################
# subs
#################################
sub displayImage {
   my($inIMGPATH) = @_;
   print $fh "DSPIMG: $inIMGPATH\n";
   if (-e "$inIMGPATH") {
        system(sprintf($GQCMD, $inIMGPATH));
        exit 0;
   }
   return 0;
}

#################################
# Script Start
#################################

###################
# get just rom name
###################
$inROMPATH =~ s/\$/\\\$/;

########################
# get rompath file parts
########################
my($FPFILE, $FPDIRS, $FPSUFFIX) = fileparse($inROMPATH);
print $fh "file: $FPFILE\n";
print $fh "path: $FPDIRS\n";
print $fh "suffix: $FPSUFFIX\n";

######################
# get system from path
######################
my @spl = split('/', $FPDIRS);
my $EMUSYS=$spl[-1];

########################
# special retropie types
########################
if ($inSYSTEMNAME eq 'recent' || $inSYSTEMNAME eq 'all' || $inSYSTEMNAME eq 'collections' || $inSYSTEMNAME eq 'favorites') {
	if (-e $inROMPATH) {
		$inSYSTEMNAME = $spl[-1];
	} else {	
        	$inSYSTEMNAME = 'collections';
	}
}

#########
# arcade?
#########
$EMUSYS = $inSYSTEMNAME;
print $fh "System: $EMUSYS\n";

#########
# get rom
$FPFILE =~ s/\.\w{2,}$//;
#########

#########################
# use rom image if exists
#########################
my $ROMIMG = sprintf("$IMGROOT/$FPFILE.png", $EMUSYS);
my $imgfound = displayImage($ROMIMG);
if ($imgfound == 0) {
    $ROMIMG = sprintf("$IMGROOT/\\\$1$FPFILE.png", $EMUSYS);
    $imgfound = displayImage($ROMIMG);
}

############################
# use system image if exists
############################
if ($imgfound == 0) {
    $ROMIMG = "$SYSTEMROOT/$EMUSYS.png";
    $imgfound = displayImage($ROMIMG);
}

##########################
# if none yet, use default
##########################
if ($imgfound == 0) {
    $ROMIMG = $DEFIMG;
    $imgfound = displayImage($ROMIMG);
}

#########################
# close log file and exit
#########################
close($fh);
exit 0;
