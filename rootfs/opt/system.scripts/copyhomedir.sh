#!/usr/bin/env bash
#
export echo=/bin/echo
export env=/usr/bin/env
export home_d=/home
#export skel_d=/skel.d
export skel_d=/home_
export HOME=$home_d/$PAM_USER
export SKEL=$skel_d/$PAM_USER
#
#$env | sort > $PAM_TTY


#
case "$PAM_TYPE" in
open_session)
	$echo Message:  PAM_TYPE = open_session > $PAM_TTY

	if [ -f $HOME/newhome ]&& [ -d "$SKEL" ]; then
		echo NEWHOME label found >$PAM_TTY
		rm -f $HOME/newhome
		[ -f $HOME/.profile ]      && [ -f "$SKEL/.profile" ]     		 && rm -f $HOME/.profile >$PAM_TTY
		[ -f $HOME/.bashrc ]       && [ -f "$SKEL/.bashrc" ]      		 && rm -f $HOME/.bashrc  >$PAM_TTY
		[ -f $HOME/.bash_aliases ] && [ -f "$SKEL/.bash_aliases" ]		 && rm -f $HOME/.bash_aliases >$PAM_TTY
		[ -f $HOME/.bash_logout ]  && [ -f "$SKEL/.bash_logout" ] 		 && rm -f $HOME/.bash_logout  >$PAM_TTY
		[ -f $HOME/.bash_history ] && [ -f "$SKEL/.bash_history" ]		 && rm -f $HOME/.bash_history >$PAM_TTY
	fi

	if [ -d "$SKEL" ] && [ -d $HOME ]; then
		echo RSYNC $SKEL to $HOME  > $PAM_TTY;
		cd "$SKEL";
		rsync -rRulog . $HOME > $PAM_TTY;
	fi
;;
close_session)
	$echo Message:  PAM_TYPE = close_session &> $PAM_TTY
	if [ -d "$SKEL" ] && [ -f $HOME/synchome ] ; then
		echo RSYNC $HOME to $SKEL > $PAM_TTY;
		cd "$HOME";
		rsync -rRulog . $SKEL > $PAM_TTY;
		rm -f $HOME/synchome > $PAM_TTY;
	fi
;;
* )
	$echo Message:  PAM ERROR: uncnown session tupe > $PAM_TTY
	exit 1
;;
esac

#
exit
