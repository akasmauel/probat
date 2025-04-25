:top

    :start
        rem load items

		for /l %%a in (0,1,108) do (
			set screen_border=!screen_border!#
		)
		for /l %%a in (0,1,28) do (
			set menu_border=!menu_border! 
		)

        goto :loop

	:debug
		cls
		set /p debug_input=DEBUG: 
		!debug_input!
		goto :debug

    :loop
        cls

        :refresh
			set /a w=!x! - 37
			set /a z=!x! + 1

			for /l %%a in (0,1,11) do (
				set /a u%%a=!y! - %%a - 1
				set /a d%%a=!y! + %%a + 1
			)

            rem update everything else
			call calendar.bat

        :screen
			echo [3;2H!screen_border!
			echo [4;2H# !line_%u11%:~%w%,75! #!menu_border!#
			echo [5;2H# !line_%u10%:~%w%,75! #!menu_border!#
			echo [6;2H# !line_%u9%:~%w%,75! #!menu_border!#
			echo [7;2H# !line_%u8%:~%w%,75! #!menu_border!#
			echo [8;2H# !line_%u7%:~%w%,75! #!menu_border!#
			echo [9;2H# !line_%u6%:~%w%,75! #!menu_border!#
			echo [10;2H# !line_%u5%:~%w%,75! #!menu_border!#
			echo [11;2H# !line_%u4%:~%w%,75! #!menu_border!#
			echo [12;2H# !line_%u3%:~%w%,75! #!menu_border!#
			echo [13;2H# !line_%u2%:~%w%,75! #!menu_border!#
			echo [14;2H# !line_%u1%:~%w%,75! #!menu_border!#
			echo [15;2H# !line_%u0%:~%w%,75! #!menu_border!#
			echo [16;2H# !line_%y%:~%w%,37!@!line_%y%:~%z%,37! #!menu_border!#
			echo [17;2H# !line_%d0%:~%w%,75! #!menu_border!#
			echo [18;2H# !line_%d1%:~%w%,75! #!menu_border!#
			echo [19;2H# !line_%d2%:~%w%,75! #!menu_border!#
			echo [20;2H# !line_%d3%:~%w%,75! #!menu_border!#
			echo [21;2H# !line_%d4%:~%w%,75! #!menu_border!#
			echo [22;2H# !line_%d5%:~%w%,75! #!menu_border!#
			echo [23;2H# !line_%d6%:~%w%,75! #!menu_border!#
			echo [24;2H# !line_%d7%:~%w%,75! #!menu_border!#
			echo [25;2H# !line_%d8%:~%w%,75! #!menu_border!#
			echo [26;2H# !line_%d9%:~%w%,75! #!menu_border!#
			echo [27;2H# !line_%d10%:~%w%,75! ###############################
			echo [28;2H# !line_%d11%:~%w%,75! #!menu_border!#
			echo [29;2H!screen_border!

			echo [4;82HCoins [!money!]

			if !MON! equ 1 set disp_MON=JAN
			if !MON! equ 2 set disp_MON=FEB
			if !MON! equ 3 set disp_MON=MAR
			if !MON! equ 4 set disp_MON=APR
			if !MON! equ 5 set disp_MON=MAY
			if !MON! equ 6 set disp_MON=JUN
			if !MON! equ 7 set disp_MON=JUL
			if !MON! equ 8 set disp_MON=AUG
			if !MON! equ 9 set disp_MON=SEP
			if !MON! equ 10 set disp_MON=OCT
			if !MON! equ 11 set disp_MON=NOV
			if !MON! equ 12 set disp_MON=DEC

			if !DAY! equ 1 set disp_DAY=SUN
			if !DAY! equ 2 set disp_DAY=MON
			if !DAY! equ 3 set disp_DAY=TUE
			if !DAY! equ 4 set disp_DAY=WED
			if !DAY! equ 5 set disp_DAY=THU
			if !DAY! equ 6 set disp_DAY=FRI
			if !DAY! equ 7 set disp_DAY=SAT

			if !MIN! lss 10 set disp_MIN=0
			if !MIN! gtr 9 set disp_MIN=

			echo [24;82H!disp_debug!
			echo [25;82H!disp_DAY!, !disp_MON! !NUM!, !YER! - !HOR!:!disp_MIN!!MIN!!DON!
			echo [26;82H[M] Save
			echo [28;82H(!x!,!y!) [!line_%y%:~%x%,1!]

            choice /c wasdmix0 /t 1 /d x /n

            if !errorlevel! lss 5 goto :move
            if !errorlevel! equ 5 call save.bat
            if !errorlevel! equ 6 goto :inventory
            if !errorlevel! equ 7 goto :refresh
			if !errorlevel! equ 8 (
				if !debug! equ 1 (
					goto :debug
				)
			)
			goto :refresh

		:move
			if !errorlevel! equ 1 set /a y=!y! - 1
			if !errorlevel! equ 2 set /a x=!x! - 1
			if !errorlevel! equ 3 set /a y=!y! + 1
			if !errorlevel! equ 4 set /a x=!x! + 1

			call collide.bat

			goto :refresh