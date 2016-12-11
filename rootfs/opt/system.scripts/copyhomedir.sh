#!/usr/bin/env bash
#
export echo=/bin/echo
export env=/usr/bin/env
export home='/home/'
$env | grep '/home/' > $PAM_TTY

case "$PAM_TYPE" in
open_session)
	$echo Message:  PAM_TYPE = open_session > $PAM_TTY
;;
close_session)
	$echo Message:  PAM_TYPE = close_session > $PAM_TTY
;;
* )
	$echo Message:  PAM ERROR: uncnown session tupe > $PAM_TTY
  exit 1 ;
;;
esac

exit
