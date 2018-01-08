# language: ru

Функционал: Установка версии в файл версий (команды set-version)
    Как Пользователь
    Я хочу выполнять автоматическую установку последней синхронизированной версии с хранилищем 1С
    Чтобы автоматизировать свою работы с хранилищем с git

Контекст: Тестовый контекст
    Когда Я очищаю параметры команды "gitsync" в контексте
    И Я устанавливаю рабочей каталог во временный каталог
    И Я создаю новый объект ГитРепозиторий
    И Я устанавливаю путь выполнения команды "gitsync" к текущей библиотеке
    И Я создаю временный каталог и сохраняю его в контекст
    И Я сохраняю значение временного каталога в переменной "ПутьКаталогаИсходников"
    И Я создаю тестовой файл AUTHORS 
    И Я записываю "0" в файл VERSION
    И Я выключаю все плагины
    
Сценарий: Установка версии без коммита
    Допустим Я добавляю параметр "-v" для команды "gitsync"
    И Я добавляю параметр "set-version" для команды "gitsync"
    И Я добавляю параметр "1" для команды "gitsync"
    И Я добавляю позиционный параметр для команды "gitsync" из переменной "ПутьКаталогаИсходников"
    Когда Я выполняю команду "gitsync"
    Тогда Вывод команды "gitsync" содержит "ИНФОРМАЦИЯ - Версия установлена"
    И Вывод команды "gitsync" не содержит "Внешнее исключение"
    И Код возврата команды "gitsync" равен 0

Сценарий: Установка версии с коммитом
    Допустим Я добавляю параметр "-v" для команды "gitsync"
    И Я добавляю параметр "set-version" для команды "gitsync"
    И Я добавляю параметр "-c" для команды "gitsync"
    И Я добавляю параметр "1" для команды "gitsync"
    И Я добавляю позиционный параметр для команды "gitsync" из переменной "ПутьКаталогаИсходников"
    Когда Я выполняю команду "gitsync"
    Тогда Вывод команды "gitsync" содержит "ИНФОРМАЦИЯ - Версия установлена"
    И Вывод команды "gitsync" не содержит "Внешнее исключение"
    И Код возврата команды "gitsync" равен 0

Сценарий: Установка версии с использованием переменных окружения
    Допустим Я добавляю параметр "-v" для команды "gitsync"
    И Я добавляю параметр "set-version" для команды "gitsync"
    И Я добавляю параметр "1" для команды "gitsync"
    И Я устанавливаю переменную окружения "GITSYNC_WORKDIR" из переменной "ПутьКаталогаИсходников"
    И Я добавляю позиционный параметр для команды "gitsync" из переменной "ПутьКаталогаИсходников"
    Когда Я выполняю команду "gitsync"
    Тогда Вывод команды "gitsync" содержит "ИНФОРМАЦИЯ - Версия установлена"
    И Вывод команды "gitsync" не содержит "Внешнее исключение"
    И Код возврата команды "gitsync" равен 0
    И Я очищаю значение переменных окружения 
    |GITSYNC_WORKDIR|