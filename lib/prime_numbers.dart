library prime_numbers;

import 'dart:math';

/// Prime number helpers.
class PrimeNumbers {
  /// Generates n prime numbers from [start].
  List<int> generate(int n, {int start = 2}) {
    final primes = <int>[];
    var candidate = start;
    while (primes.length < n) {
      if (candidate.isPrime) primes.add(candidate);
      candidate++;
    }
    return primes;
  }

  /// Prime numbers between [min] and [max].
  List<int> between(int min, int max) {
    final primes = <int>[];
    for (var i = min; i <= max; i++) {
      if (i.isPrime) {
        primes.add(i);
      }
    }
    return primes;
  }

  /// Returns prime numbers with prime-gap of [gap] between [min] and [max].
  List<List<int>> gapsBetween(int gap, int min, int max) {
    final gaps = <List<int>>[];
    int k = 1;
    for (int i = min; i <= max; i++) {
      if (i.isPrime) {
        if (i - k == gap) gaps.add([k, i]);
        k = i;
      }
    }
    return gaps;
  }

  /// Returns list of K-primes between [min] and [max].
  /// A natural number is called k-prime if it has exactly k prime factors.
  List<int> kPrimesBetween(int k, int min, int max) {
    final kPrimes = <int>[];
    for (int i = min; i <= max; i++) {
      if (i.isKPrime(k)) {
        kPrimes.add(i);
      }
    }
    return kPrimes;
  }
}

extension PrimeInt on int {
  /// Returns true if the number is prime.
  bool get isPrime {
    if (factors(returnFast: true).length == 1) return true;
    return false;
  }

  /// Returns true if the number is k-prime.
  /// A natural number is called k-prime if it has exactly k prime factors.
  bool isKPrime(int k) {
    if (factors().length == k) return true;
    return false;
  }

  /// Gap till next prime.
  int primeGap() {
    return nextPrime() - this;
  }

  /// Returns the next prime number.
  int nextPrime() {
    var candidate = this + 1;
    while (!candidate.isPrime) {
      candidate++;
    }
    return candidate;
  }

  /// Returns the previous prime number or null.
  int? previousPrime() {
    var candidate = this - 1;
    while (!candidate.isPrime) {
      candidate--;
      if (candidate < 2) {
        return null;
      }
    }
    return candidate;
  }

  /// Returns list of prime factors.
  /// If [fastReturn] is true, returns directly when more factors are found.
  List<int> factors({returnFast = false}) {
    var n = abs();
    List<int> r = [];
    for (int i = 2; i <= sqrt(n); i++) {
      while (n % i == 0) {
        r.add(i);
        if (r.length > 1 && returnFast) return r;
        n = n ~/ i;
      }
    }
    if (n > 1) r.add(n);
    return r;
  }

  /// Returns factor count
  int factorCount() {
    return factors().length;
  }
}
