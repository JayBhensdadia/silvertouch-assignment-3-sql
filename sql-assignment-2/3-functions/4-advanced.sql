-- Advanced Functions

---Name: CAST
---Description: Converts a value (of any type) into a specified datatype
SELECT CAST('120' AS INT) AS CastedNumber;

---Name: COALESCE
---Description: Returns the first non-null value in a list
SELECT COALESCE(NULL, NULL, NULL, 'jay',NULL,'vijay') AS NonNullValue;

---Name: IIF
---Description: Returns a value if a condition is TRUE, or another value if a condition is FALSE
SELECT IIF(5 > 3, 'TrueValue', 'FalseValue') AS ConditionResult;

---Name: ISNULL
---Description: Returns a specified value if the expression is NULL, otherwise returns the expression
SELECT ISNULL(NULL, 'Default') AS NonNullValue;

---Name: NULLIF
---Description: Returns NULL if two expressions are equal
SELECT NULLIF('Value', 'Value') AS NullIfEqual;

---Name: CONVERT
---Description: Converts a value (of any type) into a specified datatype
SELECT CONVERT(int, 25.65) as ConvertedNumber;