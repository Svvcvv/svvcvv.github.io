@echo off
setlocal enabledelayedexpansion

:: ��ɫ����
set "COLOR_RESET=[0m"
set "COLOR_TITLE=[93m"    :: ��ɫ
set "COLOR_MENU=[92m"     :: ��ɫ
set "COLOR_ERROR=[91m"    :: ��ɫ
set "COLOR_INFO=[96m"     :: ��ɫ
set "COLOR_SUCCESS=[92m"  :: ��ɫ

:: ���泣��
set "TITLE_BAR=�X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�["
set "FOOTER_BAR=�^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a"
set "DIVIDER=�c���������������������������������������������������������������������������������������������������������������������f"

:main_menu
cls
echo %TITLE_BAR%
echo �U                     %COLOR_TITLE%Git Helper%COLOR_RESET%                       �U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1. %COLOR_RESET% ��ʼ���ֿ� (git init)
echo   %COLOR_MENU%2. %COLOR_RESET% ����ļ����ݴ��� (git add)
echo   %COLOR_MENU%3. %COLOR_RESET% �ύ���� (git commit)
echo   %COLOR_MENU%4. %COLOR_RESET% �鿴״̬ (git status)
echo   %COLOR_MENU%5. %COLOR_RESET% �鿴�ύ��ʷ (git log)
echo   %COLOR_MENU%6. %COLOR_RESET% ��֧����
echo   %COLOR_MENU%7. %COLOR_RESET% �ϲ���֧ (git merge)
echo   %COLOR_MENU%8. %COLOR_RESET% Զ�ֿ̲����
echo   %COLOR_MENU%9. %COLOR_RESET% ��ȡԶ�̷�֧ (git pull)
echo   %COLOR_MENU%10.%COLOR_RESET% ���ͱ��ط�֧ (git push)
echo   %COLOR_MENU%11.%COLOR_RESET% �ļ����˲���
echo   %COLOR_MENU%12.%COLOR_RESET% �Ƚ��ļ����� (git diff)
echo   %COLOR_MENU%13.%COLOR_RESET% �鿴�ύ���� (git show)
echo   %COLOR_MENU%14.%COLOR_RESET% stash ����
echo   %COLOR_MENU%15.%COLOR_RESET% ��ǩ����
echo   %COLOR_MENU%16.%COLOR_RESET% ���ù���
echo   %COLOR_MENU%0. %COLOR_RESET% �˳�
echo.
echo %FOOTER_BAR%

set /p choice=��ѡ����� (0-16): 

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

echo %COLOR_ERROR%��Чѡ�����������룡%COLOR_RESET%
pause
goto main_menu

:git_init
cls
echo %TITLE_BAR%
echo �U                %COLOR_TITLE%��ʼ�� Git �ֿ�%COLOR_RESET%                 �U
echo %FOOTER_BAR%
echo.
git init
echo.
echo %COLOR_SUCCESS%�ֿ��ʼ����ɣ�%COLOR_RESET%
pause
goto main_menu

:git_add
cls
echo %TITLE_BAR%
echo �U              %COLOR_TITLE%����ļ����ݴ���%COLOR_RESET%               �U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% ��������ļ� (git add .)
echo   %COLOR_MENU%2.%COLOR_RESET% ���ָ���ļ� (git add filename)
echo   %COLOR_MENU%3.%COLOR_RESET% ��������޸ĺ�ɾ�����ļ� (git add -u)
echo   %COLOR_MENU%4.%COLOR_RESET% ��������ļ�(�����½��ļ�) (git add -A)
echo.
set /p add_choice=��ѡ����� (1-4): 

if "%add_choice%"=="1" (
    git add .
    echo %COLOR_SUCCESS%����������ļ����ݴ�����%COLOR_RESET%
) else if "%add_choice%"=="2" (
    set /p filename=�������ļ���: 
    git add !filename!
    echo %COLOR_SUCCESS%����� !filename! ���ݴ�����%COLOR_RESET%
) else if "%add_choice%"=="3" (
    git add -u
    echo %COLOR_SUCCESS%����������޸ĺ�ɾ�����ļ����ݴ�����%COLOR_RESET%
) else if "%add_choice%"=="4" (
    git add -A
    echo %COLOR_SUCCESS%����������ļ����ݴ�����%COLOR_RESET%
) else (
    echo %COLOR_ERROR%��Чѡ��%COLOR_RESET%
)
pause
goto main_menu

:git_commit
cls
echo %TITLE_BAR%
echo �U                 %COLOR_TITLE%�ύ����%COLOR_RESET%                  �U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% �����ύ (git commit -m "message")
echo   %COLOR_MENU%2.%COLOR_RESET% ��Ӳ��ύ (git commit -am "message")
echo   %COLOR_MENU%3.%COLOR_RESET% �޸����һ���ύ (git commit --amend)
echo.
set /p commit_choice=��ѡ����� (1-3): 

if "%commit_choice%"=="1" (
    set /p commit_msg=�������ύ˵��: 
    git commit -m "%commit_msg%"
) else if "%commit_choice%"=="2" (
    set /p commit_msg=�������ύ˵��: 
    git commit -am "%commit_msg%"
) else if "%commit_choice%"=="3" (
    git commit --amend
) else (
    echo %COLOR_ERROR%��Чѡ��%COLOR_RESET%
)
echo.
pause
goto main_menu

:git_status
cls
echo %TITLE_BAR%
echo �U                 %COLOR_TITLE%�鿴״̬%COLOR_RESET%                  �U
echo %FOOTER_BAR%
echo.
git status
echo.
pause
goto main_menu

:git_log
cls
echo %TITLE_BAR%
echo �U               %COLOR_TITLE%�鿴�ύ��ʷ%COLOR_RESET%                �U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% ��׼��ͼ (git log)
echo   %COLOR_MENU%2.%COLOR_RESET% ������ͼ (git log --oneline)
echo   %COLOR_MENU%3.%COLOR_RESET% ͼ����ͼ (git log --graph --oneline --decorate)
echo   %COLOR_MENU%4.%COLOR_RESET% ���з�֧��ͼ (git log --all --graph --oneline --decorate)
echo   %COLOR_MENU%5.%COLOR_RESET% ���ļ�������ͼ (git log --name-status)
echo.
set /p log_choice=��ѡ����ͼ���� (1-5): 

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
    echo %COLOR_ERROR%��Чѡ��%COLOR_RESET%
)
echo.
pause
goto main_menu

:branch_menu
cls
echo %TITLE_BAR%
echo �U                 %COLOR_TITLE%��֧����%COLOR_RESET%                  �U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% �鿴���ط�֧ (git branch)
echo   %COLOR_MENU%2.%COLOR_RESET% �鿴���з�֧ (git branch -a)
echo   %COLOR_MENU%3.%COLOR_RESET% �����·�֧ (git branch branchname)
echo   %COLOR_MENU%4.%COLOR_RESET% �л���֧ (git checkout branchname)
echo   %COLOR_MENU%5.%COLOR_RESET% �������л���֧ (git checkout -b branchname)
echo   %COLOR_MENU%6.%COLOR_RESET% ɾ����֧ (git branch -d branchname)
echo   %COLOR_MENU%7.%COLOR_RESET% ǿ��ɾ����֧ (git branch -D branchname)
echo   %COLOR_MENU%8.%COLOR_RESET% ��������֧ (git branch -m oldname newname)
echo   %COLOR_MENU%9.%COLOR_RESET% �鿴��֧�ϲ�ͼ (git log --graph --oneline --decorate --all)
echo   %COLOR_MENU%10.%COLOR_RESET% �鿴��ǰ��֧ (git branch --show-current)
echo   %COLOR_MENU%11.%COLOR_RESET% �������˵�
echo.
set /p branch_choice=��ѡ����� (1-11): 

if "%branch_choice%"=="1" (
    git branch
) else if "%branch_choice%"=="2" (
    git branch -a
) else if "%branch_choice%"=="3" (
    set /p branchname=�������·�֧����: 
    git branch !branchname!
    echo %COLOR_SUCCESS%�Ѵ�����֧ !branchname!%COLOR_RESET%
) else if "%branch_choice%"=="4" (
    set /p branchname=������Ҫ�л��ķ�֧����: 
    git checkout !branchname!
) else if "%branch_choice%"=="5" (
    set /p branchname=�������·�֧����: 
    git checkout -b !branchname!
    echo %COLOR_SUCCESS%�Ѵ������л�����֧ !branchname!%COLOR_RESET%
) else if "%branch_choice%"=="6" (
    set /p branchname=������Ҫɾ���ķ�֧����: 
    git branch -d !branchname!
) else if "%branch_choice%"=="7" (
    set /p branchname=������Ҫǿ��ɾ���ķ�֧����: 
    git branch -D !branchname!
) else if "%branch_choice%"=="8" (
    set /p oldname=������ԭ��֧����: 
    set /p newname=�������·�֧����: 
    git branch -m !oldname! !newname!
    echo %COLOR_SUCCESS%�ѽ���֧ !oldname! ������Ϊ !newname!%COLOR_RESET%
) else if "%branch_choice%"=="9" (
    git log --graph --oneline --decorate --all
) else if "%branch_choice%"=="10" (
    git branch --show-current
) else if "%branch_choice%"=="11" (
    goto main_menu
) else (
    echo %COLOR_ERROR%��Чѡ��%COLOR_RESET%
)
echo.
pause
goto branch_menu

:git_merge
cls
echo %TITLE_BAR%
echo �U                 %COLOR_TITLE%�ϲ���֧%COLOR_RESET%                  �U
echo %FOOTER_BAR%
echo.
echo ��ǰ��֧: 
git branch --show-current
echo.
set /p source_branch=������Ҫ�ϲ���Դ��֧����: 
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% ����ϲ� (git merge branchname)
echo   %COLOR_MENU%2.%COLOR_RESET% ����ϲ� (git merge --ff branchname)
echo   %COLOR_MENU%3.%COLOR_RESET% �ǿ���ϲ� (git merge --no-ff branchname)
echo   %COLOR_MENU%4.%COLOR_RESET% �ϲ����ύ (git merge --commit branchname)
echo   %COLOR_MENU%5.%COLOR_RESET% �ϲ������ύ (git merge --no-commit branchname)
echo.
set /p merge_choice=��ѡ��ϲ���ʽ (1-5): 

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
    echo %COLOR_ERROR%��Чѡ��%COLOR_RESET%
)
echo.
pause
goto main_menu

:remote_menu
cls
echo %TITLE_BAR%
echo �U               %COLOR_TITLE%Զ�ֿ̲����%COLOR_RESET%                �U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% �鿴Զ�ֿ̲� (git remote -v)
echo   %COLOR_MENU%2.%COLOR_RESET% ���Զ�ֿ̲� (git remote add name url)
echo   %COLOR_MENU%3.%COLOR_RESET% ɾ��Զ�ֿ̲� (git remote remove name)
echo   %COLOR_MENU%4.%COLOR_RESET% �޸�Զ�ֿ̲�URL (git remote set-url name url)
echo   %COLOR_MENU%5.%COLOR_RESET% �鿴Զ�̷�֧ (git branch -r)
echo   %COLOR_MENU%6.%COLOR_RESET% ��ȡԶ�̷�֧ (git fetch)
echo   %COLOR_MENU%7.%COLOR_RESET% ������Զ�ֿ̲� (git remote rename oldname newname)
echo   %COLOR_MENU%8.%COLOR_RESET% �鿴Զ�ֿ̲���Ϣ (git remote show name)
echo   %COLOR_MENU%9.%COLOR_RESET% �������˵�
echo.
set /p remote_choice=��ѡ����� (1-9): 

if "%remote_choice%"=="1" (
    git remote -v
) else if "%remote_choice%"=="2" (
    set /p remote_name=������Զ�ֿ̲�����: 
    set /p remote_url=������Զ�ֿ̲�URL: 
    git remote add !remote_name! !remote_url!
    echo %COLOR_SUCCESS%�����Զ�ֿ̲� !remote_name!%COLOR_RESET%
) else if "%remote_choice%"=="3" (
    set /p remote_name=������Ҫɾ����Զ�ֿ̲�����: 
    git remote remove !remote_name!
    echo %COLOR_SUCCESS%��ɾ��Զ�ֿ̲� !remote_name!%COLOR_RESET%
) else if "%remote_choice%"=="4" (
    set /p remote_name=������Ҫ�޸ĵ�Զ�ֿ̲�����: 
    set /p remote_url=�������µ�Զ�ֿ̲�URL: 
    git remote set-url !remote_name! !remote_url!
    echo %COLOR_SUCCESS%���޸�Զ�ֿ̲� !remote_name! ��URL%COLOR_RESET%
) else if "%remote_choice%"=="5" (
    git branch -r
) else if "%remote_choice%"=="6" (
    set /p remote_name=������Զ�ֿ̲����� (Ĭ�� origin): 
    if "!remote_name!"=="" set remote_name=origin
    git fetch !remote_name!
) else if "%remote_choice%"=="7" (
    set /p oldname=������ԭԶ�ֿ̲�����: 
    set /p newname=��������Զ�ֿ̲�����: 
    git remote rename !oldname! !newname!
    echo %COLOR_SUCCESS%�ѽ�Զ�ֿ̲� !oldname! ������Ϊ !newname!%COLOR_RESET%
) else if "%remote_choice%"=="8" (
    set /p remote_name=������Զ�ֿ̲����� (Ĭ�� origin): 
    if "!remote_name!"=="" set remote_name=origin
    git remote show !remote_name!
) else if "%remote_choice%"=="9" (
    goto main_menu
) else (
    echo %COLOR_ERROR%��Чѡ��%COLOR_RESET%
)
echo.
pause
goto remote_menu

:git_pull
cls
echo %TITLE_BAR%
echo �U               %COLOR_TITLE%��ȡԶ�̷�֧%COLOR_RESET%                �U
echo %FOOTER_BAR%
echo.
echo ��ǰ��֧: 
git branch --show-current
echo.
set /p remote_name=������Զ�ֿ̲����� (Ĭ�� origin): 
if "!remote_name!"=="" set remote_name=origin
set /p remote_branch=������Զ�̷�֧���� (Ĭ���뵱ǰ��֧ͬ��): 
if "!remote_branch!"=="" (
    for /f %%a in ('git branch --show-current') do set remote_branch=%%a
)
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% ������ȡ (git pull remote branch)
echo   %COLOR_MENU%2.%COLOR_RESET% ��ȡ����� (git pull --rebase remote branch)
echo   %COLOR_MENU%3.%COLOR_RESET% ��ȡ����Զ�̷�֧ (git pull --all)
echo.
set /p pull_choice=��ѡ����ȡ��ʽ (1-3): 

if "%pull_choice%"=="1" (
    git pull !remote_name! !remote_branch!
) else if "%pull_choice%"=="2" (
    git pull --rebase !remote_name! !remote_branch!
) else if "%pull_choice%"=="3" (
    git pull --all
) else (
    echo %COLOR_ERROR%��Чѡ��%COLOR_RESET%
)
echo.
pause
goto main_menu

:git_push
cls
echo %TITLE_BAR%
echo �U               %COLOR_TITLE%���ͱ��ط�֧%COLOR_RESET%                �U
echo %FOOTER_BAR%
echo.
echo ��ǰ��֧: 
git branch --show-current
echo.
set /p remote_name=������Զ�ֿ̲����� (Ĭ�� origin): 
if "!remote_name!"=="" set remote_name=origin
set /p remote_branch=������Զ�̷�֧���� (Ĭ���뵱ǰ��֧ͬ��): 
if "!remote_branch!"=="" (
    for /f %%a in ('git branch --show-current') do set remote_branch=%%a
)
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% �������� (git push remote branch)
echo   %COLOR_MENU%2.%COLOR_RESET% �������β����� (git push -u remote branch)
echo   %COLOR_MENU%3.%COLOR_RESET% ǿ������ (git push -f remote branch)
echo   %COLOR_MENU%4.%COLOR_RESET% ɾ��Զ�̷�֧ (git push remote --delete branch)
echo.
set /p push_choice=��ѡ�����ͷ�ʽ (1-4): 

if "%push_choice%"=="1" (
    git push !remote_name! !remote_branch!
) else if "%push_choice%"=="2" (
    git push -u !remote_name! !remote_branch!
) else if "%push_choice%"=="3" (
    git push -f !remote_name! !remote_branch!
) else if "%push_choice%"=="4" (
    git push !remote_name! --delete !remote_branch!
) else (
    echo %COLOR_ERROR%��Чѡ��%COLOR_RESET%
)
echo.
pause
goto main_menu

:revert_menu
cls
echo %TITLE_BAR%
echo �U               %COLOR_TITLE%�ļ����˲���%COLOR_RESET%                �U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% �����������޸� (git checkout -- filename)
echo   %COLOR_MENU%2.%COLOR_RESET% �����ݴ����޸� (git reset HEAD filename)
echo   %COLOR_MENU%3.%COLOR_RESET% ���˵�ָ���ύ (git reset --hard commit_id)
echo   %COLOR_MENU%4.%COLOR_RESET% �������һ���ύ (git reset --hard HEAD^)
echo   %COLOR_MENU%5.%COLOR_RESET% ����ָ���������ύ (git reset --hard HEAD~n)
echo   %COLOR_MENU%6.%COLOR_RESET% �ָ���ɾ�����ļ� (git checkout commit_id -- filename)
echo   %COLOR_MENU%7.%COLOR_RESET% ���������ύ (git revert commit_id)
echo   %COLOR_MENU%8.%COLOR_RESET% �鿴�ύ��ʷ�Ի�ȡcommit_id (git log)
echo   %COLOR_MENU%9.%COLOR_RESET% �������˵�
echo.
set /p revert_choice=��ѡ����� (1-9): 

if "%revert_choice%"=="1" (
    set /p filename=������Ҫ�����޸ĵ��ļ���: 
    git checkout -- !filename!
    echo %COLOR_SUCCESS%�ѳ��� !filename! �ڹ��������޸ģ�%COLOR_RESET%
) else if "%revert_choice%"=="2" (
    set /p filename=������Ҫ���ݴ����������ļ���: 
    git reset HEAD !filename!
    echo %COLOR_SUCCESS%�ѽ� !filename! ���ݴ���������%COLOR_RESET%
) else if "%revert_choice%"=="3" (
    set /p commit_id=������Ҫ���˵���commit_id: 
    git reset --hard !commit_id!
    echo %COLOR_SUCCESS%�ѻ��˵��ύ !commit_id!%COLOR_RESET%
) else if "%revert_choice%"=="4" (
    git reset --hard HEAD^
    echo %COLOR_SUCCESS%�Ѷ������һ���ύ��%COLOR_RESET%
) else if "%revert_choice%"=="5" (
    set /p n=������Ҫ���˵��ύ����: 
    git reset --hard HEAD~!n!
    echo %COLOR_SUCCESS%�ѻ��� !n! ���ύ��%COLOR_RESET%
) else if "%revert_choice%"=="6" (
    set /p commit_id=�������ļ����ڵ�commit_id: 
    set /p filename=������Ҫ�ָ����ļ���: 
    git checkout !commit_id! -- !filename!
    echo %COLOR_SUCCESS%�ѻָ� !filename! ����������%COLOR_RESET%
) else if "%revert_choice%"=="7" (
    set /p commit_id=������Ҫ������commit_id: 
    git revert !commit_id!
) else if "%revert_choice%"=="8" (
    git log --oneline --decorate --graph --all
) else if "%revert_choice%"=="9" (
    goto main_menu
) else (
    echo %COLOR_ERROR%��Чѡ��%COLOR_RESET%
)
echo.
pause
goto revert_menu

:git_diff
cls
echo %TITLE_BAR%
echo �U               %COLOR_TITLE%�Ƚ��ļ�����%COLOR_RESET%                �U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% �鿴���������ݴ������� (git diff)
echo   %COLOR_MENU%2.%COLOR_RESET% �鿴�ݴ��������һ���ύ���� (git diff --staged)
echo   %COLOR_MENU%3.%COLOR_RESET% �鿴�����������һ���ύ���� (git diff HEAD)
echo   %COLOR_MENU%4.%COLOR_RESET% �鿴�����ύ֮��Ĳ��� (git diff commit_id1 commit_id2)
echo   %COLOR_MENU%5.%COLOR_RESET% �鿴������֧֮��Ĳ��� (git diff branch1 branch2)
echo   %COLOR_MENU%6.%COLOR_RESET% �鿴�ļ��������ύ֮��Ĳ��� (git diff commit_id1 commit_id2 -- filename)
echo   %COLOR_MENU%7.%COLOR_RESET% �������˵�
echo.
set /p diff_choice=��ѡ����� (1-7): 

if "%diff_choice%"=="1" (
    git diff
) else if "%diff_choice%"=="2" (
    git diff --staged
) else if "%diff_choice%"=="3" (
    git diff HEAD
) else if "%diff_choice%"=="4" (
    set /p commit_id1=�������һ��commit_id: 
    set /p commit_id2=������ڶ���commit_id: 
    git diff !commit_id1! !commit_id2!
) else if "%diff_choice%"=="5" (
    set /p branch1=�������һ����֧����: 
    set /p branch2=������ڶ�����֧����: 
    git diff !branch1! !branch2!
) else if "%diff_choice%"=="6" (
    set /p commit_id1=�������һ��commit_id: 
    set /p commit_id2=������ڶ���commit_id: 
    set /p filename=�������ļ���: 
    git diff !commit_id1! !commit_id2! -- !filename!
) else if "%diff_choice%"=="7" (
    goto main_menu
) else (
    echo %COLOR_ERROR%��Чѡ��%COLOR_RESET%
)
echo.
pause
goto main_menu

:git_show
cls
echo %TITLE_BAR%
echo �U               %COLOR_TITLE%�鿴�ύ����%COLOR_RESET%                �U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% �鿴�����ύ���� (git show)
echo   %COLOR_MENU%2.%COLOR_RESET% �鿴ָ���ύ���� (git show commit_id)
echo   %COLOR_MENU%3.%COLOR_RESET% �鿴ָ���ļ����ύ�е��޸� (git show commit_id:filename)
echo   %COLOR_MENU%4.%COLOR_RESET% �������˵�
echo.
set /p show_choice=��ѡ����� (1-4): 

if "%show_choice%"=="1" (
    git show
) else if "%show_choice%"=="2" (
    set /p commit_id=������Ҫ�鿴��commit_id: 
    git show !commit_id!
) else if "%show_choice%"=="3" (
    set /p commit_id=������commit_id: 
    set /p filename=�������ļ���: 
    git show !commit_id!:!filename!
) else if "%show_choice%"=="4" (
    goto main_menu
) else (
    echo %COLOR_ERROR%��Чѡ��%COLOR_RESET%
)
echo.
pause
goto main_menu

:stash_menu
cls
echo %TITLE_BAR%
echo �U                %COLOR_TITLE%stash ����%COLOR_RESET%                 �U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% ���浱ǰ�޸� (git stash)
echo   %COLOR_MENU%2.%COLOR_RESET% ���沢�����޸� (git stash save "message")
echo   %COLOR_MENU%3.%COLOR_RESET% �鿴stash�б� (git stash list)
echo   %COLOR_MENU%4.%COLOR_RESET% Ӧ�������stash (git stash apply)
echo   %COLOR_MENU%5.%COLOR_RESET% Ӧ�ò�ɾ�������stash (git stash pop)
echo   %COLOR_MENU%6.%COLOR_RESET% Ӧ��ָ����stash (git stash apply stash@{n})
echo   %COLOR_MENU%7.%COLOR_RESET% ɾ��ָ����stash (git stash drop stash@{n})
echo   %COLOR_MENU%8.%COLOR_RESET% ɾ������stash (git stash clear)
echo   %COLOR_MENU%9.%COLOR_RESET% �鿴stash���� (git stash show stash@{n})
echo   %COLOR_MENU%10.%COLOR_RESET% �������˵�
echo.
set /p stash_choice=��ѡ����� (1-10): 

if "%stash_choice%"=="1" (
    git stash
) else if "%stash_choice%"=="2" (
    set /p message=������stash˵��: 
    git stash save "%message%"
) else if "%stash_choice%"=="3" (
    git stash list
) else if "%stash_choice%"=="4" (
    git stash apply
) else if "%stash_choice%"=="5" (
    git stash pop
) else if "%stash_choice%"=="6" (
    set /p n=������stash��� (����0): 
    git stash apply stash@(!n!)
) else if "%stash_choice%"=="7" (
    set /p n=������stash��� (����0): 
    git stash drop stash@(!n!)
) else if "%stash_choice%"=="8" (
    git stash clear
) else if "%stash_choice%"=="9" (
    set /p n=������stash��� (����0): 
    git stash show stash@(!n!)
) else if "%stash_choice%"=="10" (
    goto main_menu
) else (
    echo %COLOR_ERROR%��Чѡ��%COLOR_RESET%
)
echo.
pause
goto stash_menu

:tag_menu
cls
echo %TITLE_BAR%
echo �U                %COLOR_TITLE%��ǩ����%COLOR_RESET%                 �U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% �鿴���б�ǩ (git tag)
echo   %COLOR_MENU%2.%COLOR_RESET% ����������ǩ (git tag tagname)
echo   %COLOR_MENU%3.%COLOR_RESET% ������ע��ǩ (git tag -a tagname -m "message")
echo   %COLOR_MENU%4.%COLOR_RESET% ɾ����ǩ (git tag -d tagname)
echo   %COLOR_MENU%5.%COLOR_RESET% �鿴��ǩ��Ϣ (git show tagname)
echo   %COLOR_MENU%6.%COLOR_RESET% ���ͱ�ǩ��Զ�� (git push origin tagname)
echo   %COLOR_MENU%7.%COLOR_RESET% �������б�ǩ��Զ�� (git push origin --tags)
echo   %COLOR_MENU%8.%COLOR_RESET% �����ǩ (git checkout -b branchname tagname)
echo   %COLOR_MENU%9.%COLOR_RESET% �������˵�
echo.
set /p tag_choice=��ѡ����� (1-9): 

if "%tag_choice%"=="1" (
    git tag
) else if "%tag_choice%"=="2" (
    set /p tagname=�������ǩ����: 
    git tag !tagname!
    echo %COLOR_SUCCESS%�Ѵ�����ǩ !tagname!%COLOR_RESET%
) else if "%tag_choice%"=="3" (
    set /p tagname=�������ǩ����: 
    set /p message=�������ǩ˵��: 
    git tag -a !tagname! -m "%message%"
    echo %COLOR_SUCCESS%�Ѵ�����ע��ǩ !tagname!%COLOR_RESET%
) else if "%tag_choice%"=="4" (
    set /p tagname=������Ҫɾ���ı�ǩ����: 
    git tag -d !tagname!
) else if "%tag_choice%"=="5" (
    set /p tagname=������Ҫ�鿴�ı�ǩ����: 
    git show !tagname!
) else if "%tag_choice%"=="6" (
    set /p tagname=������Ҫ���͵ı�ǩ����: 
    git push origin !tagname!
) else if "%tag_choice%"=="7" (
    git push origin --tags
    echo %COLOR_SUCCESS%���������б�ǩ��Զ��%COLOR_RESET%
) else if "%tag_choice%"=="8" (
    set /p branchname=�������֧����: 
    set /p tagname=�������ǩ����: 
    git checkout -b !branchname! !tagname!
    echo %COLOR_SUCCESS%�Ѵӱ�ǩ !tagname! ������֧ !branchname!%COLOR_RESET%
) else if "%tag_choice%"=="9" (
    goto main_menu
) else (
    echo %COLOR_ERROR%��Чѡ��%COLOR_RESET%
)
echo.
pause
goto tag_menu

:config_menu
cls
echo %TITLE_BAR%
echo �U               %COLOR_TITLE%���ù���%COLOR_RESET%                �U
echo %FOOTER_BAR%
echo.
echo   %COLOR_MENU%1.%COLOR_RESET% �鿴ȫ������ (git config --global --list)
echo   %COLOR_MENU%2.%COLOR_RESET% �鿴�������� (git config --local --list)
echo   %COLOR_MENU%3.%COLOR_RESET% ����ȫ���û��� (git config --global user.name "name")
echo   %COLOR_MENU%4.%COLOR_RESET% ����ȫ������ (git config --global user.email "email")
echo   %COLOR_MENU%5.%COLOR_RESET% ���ñ༭�� (git config --global core.editor "editor")
echo   %COLOR_MENU%6.%COLOR_RESET% ���úϲ����� (git config --global merge.tool "tool")
echo   %COLOR_MENU%7.%COLOR_RESET% ���ñ��� (git config --global alias.alias-name "git-command")
echo   %COLOR_MENU%8.%COLOR_RESET% �������˵�
echo.
set /p config_choice=��ѡ����� (1-8): 

if "%config_choice%"=="1" (
    git config --global --list
) else if "%config_choice%"=="2" (
    git config --local --list
) else if "%config_choice%"=="3" (
    set /p name=�������û���: 
    git config --global user.name "%name%"
    echo %COLOR_SUCCESS%������ȫ���û���Ϊ %name%%COLOR_RESET%
) else if "%config_choice%"=="4" (
    set /p email=����������: 
    git config --global user.email "%email%"
    echo %COLOR_SUCCESS%������ȫ������Ϊ %email%%COLOR_RESET%
) else if "%config_choice%"=="5" (
    set /p editor=������༭������ (���� notepad, vim): 
    git config --global core.editor "%editor%"
    echo %COLOR_SUCCESS%�����ñ༭��Ϊ %editor%%COLOR_RESET%
) else if "%config_choice%"=="6" (
    set /p tool=������ϲ��������� (���� vimdiff, meld): 
    git config --global merge.tool "%tool%"
    echo %COLOR_SUCCESS%�����úϲ�����Ϊ %tool%%COLOR_RESET%
) else if "%config_choice%"=="7" (
    set /p alias_name=���������: 
    set /p command=�������Ӧ��git����: 
    git config --global alias.!alias_name! "!command!"
    echo %COLOR_SUCCESS%�����ñ��� !alias_name! Ϊ "!command!"%COLOR_RESET%
) else if "%config_choice%"=="8" (
    goto main_menu
) else (
    echo %COLOR_ERROR%��Чѡ��%COLOR_RESET%
)
echo.
pause
goto config_menu

:exit
cls
echo %TITLE_BAR%
echo �U           %COLOR_TITLE%��лʹ�� Git ��������%COLOR_RESET%           �U
echo %FOOTER_BAR%
echo.
exit /b 0
    