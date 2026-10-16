SELECT description FROM crime_scene_reports WHERE year = 2025 AND month = 7 AND day = 28 AND street = 'Humphrey Street';
SELECT name, transcript FROM interviews WHERE year = 2025 AND month = 7 AND day = 28;

SELECT p.name, p.license_plate FROM people AS p JOIN bakery_security_logs AS b ON p.license_plate = b.license_plate
     WHERE b.year = 2025 AND b.month = 7 AND b.day = 28 AND b.hour = 10 AND b.minute BETWEEN 15 AND 25 AND b.activity = 'exit';

--- 3
SELECT p.name, a.amount FROM people AS p JOIN bank_accounts AS ba ON p.id = ba.person_id JOIN atm_transactions 
    AS a ON ba.account_number = a.account_number WHERE a.year = 2025 AND a.month = 7 AND a.day = 28 AND a.atm_location = 'Leggett Street' AND a.transaction_type = 'withdraw';

--- 4
SELECT p.name FROM phone_calls AS c JOIN people AS p ON c.receiver = p.phone_number WHERE c.caller = (SELECT phone_number FROM people WHERE name = 'Bruce') 
    AND c.year = 2025 AND c.month = 7 AND c.day = 28 AND c.duration < 60;

--- 5
SELECT f.id, f.hour, f.minute, a.city FROM flights AS f JOIN airports AS a ON f.destination_airport_id = a.id 
    WHERE f.year = 2025 AND f.month = 7 AND f.day = 29 ORDER BY f.hour, f.minute LIMIT 1;

SELECT p.name FROM passengers AS ps JOIN people AS p ON ps.passport_number = p.passport_number WHERE ps.flight_id = 36;


-- Украден талисман CS50! Ваша задача — раскрыть преступление, складывая улики из разных источников данных.
-- 📅 Дата кражи: 28 июля 2025 года
-- 📍 Место: Humphrey Street
-- 🎯 Найти: вора · город, куда он сбежал · сообщника

-- Источники улик (анализировать последовательно):
-- 1
-- Crime Scene Reports
-- — первичные улики с места преступления
-- 2
-- Interviews
-- — показания свидетелей
-- 3
-- ATM Transactions
-- — снятие наличных перед побегом
-- 4
-- Phone Calls
-- — звонки сообщнику
-- 5
-- Flights
-- — маршрут отхода преступника