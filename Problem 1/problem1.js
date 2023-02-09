// Method 1: Using mathematical formula
var sum_to_n_a = function (n) {
  return n * (n + 1) / 2;
};

// Method 2: Using iteration
var sum_to_n_b = function (n) {
  sum = 0;
  for (let currentNumber = 1; currentNumber <= n; currentNumber++) {
    sum += currentNumber;
  }
  return sum;
};

// Method 3: Using recursion
var sum_to_n_c = function (n) {
  if (n == 1) {
    return 1;
  }
  return n + sum_to_n_c(n - 1);
};