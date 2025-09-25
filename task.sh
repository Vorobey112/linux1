#!/bin/bash

# создаём каталог task с вложенными директориями
# task
#   dir1
#   dir2
#   dir3
#   dir4

mkdir -p task/dir1 task/dir2 task/dir3 task/dir4


# изменяем текущую директорию на task
cd task

# создаём пустой файл task/dir2/empty
touch task/dir2/empty

# создаём файл task/dir2/hello.sh с таким содержанием:
# #!/bin/bash
# echo "$1, привет!"
echo '#!/bin/bash' > dir2/hello.sh
echo 'echo "$1, привет!"' >> dir2/hello.sh

# устанавливаем для task/dir2/hello.sh права rwxrw-r--
chmod 764 task/dir2/hello.sh

# сохраняем список файлов task/dir2 в task/dir2/list.txt
ls task/dir2 > task/dir2/list.txt

# копируем содержимое каталога task/dir2 в каталог task/dir3/dir4
cp -r dir2* task/dir3/dir4/

# записываем в task/dir1/summary.txt список файлов с расширением *.txt
# находящихся в task, включая поддиректории
find task -type f -name "*.txt" > task/dir1/summary.txt

# дописываем в task/dir1/summary.txt содержимое task/dir2/list.txt
cat task/dir2/list.txt >> task/dir1/summary.txt

# определяем переменную окружения NAME со значением "Всем студентам"
export NAME="Всем студентам"

# запускаем task/dir2/hello.sh с переменной окружения NAME в качестве аргумента
# вывод скрипта должен дописаться в файл task/dir1/summary.txt
task/dir2/hello.sh "$NAME" >> task/dir1/summary.txt

# перемещаем с переименованием task/dir1/summary.txt в task/Практическое задание
mkdir -p "task/Практическое задание"
mv task/dir1/summary.txt "task/Практическое задание/summary.txt"


# выводим на консоль содержимое файла task/Практическое задание
cat "task/Практическое задание/summary.txt"

# ищем в файле "Практическое задание" строки, которые содержат слово "dir"
# и затем отсортировываем их
grep "dir" "task/Практическое задание/summary.txt" | sort

# меняем текущую директорию на родительскую для task
cd ..

# удаляем директорию task со всем содержимым
rm -rf task
