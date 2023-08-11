#!/usr/bin/perl
#########################################
# Emulationstation - screensaver-game-select script
# Created by: John Tisch
#########################################
use strict;
use warnings;
use File::Basename;

# goo for common stuff for my retro scripts
require "$ENV{RETROJET_HOME}/retrojet/retrojet.pl";
our ($MEDIA_PATH, $GEEQIE_GEOMETRY, $GEEQIE_PATH, $USE_SEC_MON);

#################################
# short circuit if no 2nd monitor
# ###############################
if ($USE_SEC_MON == 0) {
        exit 0;
}

my $LOGFILE = "/tmp/es-screensaver-game-select.log";
my $SSFILE = "/tmp/screensaver-preview-list.log";
my $IMGROOT = "$MEDIA_PATH/%s/titles";
my $SYSTEMROOT = "$MEDIA_PATH/system/titles";
my $DEFIMG = $SYSTEMROOT . "/arcade.png";
my $GQCMD = "/usr/bin/geeqie --geometry=$GEEQIE_GEOMETRY -t -f -r File:\"%s\"";
#my $GQCMD = "/usr/bin/feh -g $GEEQIE_GEOMETRY -x \"%s\"";

# process input variables
if (scalar(@ARGV) < 4) {
    print "\nUsage: $0 <system_name> <rom_path> <game_name> <access_type>\n\n";
    exit;
}
my ($inSYSTEMNAME, $inROMPATH, $inGAMENAME, $inACCESSTYPE) = @ARGV;

# create log file
open(my $fh, ">", $LOGFILE);

# save to preview file
open(my $ssf, ">>", $SSFILE);
print $ssf "$inSYSTEMNAME||$inROMPATH||$inGAMENAME||$inACCESSTYPE\n";
close($ssf) or die $!;

# log input args
print $fh "SYSTEMNAME: $inSYSTEMNAME\n";
print $fh "ROMPATH: $inROMPATH\n";
print $fh "GAMENAME: $inGAMENAME\n";
print $fh "ACCESSTYPE: $inACCESSTYPE\n";

# get rompath file parts
my($FPFILE, $FPDIRS, $FPSUFFIX) = fileparse($inROMPATH);
print $fh "file: $FPFILE\n";
print $fh "path: $FPDIRS\n";
print $fh "suffix: $FPSUFFIX\n";

# get system
my @spl = split('/', $FPDIRS);
my $EMUSYS=$spl[-1];

if ($inSYSTEMNAME eq 'recent' || $inSYSTEMNAME eq 'all' || $inSYSTEMNAME eq 'collections' || $inSYSTEMNAME eq 'favorites') {
        if (-e $inROMPATH) {
                $inSYSTEMNAME = $spl[-1];
        } else {
                $inSYSTEMNAME = 'collections';
        }
}

# arcade?
$EMUSYS = $inSYSTEMNAME;
print $fh "System: $EMUSYS\n";

# get rom
$FPFILE =~ s/\.\w{2,}$//;

# use rom image if exists
my $ROMIMG = sprintf("$IMGROOT/$FPFILE.png", $EMUSYS);
my $imgfound = displayImage($ROMIMG);

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
