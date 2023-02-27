## Instachat
Простое приложение для создания чат-комнат. Общение в режиме реального времени достигается за счет использования 
```ActionCable``` и ```Redis```

Рабочее приложение ```Instachat``` находится по адресу: https://chat.goodprogramming.ru/

Версии Ruby и Rails:
```
ruby >= 2.5.1
rails ~> 5.2.3
```

### Запуск и использование
Установите ```Bundler```:
```
gem install bundler
```
Сделайте клон репозитория:
```
git clone https://github.com/lordsynergy/Instachat
```
Находясь в папке проекта установите зависимости:
```
bundle install
```
Выполните миграции базы данных:
```
bundle exec rails db:migrate
```
Запустите сервер приложения:
```
bundle exec rails s
```
В браузере откройте:
```
http://localhost:3000
```
