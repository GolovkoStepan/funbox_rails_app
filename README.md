## Реализуйте web-приложение (Rails проект), которое удовлетворяет нижеизложенным требованиям.
1) Приложение содержит две страницы: / и /admin
2) На странице / отображается текущий курс доллара к рублю, известный
приложению.
3) Приложение фоновым скриптом периодически обновляет курс из любого
выбранного вами доступного источника (сайт CBR, главная страница
http://www.rbc.ru, и т.д.).
4) При обновлении курса в приложении он обновляется на всех открытых в
текущий момент страницах /.
5) На странице /admin находится форма, содержащая поле для ввода числа,
поле для ввода даты-времени и сабмит.
6) При сабмите введенное число делается форсированным курсом до введённого
времени, т.е. до этого времени реальный курс игнорируется, вместо него
страницах / отображается форсированный курс. 
7) Страница /admin «помнит» введенные предыдущий раз значения, они
отображаются уже введенными при загрузке страницы.
8) При сабмите форсированного курса он, конечно же, cразу обновляется на всех
открытых страницах /. При истечении времени действия форсированного
курса на всех страницах начинает отображаться реальный курс.
9) Форма содержит разумные валидации.
10) Внешний вид приложения должен быть аккуратным в рамках разумного
(например, использовать Twitter Bootstrap).
11) Плюсом будет использование какого-либо JS-фреймворка на клиентской
стороне.
12) Web-приложение должно корректно работать в браузерах Firefox и Chrome
последних версий.
13) Код должен быть покрыт тестами.
14) Все необходимое для локального запуска приложения должно быть
оформлено в виде Procfile-а для Foreman.

Запуск:

1) foreman start -f Procfile.dev
2) rake worker:update_rate