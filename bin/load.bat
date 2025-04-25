:top

	:start

	:load

		:load_check
			if not exist "save.txt" goto :load_fail
			if not exist "map.txt" goto :load_fail

			goto :load_save

		:load_fail
			cls
			echo [3;2HThere was an error loading your world.
			echo [5;2HPlease start a new world.
			echo [7;2HPress any key to continue.

			pause > nul
				if exist "save.txt" del "save.txt"
				if exist "map.txt" del "map.txt"
				cd ..
				start probat.bat
				exit

		:load_save
			cls
			echo [3;2HLoading world...

			< "save.txt" (
				set /p x=
				set /p y=
				set /p DAY=
				set /p MON=
				set /p NUM=
				set /p YER=
				set /p HOR=
				set /p MIN=
				set /p DON=
				set /p money=
			)

		:load_map
			set temp=0
			for /f "tokens=*" %%a in (map.txt) do (
				set line_!temp!=%%a
				set /a temp=!temp! + 1
			)

			exit /b