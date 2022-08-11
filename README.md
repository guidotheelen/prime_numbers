# PrimeNumbers [![Build Status](https://app.travis-ci.com/guidotheelen/avatar_generator.svg?branch=master)](https://app.travis-ci.com/github/guidotheelen/avatar_generator) [![Coverage Status](https://coveralls.io/repos/github/guidotheelen/avatar_generator/badge.svg?branch=master)](https://coveralls.io/github/guidotheelen/avatar_generator?branch=master)

For all those number geeks out there. Prime numbers are still a hot topic within
mathematics. This package is to help anyone on their prime number adventures and
provide tools to ease your work.

## Features

* Find the next prime number
* Find the previous prime number if exists
* Find numbers between a min and max value
* Find prime numbers with given prime-gap between min and max value
* Find list of K-primes between min and max value
* Generate a list of n prime numbers from a given start position

## Usage

```dart
final pn = PrimeNumbers();

pn.generate(10); // [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

11.isPrime; // true
10.isPrime; // false

11.nextPrime(); // 13
10.nextPrime(); // 11

11.perviousPrime(); // 7
10.perviousPrime(); // 7
```

## Additional information

For issues or feature requests please file an issue on the Github page.
