:top

	:start

	:MIN
		set /a MIN=!MIN! + 1
		if !MIN! equ 60 (
			set MIN=0
			goto :HOR
		)
		exit /b

	:HOR
		set /a HOR=!HOR! + 1
		if !HOR! equ 12 (
			goto :DON
		)
		if !HOR! equ 13 set HOR=1
		exit /b

	:DON
		goto :DON_!DON!

		:DON_AM
			set DON=PM
			exit /b

		:DON_PM
			set DON=AM
			goto :DAY

	:DAY
		set /a DAY=!DAY! + 1
		if !DAY! equ 8 set DAY=1
		goto :NUM

	:NUM
		set /a NUM=!NUM! + 1
		if !MON! equ 1 (
			if !NUM! equ 32 (
				set NUM=1
				goto :MON
			)
		)
		if !MON! equ 2 (
			set /a leap=!YER! %% 4
			if !leap! equ 0 (
				if !NUM! equ 30 (
					set NUM=1
					goto :MON
				)
				exit /b
			)
			if !NUM! equ 29 (
				set NUM=1
				goto :MON
			)
		)
		if !MON! equ 3 (
			if !NUM! equ 32 (
				set NUM=1
				goto :MON
			)
		)
		if !MON! equ 4 (
			if !NUM! equ 31 (
				set NUM=1
				goto :MON
			)
		)
		if !MON! equ 5 (
			if !NUM! equ 32 (
				set NUM=1
				goto :MON
			)
		)
		if !MON! equ 6 (
			if !NUM! equ 31 (
				set NUM=1
				goto :MON
			)
		)
		if !MON! equ 7 (
			if !NUM! equ 32 (
				set NUM=1
				goto :MON
			)
		)
		if !MON! equ 8 (
			if !NUM! equ 32 (
				set NUM=1
				goto :MON
			)
		)
		if !MON! equ 9 (
			if !NUM! equ 31 (
				set NUM=1
				goto :MON
			)
		)
		if !MON! equ 10 (
			if !NUM! equ 32 (
				set NUM=1
				goto :MON
			)
		)
		if !MON! equ 11 (
			if !NUM! equ 31 (
				set NUM=1
				goto :MON
			)
		)
		if !MON! equ 12 (
			if !NUM! equ 32 (
				set NUM=1
				goto :MON
			)
		)
		exit /b

	:MON
		set /a MON=!MON! + 1
		if !MON! equ 13 (
			set MON=1
			goto :YER
		)
		exit /b

	:YER
		set /a YER=!YER! + 1
		exit /b