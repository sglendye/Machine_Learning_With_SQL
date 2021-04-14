# Formula for a regression is simply a variant of y = mx + b
/*

Formula for a linear regression:
y_prime = (SUM(Y)*SUM(X2) - (SUM(X)*SUM(XY))/(N*SUM(X2)-(SUM(X)^2))+((N*SUM(XY)) - (SUM(X)*SUM(Y))/(N*SUM(X2)-(SUM(X)^2))x

A linear regression is simply the relationship between two variables, as described with a linear relationship.
This means that simply speaking, while the formula is pretty gnarly looking, it's just a function of the formula for a line, y = mx+b
The y_prime function is only slightly complicated because both of the input variables are represented in both the m and b. However, the formula
can still be broken down into five components:

Broken down into five parts:
x = the first input value
y = the second input value
b = (SUM(Y)*SUM(X2) - (SUM(X)*SUM(XY))/(N*SUM(X2)-(SUM(X)^2)) (the y intercept)
m = ((N*SUM(XY)) - (SUM(X)*SUM(Y))/(N*SUM(X2)-(SUM(X)^2)) (the slope)
y_prime = the returned value

*/


WITH aggregates AS (

SELECT    SUM(X) AS X
        , SUM(Y) AS Y
        , SUM(X)*SUM(Y) AS XY
        , SUM(X)*SUM(X) AS XX
        , SUM(Y)*SUM(Y) AS YY
FROM Table
)

line_components AS (
SELECT    (Y*X - (X*XY)/(COUNT(*)*XX-(POWER(X,2))) AS b
        , ((COUNT(*)*XY) - (X*Y)/(COUNT(*)*XX-(POWER(X,2))) AS m
FROM aggregates
)

SELECT x, m*x+b AS y_prime
FROM Table

