int sumAllMultiplesBefore(int max) {
  assert(max > 0);

  var sum = 0;

  for (var i = 0; i < max; i++) {
    if (i.isDividedBy(3) || i.isDividedBy(5)) {
      sum += i;
    }
  }

  return sum;
}

/// Solução usando operações em listas para vários divisores
num sumALlMultiplesOfDivisorsBefore(int max, {List<int> divisors = const [3, 5]}) {
  assert(max > 0);
  assert(!divisors.contains(0));

  if (divisors.isEmpty) return 0;

  final allMultiples = divisors.fold<Set<num>>(
    {},
    (multiples, divisor) {
      final amountOfMultiples = (max - 1) ~/ divisor;

      return multiples..addAll(List.generate(amountOfMultiples + 1, (i) => i * divisor));
    },
  );

  return allMultiples.reduce((value, element) => value + element);
}

extension Divisivel on num {
  bool isDividedBy(num other) {
    return this % other == 0;
  }
}
