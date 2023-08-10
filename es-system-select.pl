#!/usr/bin/perl
#########################################
# Emulationstation - system-select script
# Created by: John Tisch 3/2022
#########################################
use strict;
use warnings;
use File::Basename;
use File::Copy;

# goo for common stuff for my retro scripts
require "$ENV{RETROJET_HOME}/retrojet/retrojet.pl";
our ($BASE_PATH, $RP_PATH, $SCRIPT_PATH, $MEDIA_PATH, $GEEQIE_GEOMETRY, $GEEQIE_PATH, $USE_SEC_MON);

# short circuit if no 2nd monitor
if ($USE_SEC_MON eq 0) {
	exit 0;
}

#my $MARQ_GEM = "1280x720+1280+0";
#my $MARQ_GEM = "1280x720+0+1024";
my $LOGFILE = "/tmp/es-system-select.log";
#my $IMGROOT = $ENV{"HOME"} . "/RetroPie/media/%s/titles";
my $SYSTEMROOT = "$MEDIA_PATH/system/titles";
my $DEFIMG = $SYSTEMROOT . "/arcade.png";
my $GQCMD = "/usr/bin/geeqie --geometry=$GEEQIE_GEOMETRY -t -f -r File:\"%s\"";
#my $GQCMD = "/usr/bin/feh -g $GEEQIE_GEOMETRY -x \"%s\" &>/dev/null &";

# process input variables
if (scalar(@ARGV) < 2) {
    print "\nUsage: marquee-system-select.pl <system_name> <access_type>\n\n";
    exit;
}
my ($inSYSTEMNAME, $inACCESSTYPE) = @ARGV;

# create log file
open(my $fh, ">", $LOGFILE);

# log input args
print $fh "SYSTEMNAME: $inSYSTEMNAME\n";
print $fh "ACCESSTYPE: $inACCESSTYPE\n";

# arcade?
#my $EMUSYS = (lc($inSYSTEMNAME) =~ /(arcade|mame)/) ? "arcade" : $inSYSTEMNAME;
#my $EMUSYS = (lc($inSYSTEMNAME) =~ /(arcade|mame)/) ? $inSYSTEMNAME : $inSYSTEMNAME;
my $EMUSYS = $inSYSTEMNAME;
print $fh "System: $EMUSYS\n";

my $imgfound = 0;
my $ROMIMG = "";
# use system image if exists
if ($imgfound == 0) {
    $ROMIMG = "$SYSTEMROOT/$EMUSYS.png";
    $imgfound = displayImage($ROMIMG);
}

# if none yet, use default
if ($imgfound == 0) {
    $ROMIMG = $DEFIMG;
    $imgfound = displayImage($ROMIMG);
}

# close log file
close($fh);
exit 0;

sub displayImage {
   my($inIMGPATH) = @_;
   print $fh "DSPIMG: $inIMGPATH\n";
   if (-e $inIMGPATH) {
	system(sprintf($GQCMD, $inIMGPATH));
   	exit 0;
   }
   return 0;
}
