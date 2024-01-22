-- Math/Numeric Functions

---Name: ABS
---Description: Returns the absolute value of a numeric expression
SELECT ABS(-5) AS AbsoluteValue;

---Name: CEILING
---Description: Returns the smallest integer greater than, or equal to, a numeric expression
SELECT CEILING(5.45) AS CeilingValue;

---Name: FLOOR
---Description: Returns the largest integer less than, or equal to, a numeric expression
SELECT FLOOR(5.45) AS FloorValue;

---Name: ROUND
---Description: Rounds a numeric expression to the specified number of decimal places
SELECT ROUND(5.456, 2) AS RoundedValue;

---Name: SQRT
---Description: Returns the square root of a numeric expression
SELECT SQRT(25) AS SquareRootValue;

---Name: POWER
---Description: Returns the value of a numeric expression raised to the power of another numeric expression
SELECT POWER(2, 3) AS PowerValue;

---Name: RAND
---Description: Returns a random float value between 0 and 1
SELECT RAND() AS RandomValue;

---Name: SIGN
---Description: Returns the sign of a numeric expression (-1, 0, or 1)
SELECT SIGN(-10) AS SignValue;

---Name: EXP
---Description: Returns the exponential value of a numeric expression
SELECT EXP(2) AS ExponentialValue;

---Name: LOG
---Description: Returns the natural logarithm of a numeric expression
SELECT LOG(10) AS LogarithmValue;

---Name: LOG10
---Description: Returns the base 10 logarithm of a numeric expression
SELECT LOG10(100) AS Log10Value;

---Name: PI
---Description: Returns the mathematical constant π (pi)
SELECT PI() AS PiValue;

---Name: SIN
---Description: Returns the sine of an angle, in radians
SELECT SIN(PI()/2) AS SineValue;

---Name: COS
---Description: Returns the cosine of an angle, in radians
SELECT COS(PI()) AS CosineValue;

---Name: TAN
---Description: Returns the tangent of an angle, in radians
SELECT TAN(PI()/4) AS TangentValue;
