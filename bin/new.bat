:top

	:start

	:new

		:new_check
			if exist "save.txt" goto :new_overwrite
			if exist "map.txt" goto :new_overwrite

			goto :new_save

		:new_overwrite
			cls
			echo [3;2HThere is existing save data.
			echo [5;2HBy starting a new world you will overwrite all existing data.
			echo [7;2HWould you like to start a new world?
			echo [9;2H1. Yes
			echo [10;2H2. No

			choice /c 12 /n
				if !errorlevel! equ 1 (
					if exist "save.txt" del "save.txt"
					if exist "map.txt" del "world.txt"
					goto :new_save
				)
				if !errorlevel! equ 2 (
					cd..
					start probat.bat
					exit
				)

		:new_save
			cls
			echo [3;2HCreating world...

			set x=38
			set y=13

			set DAY=1
			set MON=1
			set NUM=1
			set YER=2023
			set HOR=12
			set MIN=00
			set DON=PM

			set money=0

		:new_map
			copy map_bu.txt map.txt

			set temp=0
			for /f "tokens=*" %%a in (map.txt) do (
				set line_!temp!=%%a
				set /a temp=!temp! + 1
			)

			exit /b