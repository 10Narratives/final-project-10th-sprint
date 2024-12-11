#!/bin/bash

# 1. Создаём каталог task с вложенными директориями
mkdir -p task/dir1 task/dir2 task/dir3/dir4

# 2. Изменяем текущую директорию на task
cd task || exit

# 3. Создаём пустой файл task/dir2/empty
touch dir2/empty

# 4. Создаём файл task/dir2/hello.sh с указанным содержанием
cat <<'EOF' >dir2/hello.sh
#!/bin/bash
echo "$1, привет!"
EOF

# 5. Устанавливаем права rwxrw-r-- для task/dir2/hello.sh
chmod 764 dir2/hello.sh

# 6. Сохраняем список файлов task/dir2 в task/dir2/list.txt
ls dir2 >dir2/list.txt

# 7. Копируем содержимое каталога task/dir2 в каталог task/dir3/dir4
cp -r dir2/* dir3/dir4

# 8. Записываем в task/dir1/summary.txt список файлов с расширением *.txt, включая поддиректории
find . -type f -name "*.txt" >dir1/summary.txt

# 9. Дописываем в task/dir1/summary.txt содержимое task/dir2/list.txt
cat dir2/list.txt >>dir1/summary.txt

# 10. Определяем переменную окружения NAME со значением "Всем студентам"
export NAME="Всем студентам"

# 11. Запускаем task/dir2/hello.sh с переменной окружения NAME в качестве аргумента
#     и дописываем вывод в файл task/dir1/summary.txt
./dir2/hello.sh "$NAME" >>dir1/summary.txt

# 12. Перемещаем с переименованием task/dir1/summary.txt в task/Практическое задание
mv dir1/summary.txt "Практическое задание"

# 13. Выводим на консоль содержимое файла task/Практическое задание
cat "Практическое задание"

# 14. Ищем в файле "Практическое задание" строки, содержащие слово "dir", и сортируем их
grep "dir" "Практическое задание" | sort

# 15. Меняем текущую директорию на родительскую для task
cd .. || exit

# 16. Удаляем директорию task со всем содержимым
rm -rf task

echo "Скрипт завершён."
