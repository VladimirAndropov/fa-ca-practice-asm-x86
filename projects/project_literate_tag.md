# Грамотный ценник

---

Проект свободен: нет

Участники: Александр Виноградов, Алексей Косенко, Роман Гостило

Предложен студентами: да

Ссылка на репозиторий: https://github.com/vvvkkkggg/literate-tag

---

## Мотивация и цель

Частенько случается, что берешь в магазине печеньки по одной цене, а на кассе узнается, что стоимость иная, к сожалению, в большинстве случаев не в сторону покупателя. 

Умный или грамотный ценник не является человеком, поэтому у него нет проблем быстро изменить цену и сразу уведомить об этом покупателей. В итоге все в плюсе: магазину не придется следовать закону и продавать товар по заниженной цене, а покупатель берет товар по актуальным ценам (*на кассе не нужно будет ждать, пока Люда отменить позицию в чеке*).

У нас есть жгучее желание решить эту проблему, а также поработать с Arduino (мониторчиком, wi-fi модулем) и написать клиент-серверное приложение на C/C++.

## Техническое задание

При первом включении бэкенд распределит ценники на мониторы случайным образом. После, все экраны будут уже пронумерованы и пользователь сможет изменять данные на конкретном экране в клиентском приложении. 

В клиентском приложении пользователю доступен удобный импорт товаров в систему (*например, из .csv файла*) для слияния и добавления с текущими позициями, или же полной замены всех наименований. Также доступна возможность редактирования единичных товаров: изменения цены, наименования.

По нажатию в клиентском приложении на кнопку все ценники установятся на выбранные экранчики. Все сигналы, которые отправит сервер, примет wi-fi модуль, а данные отобразятся на экране.

Подразумевается модульная система монтажа ценников, то есть быстрое добавление нового экрана, а также его демонтаж.

## Зависимости и технологии

- **Платформа Arduino** - OLED I2C, ESP8266.
- **Boost.Asio** - сервер.
- **QT Framework** - клиентское приложение.
- **QTcpSocket** - для сетевой передачи.
- **MySQL**

