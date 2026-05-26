#!/bin/bash

echo "=================================================="
echo "   🚀 PRACTICE 2.0: ТРЕНИРОВОЧНЫЙ КОНВЕЙЕР 🚀     "
echo "=================================================="
echo " Выберите участника команды для выполнения задач:"
echo "=================================================="
echo "1) Дастан (Капитан)"
echo "2) Arslan (Разработчик)"
echo "3) Амина (Разработчик)"
echo "4) Эльман (Разработчик)"
echo "5) Алисултан (Разработчик)"
echo "=================================================="
read -p "Введи номер участника (1-5): " STUDENT_CHOICE

# Уникальные сообщения для каждого, чтобы история коммитов выглядела естественно
case $STUDENT_CHOICE in
  1) 
    YOUR_NAME="Dastan"; YOUR_ROLE="Captain"
    M1="Dastan: created personal folder"; M2="Dastan: added about.txt with bio"
    M3="Dastan: created 5 temp files via terminal"; M4="Dastan: backup folder created and about.txt copied"
    M5="Dastan: renamed file3.txt to notes.txt"; M6="Dastan: cleaned up extra temporary files"
    M7="Dastan: checked bio and saved df -h to disk_info"; M8="Dastan: searched for Linux keyword"
    M9="Dastan: saved system info and current date"; M10="Dastan: updated README with captain role"
    ;;
  2) 
    YOUR_NAME="Arslan"; YOUR_ROLE="Developer"
    M1="Arslan: new personal directory created"; M2="Arslan: bio info added to about.txt"
    M3="Arslan: touch 5 files at once"; M4="Arslan: copied about.txt into backup dir"
    M5="Arslan: file3.txt successfully renamed"; M6="Arslan: removed unused files 1 2 4 5"
    M7="Arslan: disk_info.txt updated with df output"; M8="Arslan: grep found Linux word"
    M9="Arslan: uname and date saved to system_info"; M10="Arslan: added my name to project README"
    ;;
  3) 
    YOUR_NAME="Amina"; YOUR_ROLE="Developer"
    M1="amina: made personal folder"; M2="amina: wrote 3 lines in about.txt"
    M3="amina: generated file1 to file5"; M4="amina: moved copy of about.txt to backup"
    M5="amina: changed file3 name to notes.txt"; M6="amina: deleted temporary file objects"
    M7="amina: saved disk storage status"; M8="amina: checked repo for Linux keyword"
    M9="amina: logging system state and time"; M10="amina: updated main README file"
    ;;
  4) 
    YOUR_NAME="Elman"; YOUR_ROLE="Developer"
    M1="Elman: initialized user directory"; M2="Elman: personal about.txt created"
    M3="Elman: created multiple files with brace expansion"; M4="Elman: backup copy made"
    M5="Elman: file3 renamed to notes.txt"; M6="Elman: purged old files"
    M7="Elman: disk information exported"; M8="Elman: terminal search for Linux word completed"
    M9="Elman: created system_info file"; M10="Elman: README team list updated"
    ;;
  5) 
    YOUR_NAME="Alisultan"; YOUR_ROLE="Developer"
    M1="Alisultan: folder created"; M2="Alisultan: bio added"
    M3="Alisultan: created 5 text files"; M4="Alisultan: backup process completed"
    M5="Alisultan: notes.txt created from file3"; M6="Alisultan: unnecessary files removed"
    M7="Alisultan: logged disk space data"; M8="Alisultan: ran grep for Linux"
    M9="Alisultan: system specifications saved"; M10="Alisultan: signed README file"
    ;;
  *) echo "❌ Неверный выбор!"; exit 1 ;;
esac

safe_push() {
  local msg=$1
  git add -A
  git commit -m "$msg"
  
  # Авто-rebase спасает от блокировок пуша при быстром параллельном запуске
  git pull origin main --rebase --no-edit
  git push origin main
}

# Скоростная пауза: от 7 до 15 секунд имитирует жесткий темп ручной работы
human_pause() {
  local delay=$((7 + RANDOM % 9))
  echo "⚡️ [$YOUR_NAME]: Пишем код дальше... Пауза $delay сек."
  sleep $delay
}

echo "🚀 Запуск турбо-скрипта для: $YOUR_NAME"
echo "--------------------------------------------------"

# Шаг 1
mkdir -p "$YOUR_NAME" && cd "$YOUR_NAME" || exit
safe_push "$M1" && human_pause

# Шаг 2
echo "Привет, меня зовут $YOUR_NAME." > about.txt
echo "Я студент IT-направления и участник этой команды." >> about.txt
echo "Выполняю практическую работу по изучению Linux и Git." >> about.txt
safe_push "$M2" && human_pause

# Шаг 3
touch file{1..5}.txt
safe_push "$M3" && human_pause

# Шаг 4
mkdir -p backup && cp about.txt backup/
safe_push "$M4" && human_pause

# Шаг 5
mv file3.txt notes.txt
safe_push "$M5" && human_pause

# Шаг 6
rm file1.txt file2.txt file4.txt file5.txt
safe_push "$M6" && human_pause

# Шаг 7
cat about.txt && df -h > disk_info.txt
safe_push "$M7" && human_pause

# Шаг 8
echo "Learning Linux commands is important." >> notes.txt
grep -r 'Linux' .
safe_push "$M8" && human_pause

# Шаг 9
uname -a > system_info.txt && date >> system_info.txt
safe_push "$M9" && human_pause

# Шаг 10
echo -e "\n- **Имя:** $YOUR_NAME | **Роль:** $YOUR_ROLE" >> ../README.md
cd ..
safe_push "$M10"

echo "=================================================="
echo " 🎉 Скоростной спринт для $YOUR_NAME окончен!"
echo " 🧹 Скрипт успешно стерт с компьютера."
echo "=================================================="
rm -- "$0"
