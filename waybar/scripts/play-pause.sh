#!/bin/tcsh

if ($# > 0) then
        set SERVER="${1}"
else
        set SERVER=localhost
endif

set MPC= (mpc --host="${SERVER}")

${MPC} version >& /dev/null

if ($? != 0) then
        echo "Can't find mpd server at ${SERVER}..."

        exit 1
endif

${MPC} toggle
