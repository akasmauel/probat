:top

	:start

	:save

		:save_save
			cls
			echo [3;2HSaving world...

			(
				echo !x!
				echo !y!
				echo !DAY!
				echo !MON!
				echo !NUM!
				echo !YER!
				echo !HOR!
				echo !MIN!
				echo !DON!
				echo !money!
			) > save.txt

		:save_world
			if exist "map.txt" del "map.txt"

			for /l %%a in (0,1,275) do (
				echo !line_%%a!>>map.txt
			)

			exit /b