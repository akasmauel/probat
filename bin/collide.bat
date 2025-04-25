:top

	:start

	:collision_check
		if "!line_%y%:~%x%,1!" neq !space! goto :block_!line_%y%:~%x%,1!
		exit /b

	:block_H
		cls
		echo house
		pause
		exit /b

	:block_T
		cls
		echo town hall
		pause
		exit /b

	:block_#
		if !errorlevel! equ 1 set /a y=!y! + 1
		if !errorlevel! equ 2 set /a x=!x! + 1
		if !errorlevel! equ 3 set /a y=!y! - 1
		if !errorlevel! equ 4 set /a x=!x! - 1
		exit /b