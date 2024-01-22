-- Date Functions

---Name: GETDATE
---Description: Returns the current date and time
SELECT GETDATE() AS CurrentDateTime;

---Name: SYSDATETIME
---Description: Returns the current date and time with higher precision
SELECT SYSDATETIME() AS CurrentDateTimeWithPrecision;

---Name: YEAR
---Description: Returns the year part of a date
SELECT YEAR(GETDATE()) AS CurrentYear;

---Name: MONTH
---Description: Returns the month part of a date
SELECT MONTH(GETDATE()) AS CurrentMonth;

---Name: DAY
---Description: Returns the day part of a date
SELECT DAY(GETDATE()) AS CurrentDay;

---Name: DATEPART
---Description: Returns a specific part of a date
SELECT DATEPART(YEAR, GETDATE()) AS CurrentYearUsingDatePart;

---Name: DATEADD
---Description: Adds a specified time interval to a date
SELECT DATEADD(MONTH, 3, GETDATE()) AS DateAfterAdding3Months;

---Name: DATEDIFF
---Description: Returns the difference between two dates
SELECT DATEDIFF(DAY, '2022-01-01', '2022-02-01') AS DaysDifference;

---Name: GETUTCDATE
---Description: Returns the current UTC date and time
SELECT GETUTCDATE() AS CurrentUTCDateTime;

---Name: EOMONTH
---Description: Returns the last day of the month for a given date
SELECT EOMONTH(GETDATE()) AS LastDayOfMonth;

---Name: FORMAT
---Description: Formats a date value with the specified format
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd') AS FormattedDate;
