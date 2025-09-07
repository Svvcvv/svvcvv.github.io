@echo off
setlocal enabledelayedexpansion

:: ÑÕÉ«¶¨Òå
set "COLOR_RESET=[0m"
set "COLOR_TITLE=[93m"    :: »ÆÉ«
set "COLOR_MENU=[92m"     :: ÂÌÉ«
set "COLOR_ERROR=[91m"    :: ºìÉ«
set "COLOR_INFO=[96m"     :: ÇàÉ«
set "COLOR_SUCCESS=[92m"  :: ÂÌÉ«

:: ½çÃæ³£Á¿
set "TITLE_BAR=¨X¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨["
set "FOOTER_BAR=¨^¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨a"
set "DIVIDER=¨c©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤¨f"

:main_menu
cls
echo %TITLE_BAR%
echo ¨U                     %COLOR_TITLE%Git Helper%COLOR_RESET%                       ¨U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1. %COLOR_RESET% ³õÊ¼»¯²Ö¿â (git init)
echo   %COLOR_MENU%2. %COLOR_RESET% Ìí¼ÓÎÄ¼şµ½Ôİ´æÇø (git add)
echo   %COLOR_MENU%3. %COLOR_RESET% Ìá½»¸ü¸Ä (git commit)
echo   %COLOR_MENU%4. %COLOR_RESET% ²é¿´×´Ì¬ (git status)
echo   %COLOR_MENU%5. %COLOR_RESET% ²é¿´Ìá½»ÀúÊ· (git log)
echo   %COLOR_MENU%6. %COLOR_RESET% ·ÖÖ§²Ù×÷
echo   %COLOR_MENU%7. %COLOR_RESET% ºÏ²¢·ÖÖ§ (git merge)
echo   %COLOR_MENU%8. %COLOR_RESET% Ô¶³Ì²Ö¿â²Ù×÷
echo   %COLOR_MENU%9. %COLOR_RESET% À­È¡Ô¶³Ì·ÖÖ§ (git pull)
echo   %COLOR_MENU%10.%COLOR_RESET% ÍÆËÍ±¾µØ·ÖÖ§ (git push)
echo   %COLOR_MENU%11.%COLOR_RESET% ÎÄ¼ş»ØÍË²Ù×÷
echo   %COLOR_MENU%12.%COLOR_RESET% ±È½ÏÎÄ¼ş²îÒì (git diff)
echo   %COLOR_MENU%13.%COLOR_RESET% ²é¿´Ìá½»ÏêÇé (git show)
echo   %COLOR_MENU%14.%COLOR_RESET% stash ²Ù×÷
echo   %COLOR_MENU%15.%COLOR_RESET% ±êÇ©²Ù×÷
echo   %COLOR_MENU%16.%COLOR_RESET% ÅäÖÃ¹ÜÀí
echo   %COLOR_MENU%0. %COLOR_RESET% ÍË³ö
echo.
echo %FOOTER_BAR%

set /p choice=ÇëÑ¡Ôñ²Ù×÷ (0-16): 

if "%choice%"=="0" goto exit
if "%choice%"=="1" goto git_init
if "%choice%"=="2" goto git_add
if "%choice%"=="3" goto git_commit
if "%choice%"=="4" goto git_status
if "%choice%"=="5" goto git_log
if "%choice%"=="6" goto branch_menu
if "%choice%"=="7" goto git_merge
if "%choice%"=="8" goto remote_menu
if "%choice%"=="9" goto git_pull
if "%choice%"=="10" goto git_push
if "%choice%"=="11" goto revert_menu
if "%choice%"=="12" goto git_diff
if "%choice%"=="13" goto git_show
if "%choice%"=="14" goto stash_menu
if "%choice%"=="15" goto tag_menu
if "%choice%"=="16" goto config_menu

echo %COLOR_ERROR%ÎŞĞ§Ñ¡Ôñ£¬ÇëÖØĞÂÊäÈë£¡%COLOR_RESET%
pause
goto main_menu

:git_init
cls
echo %TITLE_BAR%
echo ¨U                %COLOR_TITLE%³õÊ¼»¯ Git ²Ö¿â%COLOR_RESET%                 ¨U
echo %FOOTER_BAR%
echo.
git init
echo.
echo %COLOR_SUCCESS%²Ö¿â³õÊ¼»¯Íê³É£¡%COLOR_RESET%
pause
goto main_menu

:git_add
cls
echo %TITLE_BAR%
echo ¨U              %COLOR_TITLE%Ìí¼ÓÎÄ¼şµ½Ôİ´æÇø%COLOR_RESET%               ¨U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% Ìí¼ÓËùÓĞÎÄ¼ş (git add .)
echo   %COLOR_MENU%2.%COLOR_RESET% Ìí¼ÓÖ¸¶¨ÎÄ¼ş (git add filename)
echo   %COLOR_MENU%3.%COLOR_RESET% Ìí¼ÓËùÓĞĞŞ¸ÄºÍÉ¾³ıµÄÎÄ¼ş (git add -u)
echo   %COLOR_MENU%4.%COLOR_RESET% Ìí¼ÓËùÓĞÎÄ¼ş(°üÀ¨ĞÂ½¨ÎÄ¼ş) (git add -A)
echo.
set /p add_choice=ÇëÑ¡Ôñ²Ù×÷ (1-4): 

if "%add_choice%"=="1" (
    git add .
    echo %COLOR_SUCCESS%ÒÑÌí¼ÓËùÓĞÎÄ¼şµ½Ôİ´æÇø£¡%COLOR_RESET%
) else if "%add_choice%"=="2" (
    set /p filename=ÇëÊäÈëÎÄ¼şÃû: 
    git add !filename!
    echo %COLOR_SUCCESS%ÒÑÌí¼Ó !filename! µ½Ôİ´æÇø£¡%COLOR_RESET%
) else if "%add_choice%"=="3" (
    git add -u
    echo %COLOR_SUCCESS%ÒÑÌí¼ÓËùÓĞĞŞ¸ÄºÍÉ¾³ıµÄÎÄ¼şµ½Ôİ´æÇø£¡%COLOR_RESET%
) else if "%add_choice%"=="4" (
    git add -A
    echo %COLOR_SUCCESS%ÒÑÌí¼ÓËùÓĞÎÄ¼şµ½Ôİ´æÇø£¡%COLOR_RESET%
) else (
    echo %COLOR_ERROR%ÎŞĞ§Ñ¡Ôñ£¡%COLOR_RESET%
)
pause
goto main_menu

:git_commit
cls
echo %TITLE_BAR%
echo ¨U                 %COLOR_TITLE%Ìá½»¸ü¸Ä%COLOR_RESET%                  ¨U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% ³£¹æÌá½» (git commit -m "message")
echo   %COLOR_MENU%2.%COLOR_RESET% Ìí¼Ó²¢Ìá½» (git commit -am "message")
echo   %COLOR_MENU%3.%COLOR_RESET% ĞŞ¸Ä×îºóÒ»´ÎÌá½» (git commit --amend)
echo.
set /p commit_choice=ÇëÑ¡Ôñ²Ù×÷ (1-3): 

if "%commit_choice%"=="1" (
    set /p commit_msg=ÇëÊäÈëÌá½»ËµÃ÷: 
    git commit -m "%commit_msg%"
) else if "%commit_choice%"=="2" (
    set /p commit_msg=ÇëÊäÈëÌá½»ËµÃ÷: 
    git commit -am "%commit_msg%"
) else if "%commit_choice%"=="3" (
    git commit --amend
) else (
    echo %COLOR_ERROR%ÎŞĞ§Ñ¡Ôñ£¡%COLOR_RESET%
)
echo.
pause
goto main_menu

:git_status
cls
echo %TITLE_BAR%
echo ¨U                 %COLOR_TITLE%²é¿´×´Ì¬%COLOR_RESET%                  ¨U
echo %FOOTER_BAR%
echo.
git status
echo.
pause
goto main_menu

:git_log
cls
echo %TITLE_BAR%
echo ¨U               %COLOR_TITLE%²é¿´Ìá½»ÀúÊ·%COLOR_RESET%                ¨U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% ±ê×¼ÊÓÍ¼ (git log)
echo   %COLOR_MENU%2.%COLOR_RESET% µ¥ĞĞÊÓÍ¼ (git log --oneline)
echo   %COLOR_MENU%3.%COLOR_RESET% Í¼ĞÎÊÓÍ¼ (git log --graph --oneline --decorate)
echo   %COLOR_MENU%4.%COLOR_RESET% ËùÓĞ·ÖÖ§ÊÓÍ¼ (git log --all --graph --oneline --decorate)
echo   %COLOR_MENU%5.%COLOR_RESET% ´øÎÄ¼ş¸ü¸ÄÊÓÍ¼ (git log --name-status)
echo.
set /p log_choice=ÇëÑ¡ÔñÊÓÍ¼ÀàĞÍ (1-5): 

if "%log_choice%"=="1" (
    git log
) else if "%log_choice%"=="2" (
    git log --oneline
) else if "%log_choice%"=="3" (
    git log --graph --oneline --decorate
) else if "%log_choice%"=="4" (
    git log --all --graph --oneline --decorate
) else if "%log_choice%"=="5" (
    git log --name-status
) else (
    echo %COLOR_ERROR%ÎŞĞ§Ñ¡Ôñ£¡%COLOR_RESET%
)
echo.
pause
goto main_menu

:branch_menu
cls
echo %TITLE_BAR%
echo ¨U                 %COLOR_TITLE%·ÖÖ§²Ù×÷%COLOR_RESET%                  ¨U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% ²é¿´±¾µØ·ÖÖ§ (git branch)
echo   %COLOR_MENU%2.%COLOR_RESET% ²é¿´ËùÓĞ·ÖÖ§ (git branch -a)
echo   %COLOR_MENU%3.%COLOR_RESET% ´´½¨ĞÂ·ÖÖ§ (git branch branchname)
echo   %COLOR_MENU%4.%COLOR_RESET% ÇĞ»»·ÖÖ§ (git checkout branchname)
echo   %COLOR_MENU%5.%COLOR_RESET% ´´½¨²¢ÇĞ»»·ÖÖ§ (git checkout -b branchname)
echo   %COLOR_MENU%6.%COLOR_RESET% É¾³ı·ÖÖ§ (git branch -d branchname)
echo   %COLOR_MENU%7.%COLOR_RESET% Ç¿ÖÆÉ¾³ı·ÖÖ§ (git branch -D branchname)
echo   %COLOR_MENU%8.%COLOR_RESET% ÖØÃüÃû·ÖÖ§ (git branch -m oldname newname)
echo   %COLOR_MENU%9.%COLOR_RESET% ²é¿´·ÖÖ§ºÏ²¢Í¼ (git log --graph --oneline --decorate --all)
echo   %COLOR_MENU%10.%COLOR_RESET% ²é¿´µ±Ç°·ÖÖ§ (git branch --show-current)
echo   %COLOR_MENU%11.%COLOR_RESET% ·µ»ØÖ÷²Ëµ¥
echo.
set /p branch_choice=ÇëÑ¡Ôñ²Ù×÷ (1-11): 

if "%branch_choice%"=="1" (
    git branch
) else if "%branch_choice%"=="2" (
    git branch -a
) else if "%branch_choice%"=="3" (
    set /p branchname=ÇëÊäÈëĞÂ·ÖÖ§Ãû³Æ: 
    git branch !branchname!
    echo %COLOR_SUCCESS%ÒÑ´´½¨·ÖÖ§ !branchname!%COLOR_RESET%
) else if "%branch_choice%"=="4" (
    set /p branchname=ÇëÊäÈëÒªÇĞ»»µÄ·ÖÖ§Ãû³Æ: 
    git checkout !branchname!
) else if "%branch_choice%"=="5" (
    set /p branchname=ÇëÊäÈëĞÂ·ÖÖ§Ãû³Æ: 
    git checkout -b !branchname!
    echo %COLOR_SUCCESS%ÒÑ´´½¨²¢ÇĞ»»µ½·ÖÖ§ !branchname!%COLOR_RESET%
) else if "%branch_choice%"=="6" (
    set /p branchname=ÇëÊäÈëÒªÉ¾³ıµÄ·ÖÖ§Ãû³Æ: 
    git branch -d !branchname!
) else if "%branch_choice%"=="7" (
    set /p branchname=ÇëÊäÈëÒªÇ¿ÖÆÉ¾³ıµÄ·ÖÖ§Ãû³Æ: 
    git branch -D !branchname!
) else if "%branch_choice%"=="8" (
    set /p oldname=ÇëÊäÈëÔ­·ÖÖ§Ãû³Æ: 
    set /p newname=ÇëÊäÈëĞÂ·ÖÖ§Ãû³Æ: 
    git branch -m !oldname! !newname!
    echo %COLOR_SUCCESS%ÒÑ½«·ÖÖ§ !oldname! ÖØÃüÃûÎª !newname!%COLOR_RESET%
) else if "%branch_choice%"=="9" (
    git log --graph --oneline --decorate --all
) else if "%branch_choice%"=="10" (
    git branch --show-current
) else if "%branch_choice%"=="11" (
    goto main_menu
) else (
    echo %COLOR_ERROR%ÎŞĞ§Ñ¡Ôñ£¡%COLOR_RESET%
)
echo.
pause
goto branch_menu

:git_merge
cls
echo %TITLE_BAR%
echo ¨U                 %COLOR_TITLE%ºÏ²¢·ÖÖ§%COLOR_RESET%                  ¨U
echo %FOOTER_BAR%
echo.
echo µ±Ç°·ÖÖ§: 
git branch --show-current
echo.
set /p source_branch=ÇëÊäÈëÒªºÏ²¢µÄÔ´·ÖÖ§Ãû³Æ: 
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% ³£¹æºÏ²¢ (git merge branchname)
echo   %COLOR_MENU%2.%COLOR_RESET% ¿ì½øºÏ²¢ (git merge --ff branchname)
echo   %COLOR_MENU%3.%COLOR_RESET% ·Ç¿ì½øºÏ²¢ (git merge --no-ff branchname)
echo   %COLOR_MENU%4.%COLOR_RESET% ºÏ²¢²¢Ìá½» (git merge --commit branchname)
echo   %COLOR_MENU%5.%COLOR_RESET% ºÏ²¢µ«²»Ìá½» (git merge --no-commit branchname)
echo.
set /p merge_choice=ÇëÑ¡ÔñºÏ²¢·½Ê½ (1-5): 

if "%merge_choice%"=="1" (
    git merge !source_branch!
) else if "%merge_choice%"=="2" (
    git merge --ff !source_branch!
) else if "%merge_choice%"=="3" (
    git merge --no-ff !source_branch!
) else if "%merge_choice%"=="4" (
    git merge --commit !source_branch!
) else if "%merge_choice%"=="5" (
    git merge --no-commit !source_branch!
) else (
    echo %COLOR_ERROR%ÎŞĞ§Ñ¡Ôñ£¡%COLOR_RESET%
)
echo.
pause
goto main_menu

:remote_menu
cls
echo %TITLE_BAR%
echo ¨U               %COLOR_TITLE%Ô¶³Ì²Ö¿â²Ù×÷%COLOR_RESET%                ¨U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% ²é¿´Ô¶³Ì²Ö¿â (git remote -v)
echo   %COLOR_MENU%2.%COLOR_RESET% Ìí¼ÓÔ¶³Ì²Ö¿â (git remote add name url)
echo   %COLOR_MENU%3.%COLOR_RESET% É¾³ıÔ¶³Ì²Ö¿â (git remote remove name)
echo   %COLOR_MENU%4.%COLOR_RESET% ĞŞ¸ÄÔ¶³Ì²Ö¿âURL (git remote set-url name url)
echo   %COLOR_MENU%5.%COLOR_RESET% ²é¿´Ô¶³Ì·ÖÖ§ (git branch -r)
echo   %COLOR_MENU%6.%COLOR_RESET% »ñÈ¡Ô¶³Ì·ÖÖ§ (git fetch)
echo   %COLOR_MENU%7.%COLOR_RESET% ÖØÃüÃûÔ¶³Ì²Ö¿â (git remote rename oldname newname)
echo   %COLOR_MENU%8.%COLOR_RESET% ²é¿´Ô¶³Ì²Ö¿âĞÅÏ¢ (git remote show name)
echo   %COLOR_MENU%9.%COLOR_RESET% ·µ»ØÖ÷²Ëµ¥
echo.
set /p remote_choice=ÇëÑ¡Ôñ²Ù×÷ (1-9): 

if "%remote_choice%"=="1" (
    git remote -v
) else if "%remote_choice%"=="2" (
    set /p remote_name=ÇëÊäÈëÔ¶³Ì²Ö¿âÃû³Æ: 
    set /p remote_url=ÇëÊäÈëÔ¶³Ì²Ö¿âURL: 
    git remote add !remote_name! !remote_url!
    echo %COLOR_SUCCESS%ÒÑÌí¼ÓÔ¶³Ì²Ö¿â !remote_name!%COLOR_RESET%
) else if "%remote_choice%"=="3" (
    set /p remote_name=ÇëÊäÈëÒªÉ¾³ıµÄÔ¶³Ì²Ö¿âÃû³Æ: 
    git remote remove !remote_name!
    echo %COLOR_SUCCESS%ÒÑÉ¾³ıÔ¶³Ì²Ö¿â !remote_name!%COLOR_RESET%
) else if "%remote_choice%"=="4" (
    set /p remote_name=ÇëÊäÈëÒªĞŞ¸ÄµÄÔ¶³Ì²Ö¿âÃû³Æ: 
    set /p remote_url=ÇëÊäÈëĞÂµÄÔ¶³Ì²Ö¿âURL: 
    git remote set-url !remote_name! !remote_url!
    echo %COLOR_SUCCESS%ÒÑĞŞ¸ÄÔ¶³Ì²Ö¿â !remote_name! µÄURL%COLOR_RESET%
) else if "%remote_choice%"=="5" (
    git branch -r
) else if "%remote_choice%"=="6" (
    set /p remote_name=ÇëÊäÈëÔ¶³Ì²Ö¿âÃû³Æ (Ä¬ÈÏ origin): 
    if "!remote_name!"=="" set remote_name=origin
    git fetch !remote_name!
) else if "%remote_choice%"=="7" (
    set /p oldname=ÇëÊäÈëÔ­Ô¶³Ì²Ö¿âÃû³Æ: 
    set /p newname=ÇëÊäÈëĞÂÔ¶³Ì²Ö¿âÃû³Æ: 
    git remote rename !oldname! !newname!
    echo %COLOR_SUCCESS%ÒÑ½«Ô¶³Ì²Ö¿â !oldname! ÖØÃüÃûÎª !newname!%COLOR_RESET%
) else if "%remote_choice%"=="8" (
    set /p remote_name=ÇëÊäÈëÔ¶³Ì²Ö¿âÃû³Æ (Ä¬ÈÏ origin): 
    if "!remote_name!"=="" set remote_name=origin
    git remote show !remote_name!
) else if "%remote_choice%"=="9" (
    goto main_menu
) else (
    echo %COLOR_ERROR%ÎŞĞ§Ñ¡Ôñ£¡%COLOR_RESET%
)
echo.
pause
goto remote_menu

:git_pull
cls
echo %TITLE_BAR%
echo ¨U               %COLOR_TITLE%À­È¡Ô¶³Ì·ÖÖ§%COLOR_RESET%                ¨U
echo %FOOTER_BAR%
echo.
echo µ±Ç°·ÖÖ§: 
git branch --show-current
echo.
set /p remote_name=ÇëÊäÈëÔ¶³Ì²Ö¿âÃû³Æ (Ä¬ÈÏ origin): 
if "!remote_name!"=="" set remote_name=origin
set /p remote_branch=ÇëÊäÈëÔ¶³Ì·ÖÖ§Ãû³Æ (Ä¬ÈÏÓëµ±Ç°·ÖÖ§Í¬Ãû): 
if "!remote_branch!"=="" (
    for /f %%a in ('git branch --show-current') do set remote_branch=%%a
)
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% ³£¹æÀ­È¡ (git pull remote branch)
echo   %COLOR_MENU%2.%COLOR_RESET% À­È¡²¢±ä»ù (git pull --rebase remote branch)
echo   %COLOR_MENU%3.%COLOR_RESET% À­È¡ËùÓĞÔ¶³Ì·ÖÖ§ (git pull --all)
echo.
set /p pull_choice=ÇëÑ¡ÔñÀ­È¡·½Ê½ (1-3): 

if "%pull_choice%"=="1" (
    git pull !remote_name! !remote_branch!
) else if "%pull_choice%"=="2" (
    git pull --rebase !remote_name! !remote_branch!
) else if "%pull_choice%"=="3" (
    git pull --all
) else (
    echo %COLOR_ERROR%ÎŞĞ§Ñ¡Ôñ£¡%COLOR_RESET%
)
echo.
pause
goto main_menu

:git_push
cls
echo %TITLE_BAR%
echo ¨U               %COLOR_TITLE%ÍÆËÍ±¾µØ·ÖÖ§%COLOR_RESET%                ¨U
echo %FOOTER_BAR%
echo.
echo µ±Ç°·ÖÖ§: 
git branch --show-current
echo.
set /p remote_name=ÇëÊäÈëÔ¶³Ì²Ö¿âÃû³Æ (Ä¬ÈÏ origin): 
if "!remote_name!"=="" set remote_name=origin
set /p remote_branch=ÇëÊäÈëÔ¶³Ì·ÖÖ§Ãû³Æ (Ä¬ÈÏÓëµ±Ç°·ÖÖ§Í¬Ãû): 
if "!remote_branch!"=="" (
    for /f %%a in ('git branch --show-current') do set remote_branch=%%a
)
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% ³£¹æÍÆËÍ (git push remote branch)
echo   %COLOR_MENU%2.%COLOR_RESET% ÉèÖÃÉÏÓÎ²¢ÍÆËÍ (git push -u remote branch)
echo   %COLOR_MENU%3.%COLOR_RESET% Ç¿ÖÆÍÆËÍ (git push -f remote branch)
echo   %COLOR_MENU%4.%COLOR_RESET% É¾³ıÔ¶³Ì·ÖÖ§ (git push remote --delete branch)
echo.
set /p push_choice=ÇëÑ¡ÔñÍÆËÍ·½Ê½ (1-4): 

if "%push_choice%"=="1" (
    git push !remote_name! !remote_branch!
) else if "%push_choice%"=="2" (
    git push -u !remote_name! !remote_branch!
) else if "%push_choice%"=="3" (
    git push -f !remote_name! !remote_branch!
) else if "%push_choice%"=="4" (
    git push !remote_name! --delete !remote_branch!
) else (
    echo %COLOR_ERROR%ÎŞĞ§Ñ¡Ôñ£¡%COLOR_RESET%
)
echo.
pause
goto main_menu

:revert_menu
cls
echo %TITLE_BAR%
echo ¨U               %COLOR_TITLE%ÎÄ¼ş»ØÍË²Ù×÷%COLOR_RESET%                ¨U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% ³·Ïú¹¤×÷ÇøĞŞ¸Ä (git checkout -- filename)
echo   %COLOR_MENU%2.%COLOR_RESET% ³·ÏúÔİ´æÇøĞŞ¸Ä (git reset HEAD filename)
echo   %COLOR_MENU%3.%COLOR_RESET% »ØÍËµ½Ö¸¶¨Ìá½» (git reset --hard commit_id)
echo   %COLOR_MENU%4.%COLOR_RESET% ¶ªÆú×îºóÒ»´ÎÌá½» (git reset --hard HEAD^)
echo   %COLOR_MENU%5.%COLOR_RESET% »ØÍËÖ¸¶¨ÊıÁ¿µÄÌá½» (git reset --hard HEAD~n)
echo   %COLOR_MENU%6.%COLOR_RESET% »Ö¸´ÒÑÉ¾³ıµÄÎÄ¼ş (git checkout commit_id -- filename)
echo   %COLOR_MENU%7.%COLOR_RESET% ´´½¨³·ÏúÌá½» (git revert commit_id)
echo   %COLOR_MENU%8.%COLOR_RESET% ²é¿´Ìá½»ÀúÊ·ÒÔ»ñÈ¡commit_id (git log)
echo   %COLOR_MENU%9.%COLOR_RESET% ·µ»ØÖ÷²Ëµ¥
echo.
set /p revert_choice=ÇëÑ¡Ôñ²Ù×÷ (1-9): 

if "%revert_choice%"=="1" (
    set /p filename=ÇëÊäÈëÒª³·ÏúĞŞ¸ÄµÄÎÄ¼şÃû: 
    git checkout -- !filename!
    echo %COLOR_SUCCESS%ÒÑ³·Ïú !filename! ÔÚ¹¤×÷ÇøµÄĞŞ¸Ä£¡%COLOR_RESET%
) else if "%revert_choice%"=="2" (
    set /p filename=ÇëÊäÈëÒª´ÓÔİ´æÇø³·ÏúµÄÎÄ¼şÃû: 
    git reset HEAD !filename!
    echo %COLOR_SUCCESS%ÒÑ½« !filename! ´ÓÔİ´æÇø³·Ïú£¡%COLOR_RESET%
) else if "%revert_choice%"=="3" (
    set /p commit_id=ÇëÊäÈëÒª»ØÍËµ½µÄcommit_id: 
    git reset --hard !commit_id!
    echo %COLOR_SUCCESS%ÒÑ»ØÍËµ½Ìá½» !commit_id!%COLOR_RESET%
) else if "%revert_choice%"=="4" (
    git reset --hard HEAD^
    echo %COLOR_SUCCESS%ÒÑ¶ªÆú×îºóÒ»´ÎÌá½»£¡%COLOR_RESET%
) else if "%revert_choice%"=="5" (
    set /p n=ÇëÊäÈëÒª»ØÍËµÄÌá½»ÊıÁ¿: 
    git reset --hard HEAD~!n!
    echo %COLOR_SUCCESS%ÒÑ»ØÍË !n! ´ÎÌá½»£¡%COLOR_RESET%
) else if "%revert_choice%"=="6" (
    set /p commit_id=ÇëÊäÈëÎÄ¼ş´æÔÚµÄcommit_id: 
    set /p filename=ÇëÊäÈëÒª»Ö¸´µÄÎÄ¼şÃû: 
    git checkout !commit_id! -- !filename!
    echo %COLOR_SUCCESS%ÒÑ»Ö¸´ !filename! µ½¹¤×÷Çø£¡%COLOR_RESET%
) else if "%revert_choice%"=="7" (
    set /p commit_id=ÇëÊäÈëÒª³·ÏúµÄcommit_id: 
    git revert !commit_id!
) else if "%revert_choice%"=="8" (
    git log --oneline --decorate --graph --all
) else if "%revert_choice%"=="9" (
    goto main_menu
) else (
    echo %COLOR_ERROR%ÎŞĞ§Ñ¡Ôñ£¡%COLOR_RESET%
)
echo.
pause
goto revert_menu

:git_diff
cls
echo %TITLE_BAR%
echo ¨U               %COLOR_TITLE%±È½ÏÎÄ¼ş²îÒì%COLOR_RESET%                ¨U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% ²é¿´¹¤×÷ÇøÓëÔİ´æÇø²îÒì (git diff)
echo   %COLOR_MENU%2.%COLOR_RESET% ²é¿´Ôİ´æÇøÓë×îºóÒ»´ÎÌá½»²îÒì (git diff --staged)
echo   %COLOR_MENU%3.%COLOR_RESET% ²é¿´¹¤×÷ÇøÓë×îºóÒ»´ÎÌá½»²îÒì (git diff HEAD)
echo   %COLOR_MENU%4.%COLOR_RESET% ²é¿´Á½¸öÌá½»Ö®¼äµÄ²îÒì (git diff commit_id1 commit_id2)
echo   %COLOR_MENU%5.%COLOR_RESET% ²é¿´Á½¸ö·ÖÖ§Ö®¼äµÄ²îÒì (git diff branch1 branch2)
echo   %COLOR_MENU%6.%COLOR_RESET% ²é¿´ÎÄ¼şÔÚÁ½´ÎÌá½»Ö®¼äµÄ²îÒì (git diff commit_id1 commit_id2 -- filename)
echo   %COLOR_MENU%7.%COLOR_RESET% ·µ»ØÖ÷²Ëµ¥
echo.
set /p diff_choice=ÇëÑ¡Ôñ²Ù×÷ (1-7): 

if "%diff_choice%"=="1" (
    git diff
) else if "%diff_choice%"=="2" (
    git diff --staged
) else if "%diff_choice%"=="3" (
    git diff HEAD
) else if "%diff_choice%"=="4" (
    set /p commit_id1=ÇëÊäÈëµÚÒ»¸öcommit_id: 
    set /p commit_id2=ÇëÊäÈëµÚ¶ş¸öcommit_id: 
    git diff !commit_id1! !commit_id2!
) else if "%diff_choice%"=="5" (
    set /p branch1=ÇëÊäÈëµÚÒ»¸ö·ÖÖ§Ãû³Æ: 
    set /p branch2=ÇëÊäÈëµÚ¶ş¸ö·ÖÖ§Ãû³Æ: 
    git diff !branch1! !branch2!
) else if "%diff_choice%"=="6" (
    set /p commit_id1=ÇëÊäÈëµÚÒ»¸öcommit_id: 
    set /p commit_id2=ÇëÊäÈëµÚ¶ş¸öcommit_id: 
    set /p filename=ÇëÊäÈëÎÄ¼şÃû: 
    git diff !commit_id1! !commit_id2! -- !filename!
) else if "%diff_choice%"=="7" (
    goto main_menu
) else (
    echo %COLOR_ERROR%ÎŞĞ§Ñ¡Ôñ£¡%COLOR_RESET%
)
echo.
pause
goto main_menu

:git_show
cls
echo %TITLE_BAR%
echo ¨U               %COLOR_TITLE%²é¿´Ìá½»ÏêÇé%COLOR_RESET%                ¨U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% ²é¿´×îĞÂÌá½»ÏêÇé (git show)
echo   %COLOR_MENU%2.%COLOR_RESET% ²é¿´Ö¸¶¨Ìá½»ÏêÇé (git show commit_id)
echo   %COLOR_MENU%3.%COLOR_RESET% ²é¿´Ö¸¶¨ÎÄ¼şÔÚÌá½»ÖĞµÄĞŞ¸Ä (git show commit_id:filename)
echo   %COLOR_MENU%4.%COLOR_RESET% ·µ»ØÖ÷²Ëµ¥
echo.
set /p show_choice=ÇëÑ¡Ôñ²Ù×÷ (1-4): 

if "%show_choice%"=="1" (
    git show
) else if "%show_choice%"=="2" (
    set /p commit_id=ÇëÊäÈëÒª²é¿´µÄcommit_id: 
    git show !commit_id!
) else if "%show_choice%"=="3" (
    set /p commit_id=ÇëÊäÈëcommit_id: 
    set /p filename=ÇëÊäÈëÎÄ¼şÃû: 
    git show !commit_id!:!filename!
) else if "%show_choice%"=="4" (
    goto main_menu
) else (
    echo %COLOR_ERROR%ÎŞĞ§Ñ¡Ôñ£¡%COLOR_RESET%
)
echo.
pause
goto main_menu

:stash_menu
cls
echo %TITLE_BAR%
echo ¨U                %COLOR_TITLE%stash ²Ù×÷%COLOR_RESET%                 ¨U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% ±£´æµ±Ç°ĞŞ¸Ä (git stash)
echo   %COLOR_MENU%2.%COLOR_RESET% ±£´æ²¢ÃüÃûĞŞ¸Ä (git stash save "message")
echo   %COLOR_MENU%3.%COLOR_RESET% ²é¿´stashÁĞ±í (git stash list)
echo   %COLOR_MENU%4.%COLOR_RESET% Ó¦ÓÃ×î½üµÄstash (git stash apply)
echo   %COLOR_MENU%5.%COLOR_RESET% Ó¦ÓÃ²¢É¾³ı×î½üµÄstash (git stash pop)
echo   %COLOR_MENU%6.%COLOR_RESET% Ó¦ÓÃÖ¸¶¨µÄstash (git stash apply stash@{n})
echo   %COLOR_MENU%7.%COLOR_RESET% É¾³ıÖ¸¶¨µÄstash (git stash drop stash@{n})
echo   %COLOR_MENU%8.%COLOR_RESET% É¾³ıËùÓĞstash (git stash clear)
echo   %COLOR_MENU%9.%COLOR_RESET% ²é¿´stash²îÒì (git stash show stash@{n})
echo   %COLOR_MENU%10.%COLOR_RESET% ·µ»ØÖ÷²Ëµ¥
echo.
set /p stash_choice=ÇëÑ¡Ôñ²Ù×÷ (1-10): 

if "%stash_choice%"=="1" (
    git stash
) else if "%stash_choice%"=="2" (
    set /p message=ÇëÊäÈëstashËµÃ÷: 
    git stash save "%message%"
) else if "%stash_choice%"=="3" (
    git stash list
) else if "%stash_choice%"=="4" (
    git stash apply
) else if "%stash_choice%"=="5" (
    git stash pop
) else if "%stash_choice%"=="6" (
    set /p n=ÇëÊäÈëstash±àºÅ (ÀıÈç0): 
    git stash apply stash@(!n!)
) else if "%stash_choice%"=="7" (
    set /p n=ÇëÊäÈëstash±àºÅ (ÀıÈç0): 
    git stash drop stash@(!n!)
) else if "%stash_choice%"=="8" (
    git stash clear
) else if "%stash_choice%"=="9" (
    set /p n=ÇëÊäÈëstash±àºÅ (ÀıÈç0): 
    git stash show stash@(!n!)
) else if "%stash_choice%"=="10" (
    goto main_menu
) else (
    echo %COLOR_ERROR%ÎŞĞ§Ñ¡Ôñ£¡%COLOR_RESET%
)
echo.
pause
goto stash_menu

:tag_menu
cls
echo %TITLE_BAR%
echo ¨U                %COLOR_TITLE%±êÇ©²Ù×÷%COLOR_RESET%                 ¨U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% ²é¿´ËùÓĞ±êÇ© (git tag)
echo   %COLOR_MENU%2.%COLOR_RESET% ´´½¨ÇáÁ¿±êÇ© (git tag tagname)
echo   %COLOR_MENU%3.%COLOR_RESET% ´´½¨¸½×¢±êÇ© (git tag -a tagname -m "message")
echo   %COLOR_MENU%4.%COLOR_RESET% É¾³ı±êÇ© (git tag -d tagname)
echo   %COLOR_MENU%5.%COLOR_RESET% ²é¿´±êÇ©ĞÅÏ¢ (git show tagname)
echo   %COLOR_MENU%6.%COLOR_RESET% ÍÆËÍ±êÇ©µ½Ô¶³Ì (git push origin tagname)
echo   %COLOR_MENU%7.%COLOR_RESET% ÍÆËÍËùÓĞ±êÇ©µ½Ô¶³Ì (git push origin --tags)
echo   %COLOR_MENU%8.%COLOR_RESET% ¼ì³ö±êÇ© (git checkout -b branchname tagname)
echo   %COLOR_MENU%9.%COLOR_RESET% ·µ»ØÖ÷²Ëµ¥
echo.
set /p tag_choice=ÇëÑ¡Ôñ²Ù×÷ (1-9): 

if "%tag_choice%"=="1" (
    git tag
) else if "%tag_choice%"=="2" (
    set /p tagname=ÇëÊäÈë±êÇ©Ãû³Æ: 
    git tag !tagname!
    echo %COLOR_SUCCESS%ÒÑ´´½¨±êÇ© !tagname!%COLOR_RESET%
) else if "%tag_choice%"=="3" (
    set /p tagname=ÇëÊäÈë±êÇ©Ãû³Æ: 
    set /p message=ÇëÊäÈë±êÇ©ËµÃ÷: 
    git tag -a !tagname! -m "%message%"
    echo %COLOR_SUCCESS%ÒÑ´´½¨¸½×¢±êÇ© !tagname!%COLOR_RESET%
) else if "%tag_choice%"=="4" (
    set /p tagname=ÇëÊäÈëÒªÉ¾³ıµÄ±êÇ©Ãû³Æ: 
    git tag -d !tagname!
) else if "%tag_choice%"=="5" (
    set /p tagname=ÇëÊäÈëÒª²é¿´µÄ±êÇ©Ãû³Æ: 
    git show !tagname!
) else if "%tag_choice%"=="6" (
    set /p tagname=ÇëÊäÈëÒªÍÆËÍµÄ±êÇ©Ãû³Æ: 
    git push origin !tagname!
) else if "%tag_choice%"=="7" (
    git push origin --tags
    echo %COLOR_SUCCESS%ÒÑÍÆËÍËùÓĞ±êÇ©µ½Ô¶³Ì%COLOR_RESET%
) else if "%tag_choice%"=="8" (
    set /p branchname=ÇëÊäÈë·ÖÖ§Ãû³Æ: 
    set /p tagname=ÇëÊäÈë±êÇ©Ãû³Æ: 
    git checkout -b !branchname! !tagname!
    echo %COLOR_SUCCESS%ÒÑ´Ó±êÇ© !tagname! ´´½¨·ÖÖ§ !branchname!%COLOR_RESET%
) else if "%tag_choice%"=="9" (
    goto main_menu
) else (
    echo %COLOR_ERROR%ÎŞĞ§Ñ¡Ôñ£¡%COLOR_RESET%
)
echo.
pause
goto tag_menu

:config_menu
cls
echo %TITLE_BAR%
echo ¨U               %COLOR_TITLE%ÅäÖÃ¹ÜÀí%COLOR_RESET%                ¨U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% ²é¿´È«¾ÖÅäÖÃ (git config --global --list)
echo   %COLOR_MENU%2.%COLOR_RESET% ²é¿´±¾µØÅäÖÃ (git config --local --list)
echo   %COLOR_MENU%3.%COLOR_RESET% ÉèÖÃÈ«¾ÖÓÃ»§Ãû (git config --global user.name "name")
echo   %COLOR_MENU%4.%COLOR_RESET% ÉèÖÃÈ«¾ÖÓÊÏä (git config --global user.email "email")
echo   %COLOR_MENU%5.%COLOR_RESET% ÉèÖÃ±à¼­Æ÷ (git config --global core.editor "editor")
echo   %COLOR_MENU%6.%COLOR_RESET% ÉèÖÃºÏ²¢¹¤¾ß (git config --global merge.tool "tool")
echo   %COLOR_MENU%7.%COLOR_RESET% ÉèÖÃ±ğÃû (git config --global alias.alias-name "git-command")
echo   %COLOR_MENU%8.%COLOR_RESET% ·µ»ØÖ÷²Ëµ¥
echo.
set /p config_choice=ÇëÑ¡Ôñ²Ù×÷ (1-8): 

if "%config_choice%"=="1" (
    git config --global --list
) else if "%config_choice%"=="2" (
    git config --local --list
) else if "%config_choice%"=="3" (
    set /p name=ÇëÊäÈëÓÃ»§Ãû: 
    git config --global user.name "%name%"
    echo %COLOR_SUCCESS%ÒÑÉèÖÃÈ«¾ÖÓÃ»§ÃûÎª %name%%COLOR_RESET%
) else if "%config_choice%"=="4" (
    set /p email=ÇëÊäÈëÓÊÏä: 
    git config --global user.email "%email%"
    echo %COLOR_SUCCESS%ÒÑÉèÖÃÈ«¾ÖÓÊÏäÎª %email%%COLOR_RESET%
) else if "%config_choice%"=="5" (
    set /p editor=ÇëÊäÈë±à¼­Æ÷Ãû³Æ (ÀıÈç notepad, vim): 
    git config --global core.editor "%editor%"
    echo %COLOR_SUCCESS%ÒÑÉèÖÃ±à¼­Æ÷Îª %editor%%COLOR_RESET%
) else if "%config_choice%"=="6" (
    set /p tool=ÇëÊäÈëºÏ²¢¹¤¾ßÃû³Æ (ÀıÈç vimdiff, meld): 
    git config --global merge.tool "%tool%"
    echo %COLOR_SUCCESS%ÒÑÉèÖÃºÏ²¢¹¤¾ßÎª %tool%%COLOR_RESET%
) else if "%config_choice%"=="7" (
    set /p alias_name=ÇëÊäÈë±ğÃû: 
    set /p command=ÇëÊäÈë¶ÔÓ¦µÄgitÃüÁî: 
    git config --global alias.!alias_name! "!command!"
    echo %COLOR_SUCCESS%ÒÑÉèÖÃ±ğÃû !alias_name! Îª "!command!"%COLOR_RESET%
) else if "%config_choice%"=="8" (
    goto main_menu
) else (
    echo %COLOR_ERROR%ÎŞĞ§Ñ¡Ôñ£¡%COLOR_RESET%
)
echo.
pause
goto config_menu

:exit
cls
echo %TITLE_BAR%
echo ¨U           %COLOR_TITLE%¸ĞĞ»Ê¹ÓÃ Git ½»»¥½çÃæ%COLOR_RESET%           ¨U
echo %FOOTER_BAR%
echo.
exit /b 0
    