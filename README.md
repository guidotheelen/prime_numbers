# PrimeNumbers

For all those number geeks out there. Prime numbers are still one of the most
mysterious topics in math. This package is to help anyone on their prime number
adventures and provide tools to ease your work.

## Features

* Find the next prime number
* Find the previous prime number if exists
* Find numbers between a min and max value
* Find prime numbers with given prime-gap between min and max value
* Find list of K-primes between min and max value
* Find the prime factors of an int
* Find the factor count of an int
* Generate a list of n prime numbers from a given start position

## Usage

```dart
final pn = PrimeNumbers();

pn.generate(10); // [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

11.isPrime; // true
10.isPrime; // false

11.nextPrime(); // 13
10.nextPrime(); // 11

11.previousPrime(); // 7
10.previousPrime(); // 7
```

## Additional information

For issues or feature requests please file an issue on the Github page.
