# Author: Nicholas Syring nsyring2@uic.edu
# Purpose: Demonstrate how to call a C++
#          function containing loops in R. 
#          The example used here is an
#          iterative method for finding the 
#          nth element of the Fibonacci
#          sequence.  


# Install Rcpp package
install.packages("Rcpp")

# Use the Rcpp library with the sourceCpp 
# function to call the C++ function "fibonacci"
# located in "fibonacci.cpp" text file
# Be sure to edit the path in sourceCpp
library(Rcpp)
sourceCpp("fibonacci.cpp")
fibonacci(7)

# Alternatively, define an inline C++ function 
# "fibonacci" using cppFunction and call it 
cppFunction('int fibonacci(const int n) { 
double first = 0;
double second = 1;
double third = 0;
for (int i=0; i<n; i++) {
third = first + second;
first = second;
second = third;
}
return third;
}')
fibonacci(7)
