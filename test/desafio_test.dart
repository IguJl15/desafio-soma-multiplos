import 'package:desafio/sum_all_multiples.dart';
import 'package:test/test.dart';

void main() {
  group("Função simples:", () {
    test('10 deve resultar em 23', () async {
      final result = sumAllMultiplesBefore(10);

      expect(result, 23);
    });

    test('11 deve resultar em 33', () async {
      final result = sumAllMultiplesBefore(11);

      expect(result, 33);
    });
  });

  group("Com diversos divisores:", () {
    test("quando nenhum divisor é passado deve retornar 0", () {
      final result = sumALlMultiplesOfDivisorsBefore(10, divisors: []);

      expect(result, 0);
    });

    group("com divisores 3 e 5:", () {
      test('10 deve resultar em 23', () async {
        final result = sumALlMultiplesOfDivisorsBefore(10);

        expect(result, 23);
      });

      test('11 deve resultar em 33', () async {
        final result = sumALlMultiplesOfDivisorsBefore(11);

        expect(result, 33);
      });
    });

    group("com divisores 2 e 8 (múltiplos comuns devem ser omitidos):", () {
      test('10 deve resultar em 28', () async {
        final result = sumALlMultiplesOfDivisorsBefore(10, divisors: [2, 8]);

        expect(result, 20);
      });

      test('20 deve resultar em 33', () async {
        final result = sumALlMultiplesOfDivisorsBefore(20, divisors: [2, 8]);

        expect(result, 90);
      });
    });

    group("com divisores 7 e 11:", () {
      // Dado o numero máximo de 45 e
      // divisores 7 e 11, temos que
      /// múltiplos de 7:
      ///   7, 14, 21, 28, 35, 42
      /// de 11:
      ///   11, 22, 33, 44
      ///
      /// Soma:
      ///   257
      test('45 deve resultar em 257', () async {
        final result = sumALlMultiplesOfDivisorsBefore(45, divisors: [7, 11]);

        expect(result, 257);
      });

      test('13 deve resultar em 18', () async {
        final result = sumALlMultiplesOfDivisorsBefore(13, divisors: [7, 11]);

        expect(result, 18);
      });
    });
  });

  group("Assertion Error devem ser lançados quando", () {
    test("Número máximo seja 0 ou menor", () {
      expect(() => sumAllMultiplesBefore(-1), throwsA(isA<AssertionError>()));
      expect(() => sumAllMultiplesBefore(0), throwsA(isA<AssertionError>()));
    });

    test("Qualquer divisores seja 0", () {
      expect(() => sumALlMultiplesOfDivisorsBefore(10, divisors: [10, 0]), throwsA(isA<AssertionError>()));
      expect(() => sumALlMultiplesOfDivisorsBefore(10, divisors: [10, 1, 5, 0, 6]),
          throwsA(isA<AssertionError>()));
      expect(() => sumALlMultiplesOfDivisorsBefore(10, divisors: [0]), throwsA(isA<AssertionError>()));
    });

    test("Qualquer divisores seja ", () {
      expect(() => sumALlMultiplesOfDivisorsBefore(10, divisors: [10, 0]), throwsA(isA<AssertionError>()));
      expect(() => sumALlMultiplesOfDivisorsBefore(10, divisors: [10, 1, 5, 0, 6]),
          throwsA(isA<AssertionError>()));
      expect(() => sumALlMultiplesOfDivisorsBefore(10, divisors: [0]), throwsA(isA<AssertionError>()));
    });
  });
}
