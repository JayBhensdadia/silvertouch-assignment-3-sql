--String Functions

---Name: ASCII
---Description: Returns the ASCII value for the specific character
SELECT ASCII('J') AS ASCIIValue;

---Name: CHAR
---Description: Returns a character based on the number code
SELECT CHAR(97) AS CharValueOf97;

---Name: CHARINDEX
---Description: Returns the position of a substring in a string
SELECT CHARINDEX('h', 'jay bhensdadia') AS CharAtIndex;

---Name: CONCAT
---Description: Adds two or more strings together
SELECT CONCAT('Jay', ' Bhensdadia') AS ConcatenatedString;

---Name: FORMAT
---Description: Formats a value with the specified format
SELECT FORMAT(123456789, '##-##-#####') AS FormattedNumber;

---Name: LEN
---Description: Returns the length of a string
SELECT LEN('Jay Bhensdadia') AS StringLength;

---Name: LOWER
---Description: Converts a string to lowercase
SELECT LOWER('JAY BHENSDADIA') AS LowerCased;

---Name: UPPER
---Description: Converts a string to uppercase
SELECT UPPER('jay bhensdadia') AS UpperCased;

---Name: LEFT
---Description: Returns the left part of a string with the specified number of characters
SELECT LEFT('Jay Bhensdadia', 3) AS LeftPart;

---Name: RIGHT
---Description: Returns the right part of a string with the specified number of characters
SELECT RIGHT('Jay Bhensdadia', 3) AS RightPart;

---Name: REPLACE
---Description: Replaces occurrences of a specified string with another string
SELECT REPLACE('Jay Bhensdadia', 'Jay','Vijay') AS ReplacedString;

---Name: REPLICATE
---Description: Repeats a string a specified number of times
SELECT REPLICATE('Jay',3) AS RepeatedString;

---Name: SUBSTRING
---Description: Returns a part of a string starting at a specified position
---				Extracts 5 characters starting from position 6
SELECT SUBSTRING('Jay Bhensdadia', 5, 6) AS SubstringResult;

---Name: TRIM
---Description: Removes leading and trailing spaces from a string
SELECT TRIM('   Jay Bhensdadia   ') AS TrimmedString;

---Name: LTRIM
---Description: Removes leading spaces from a string
SELECT LTRIM('   Jay Bhensdadia   ') AS LeftTrimmedString;
