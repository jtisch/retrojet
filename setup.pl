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

my @SCRIPTFILES1 = (
	{ name => "es-game-select", path => ".emulationstation/scripts/game-select" },
	{ name => "es-quit", path => ".emulationstation/scripts/quit" },
	{ name => "es-screensaver-game-select", path => ".emulationstation/scripts/screensaver-game-select" },
	{ name => "es-system-select", path => ".emulationstation/scripts/system-select" }
);

# Process script files
foreach my $scrFile (@SCRIPTFILES1) {

	# set executable bits
	my $tmpExe = "$HOMEDIR/RetroPie/retrojet/$scrFile->{name}.pl";
	print "Setting executable bits for: $tmpExe\n";
	chmod(0755, $tmpExe) or die "Unable to set executable bit, run as retropie user: $!\n";

	# make sure ES script folder exist
	my $tmpScr = "$HOMEDIR/$scrFile->{path}";
	if (! -d $tmpScr) {
		print "Creating folder: $tmpScr\n";
		mkdir ($tmpScr) or die "Unable to create folder: $!\n";
	}

	# create symbolic link
	$tmpScr = "$HOMEDIR/$scrFile->{path}/$scrFile->{name}.pl";
	if (-l $tmpScr) {
		print "Removing old link: $tmpScr\n";
		unlink ($tmpScr) or die "Unable to remove old symlink, run as retropie user?: $!\n";
	}
	my $tmpLnk = "$HOMEDIR/RetroPie/retrojet/$scrFile->{name}.pl";
	print "Creating link: $tmpLnk -> $tmpScr\n";
	if (symlink ($tmpLnk, $tmpScr) == 0) {
		die "Unable to create symbolic link, run as retropie user?: $!\n";
	}
}

exit 0;
