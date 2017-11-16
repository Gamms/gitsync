# language: ru

Функционал: Инициализация каталога исходников конфигурации
    Как Пользователь
    Я хочу выполнять автоматическую синхронизацию конфигурации из хранилища
    Чтобы автоматизировать свою работы с хранилищем с git

Контекст: Тестовый контекст
    Когда Я очищаю параметры команды "gitsync" в контексте
    И Я устанавливаю путь выполнения команды "gitsync" к текущей библиотеке
    И Я добавляю параметр "sync" для команды "gitsync"
    И Я создаю временный каталог и сохраняю его в контекст
    И я скопировал каталог тестового хранилища конфигурации во временный каталог
    И Я сохраняю значение временного каталога в переменной "КаталогХранилища1С"
    И Я создаю временный каталог и сохраняю его в контекст
    И Я сохраняю значение временного каталога в переменной "ПутьКаталогаИсходников"
    И Я создаю тестовой файл AUTHORS 
    И Я записываю "0" в файл VERSION
    И Я создаю временный каталог и сохраняю его в контекст
    И Я инициализирую bare репозиторий во временном каталоге
    И Я сохраняю значение временного каталога в переменной "URLРепозитория"
    И я инициализирую связь "ПутьКаталогаИсходников" с внешним репозиторием "URLРепозитория"
    И я включаю отладку лога с именем "oscript.app.gitsync"
    И Я добавляю позиционный параметр для команды "gitsync" из переменной "КаталогХранилища1С"
    И Я добавляю позиционный параметр для команды "gitsync" из переменной "URLРепозитория"
    И Я добавляю позиционный параметр для команды "gitsync" из переменной "ПутьКаталогаИсходников"
    
Сценарий: Простая синхронизация хранилища с git-репозиторием
    Допустим Я создаю временный каталог и сохраняю его в контекст
    И Я сохраняю значение временного каталога в переменной "ВременнаяДиректория"
    И Я добавляю параметр "-tempdir" для команды "gitsync" из переменной "ВременнаяДиректория"
    Когда Я выполняю команду "gitsync"
    Тогда Вывод команды "gitsync" содержит "ИНФОРМАЦИЯ - Синхронизация завершена"
    И Вывод команды "gitsync" не содержит "Внешнее исключение"
    И Код возврата команды "gitsync" равен 0

Сценарий: Синхронизация хранилища с git-репозиторием без tool1CD
    Допустим Я добавляю параметр "-dontUseTool1cd" для команды "gitsync"
    И Я создаю временный каталог и сохраняю его в контекст
    И Я добавляю параметр "-userRep" для команды "gitsync" со значением "Администратор"
    Когда Я выполняю команду "gitsync"
    Тогда Вывод команды "gitsync" содержит "ИНФОРМАЦИЯ - Синхронизация завершена"
    И Вывод команды "gitsync" не содержит "Внешнее исключение"
    И Код возврата команды "gitsync" равен 0

Сценарий: Синхронизация хранилища с git-репозиторием с дополнительными параметрами без tool1CD
    Допустим Я добавляю параметр "-dontUseTool1cd" для команды "gitsync"
    И Я создаю временный каталог и сохраняю его в контекст
    И Я сохраняю значение временного каталога в переменной "ВременнаяДиректория"
    И Я добавляю параметр "-tempdir" для команды "gitsync" из переменной "ВременнаяДиректория"
    И Я добавляю параметр "-userRep" для команды "gitsync" со значением "Администратор"
    И Я добавляю параметр "-push-every-n-commits" для команды "gitsync" со значением "5"
    И Я добавляю параметр "-dontUseTool1cd" для команды "gitsync"
    И Я добавляю параметр "-process-fatform-modules" для команды "gitsync"
    И Я добавляю параметр "-check-authors" для команды "gitsync"
    И Я добавляю параметр "-auto-set-tags" для команды "gitsync"
    Когда Я выполняю команду "gitsync"
    Тогда Вывод команды "gitsync" содержит "ИНФОРМАЦИЯ - Синхронизация завершена"
    И Вывод команды "gitsync" не содержит "Внешнее исключение"
    И Код возврата команды "gitsync" равен 0

Сценарий: Синхронизация хранилища с git-репозиторием с выгрузкой только изменений
    Допустим Я создаю временный каталог и сохраняю его в контекст
    И Я сохраняю значение временного каталога в переменной "ВременнаяДиректория"
    И Я добавляю параметр "-increment" для команды "gitsync"
    Когда Я выполняю команду "gitsync"
    Тогда Вывод команды "gitsync" содержит "ИНФОРМАЦИЯ - Синхронизация завершена"
    И Вывод команды "gitsync" не содержит "Внешнее исключение"
    И Код возврата команды "gitsync" равен 0

Сценарий: Синхронизация хранилища с git-репозиторием с выгрузкой только изменений без tool1CD
    Допустим Я добавляю параметр "-increment" для команды "gitsync"
    И Я добавляю параметр "-dontUseTool1cd" для команды "gitsync"
    И Я добавляю параметр "-userRep" для команды "gitsync" со значением "Администратор"
    Когда Я выполняю команду "gitsync"
    Тогда Вывод команды "gitsync" содержит "ИНФОРМАЦИЯ - Синхронизация завершена"
    И Вывод команды "gitsync" не содержит "Внешнее исключение"
    И Код возврата команды "gitsync" равен 0


Сценарий: Синхронизация хранилища с git-репозиторием с проверкой заполненности комментария
    Допустим Я добавляю параметр "-stop-if-empty-comment" для команды "gitsync"
    Когда Я выполняю команду "gitsync"
    Тогда Вывод команды "gitsync" содержит "КРИТИЧНАЯОШИБКА - Нашли следующую версию <4> от автора <Администратор>, а комментарий не задан!"
    И Код возврата команды "gitsync" равен 1

Сценарий: Синхронизация хранилища с git-репозиторием с проверкой авторов версий в хранилище
    Допустим Я добавляю параметр "-check-authors" для команды "gitsync"
    И Я создаю неполный тестовой файл AUTHORS 
    И Я инициализирую связь "ПутьКаталогаИсходников" с внешним репозиторием "URLРепозитория"
    Когда Я выполняю команду "gitsync"
    Тогда Вывод команды "gitsync" содержит "КРИТИЧНАЯОШИБКА - Пользователю хранилища <Администратор> не сопоставлен пользователь git."
    И Код возврата команды "gitsync" равен 1
