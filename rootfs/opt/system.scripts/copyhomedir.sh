#!/usr/bin/env bash
#
export echo=/bin/echo
export env=/usr/bin/env

# true - Normal, false - Debug
if false ;then
	$echo "true -> Normal"
	export home_d=/home
	export skel_d=/synchome.d
#
else
	$echo "false -> Debug"
	#
	export PAM_USER=pam_test_user
	#
#	export PAM_TYPE=open_session
	export PAM_TYPE=close_session
#	export PAM_TYPE=other_session_type
	#
	export home_d=/home_
	export skel_d=/synchome.d
	#
	export PAM_TTY=/dev/tty
fi

export HOME=$home_d/$PAM_USER
export SKEL=$skel_d/$PAM_USER

#-----DEBUG------
#$env | sort > $PAM_TTY
#----DEBUG END---

if [ ! -d $HOME ]; then echo "Error:No such directory $HOME" >$PAM_TTY; exit; fi
if [ ! -f /etc/skel/newhome ]; then echo > "/etc/skel/newhome"; fi

case "$PAM_TYPE" in
open_session)
	$echo Message:  PAM_TYPE = open_session > $PAM_TTY

	if [ -f $HOME/newhome ]&& [ -d "$SKEL" ]; then
		echo NEWHOME label found >$PAM_TTY
		rm -f 
		[ -f $HOME/.profile ]      && [ -f "$SKEL/.profile" ]     		 && rm -f $HOME/.profile >$PAM_TTY
		[ -f $HOME/.bashrc ]       && [ -f "$SKEL/.bashrc" ]      		 && rm -f $HOME/.bashrc  >$PAM_TTY
		[ -f $HOME/.bash_aliases ] && [ -f "$SKEL/.bash_aliases" ]		 && rm -f $HOME/.bash_aliases >$PAM_TTY
		[ -f $HOME/.bash_logout ]  && [ -f "$SKEL/.bash_logout" ] 		 && rm -f $HOME/.bash_logout  >$PAM_TTY
		[ -f $HOME/.bash_history ] && [ -f "$SKEL/.bash_history" ]		 && rm -f $HOME/.bash_history >$PAM_TTY
	fi

	if [ -d "$SKEL" ] && [ -d $HOME ]; then
		echo RSYNC  to $HOME  > $PAM_TTY;
		rsync -rulog $SKEL $home_d > $PAM_TTY;
#		cp -a $SKEL $home_d > $PAM_TTY;
	fi
	
	$echo "для синхронизации оставить только расширение" > $HOME/'для синхронизации оставить только расширение.synchome'
;;
close_session)
	$echo Message:  PAM_TYPE = close_session &> $PAM_TTY

#	Uncoment from alwais sync home
#	$echo > $HOME/.synchome

	if [ -d "$SKEL" ] && [ -f "$HOME/.synchome" ] ; then
		$echo RSYNC $HOME to $SKEL > $PAM_TTY;
		rsync -rulog $HOME $skel_d &> $PAM_TTY;
#		cp -a $HOME $skel_d;
		rm -f $HOME/.synchome &> $PAM_TTY;
		rm -f $SKEL/.synchome &> $PAM_TTY;
	fi
;;
* )
	$echo Message:  PAM ERROR: uncnown session tupe > $PAM_TTY
	exit 1
;;
esac

#
exit
