# Bootstrap trello-clone

## Контроллер главной страницы
```bash
rails g controller home index
```
Добавить в `config/routes.rb`

```rb
root "home#index"
```

## Юзеры

По документации [devise](https://github.com/heartcombo/devise)

Добавить в Gemfile
```bash
gem 'devise'
```

Установить зависимости
```bash
bundle install
```

Сгенерировать установку конфигураций для devise
```bash
rails generate devise:install
```

Отредактировать файл `config/environments/development.rb`, добавить строчку:
```bash
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

Сгенерировать модель User через генератор гема devise
```bash
rails generate devise User
```

Произвести миграцию
```bash
rails db:migrate
```

Добавить в `config/routes.rb`

```rb
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
```

`get '/users/sign_out' => 'devise/sessions#destroy'` - это нужно для кнопки "Выход".

Пример кнопки:

```rb
<%= link_to 'Выход', destroy_user_session_path, method: :delete, class: 'btn btn-outline-dark' %>
```

Генерация view для редактирования страниц регистрации/логина

```bash
rails generate devise:views
```

## Плагин для управления порядком списков и карточек

Ссылка на gem - [acts_as_list](https://github.com/brendon/acts_as_list)

Добавить в Gemfile
```bash
gem 'acts_as_list'
```

Установить зависимости
```bash
bundle install
```

## Доски
Генерируем модель `Board`
```bash
rails generate model Board name:string
```
Произвести миграцию
```bash
rails db:migrate
```

## Списки
Генерируем модель `List`
```bash
rails generate model List board:references name:string position:integer
```
Произвести миграцию
```bash
rails db:migrate
```

## Карточки
Генерируем модель `Card`
```bash
rails generate model Card list:references name:string content:text position:integer
```
Произвести миграцию
```bash
rails db:migrate
```
