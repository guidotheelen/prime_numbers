import 'package:flutter_test/flutter_test.dart';

import 'package:prime_numbers/prime_numbers.dart';

void main() {
  final prime = PrimeNumbers();

  test('returns true if the number is prime', () {
    expect(1.isPrime, false);
    expect(2.isPrime, true);
    expect(3.isPrime, true);
    expect(4.isPrime, false);
    expect(5.isPrime, true);
    expect(6.isPrime, false);
    expect(7.isPrime, true);
    expect(8.isPrime, false);
    expect(9.isPrime, false);
    expect(10.isPrime, false);
  });

  test('returns the next prime number', () {
    expect(1.nextPrime(), 2);
    expect(2.nextPrime(), 3);
    expect(3.nextPrime(), 5);
    expect(4.nextPrime(), 5);
    expect(5.nextPrime(), 7);
    expect(6.nextPrime(), 7);
    expect(7.nextPrime(), 11);
    expect(8.nextPrime(), 11);
    expect(9.nextPrime(), 11);
    expect(10.nextPrime(), 11);
  });

  test('returns the previous prime number', () {
    expect(1.previousPrime(), null);
    expect(2.previousPrime(), null);
    expect(3.previousPrime(), 2);
    expect(4.previousPrime(), 3);
    expect(5.previousPrime(), 3);
    expect(6.previousPrime(), 5);
    expect(7.previousPrime(), 5);
    expect(8.previousPrime(), 7);
    expect(9.previousPrime(), 7);
    expect(10.previousPrime(), 7);
  });

  group('Generator', () {
    test('returns n prime numbers', () {
      final primes = prime.generate(10);
      expect(primes, [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]);
    });

    test('returns n prime numbers from start', () {
      final primes = prime.generate(10, start: 20);
      expect(primes, [23, 29, 31, 37, 41, 43, 47, 53, 59, 61]);
    });

    test('returns prime numbers between min and max', () {
      final primes = prime.between(20, 40);
      expect(primes, [23, 29, 31, 37]);
    });
  });

  group('Prime factors', () {
    test('returns list of prime factors', () {
      expect(12.factors(), [2, 2, 3]);
    });

    test('returns list of prime factors of prime', () {
      expect(13.factors(), [13]);
    });

    test('returns list of prime factors of 0', () {
      expect(0.factors(), []);
    });

    test('returns list of prime factors of negative number', () {
      expect((-10).factors(), [2, 5]);
    });

    test('returns list when finding more than one factor', () {
      expect((12).factors(returnFast: true), [2, 2]);
    });

    test('returns factor when finding only one factor', () {
      expect((7).factors(returnFast: true), [7]);
    });

    test('returns the amount of factors', () {
      expect(12.factorCount(), 3);
    });
  });

  group('Prime gaps', () {
    test('returns primes with prime-gap of 2 between min and max', () {
      final gaps = prime.gapsBetween(2, 1, 20);
      expect(gaps, [
        [3, 5],
        [5, 7],
        [11, 13],
        [17, 19],
      ]);
    });

    test('returns primes with prime-gap of 4 between min and max', () {
      final gaps = prime.gapsBetween(4, 1, 25);
      expect(gaps, [
        [7, 11],
        [13, 17],
        [19, 23],
      ]);
    });
  });

  group('K-primes', () {
    test('returns k-primes of 2 between min and max', () {
      final kPrimes = prime.kPrimesBetween(2, 1, 20);
      expect(kPrimes, [4, 6, 9, 10, 14, 15]);
    });

    test('returns k-primes of 3 between min and max', () {
      final kPrimes = prime.kPrimesBetween(3, 1, 20);
      expect(kPrimes, [8, 12, 18, 20]);
    });
  });
}
