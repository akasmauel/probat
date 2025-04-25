:top

    :start
        echo off
        setlocal enabledelayedexpansion

        set debug=0
		set disp_debug=
		set space=" "

        cd "%~dp0"\bin
        title probat
        mode 111,31
        color 0f

        goto :menu

    :menu
        cls
        echo [3;2Hprobat !disp_debug!
        echo [5;2H1. Continue
        echo [6;2H2. New Game
        echo [7;2H3. Information
        echo [8;2H4. Settings
        echo [10;2H6. Exit

        choice /c 123460 /n
            if !errorlevel! equ 1 (
                set nls=load
                goto :game
            )
            if !errorlevel! equ 2 (
                set nls=new
                goto :game
            )
            if !errorlevel! equ 3 goto :information
            if !errorlevel! equ 4 goto :settings
            if !errorlevel! equ 5 exit
			if !errorlevel! equ 6 (
				set debug=1
				set disp_debug=debug
			)
			goto :menu

    :information
        cls
        echo [3;2Hprobat - Information
        echo [5;2HCreated by smauel
        echo [7;2HPress any key to continue.

        pause > nul
            goto :menu

    :settings
        cls
        echo [3;2Hprobat - Settings
        echo [5;2HThis is not available yet.
        echo [7;2HPress any key to continue.

        pause > nul
            goto :menu

    :game
        call !nls!.bat
        call engine.bat