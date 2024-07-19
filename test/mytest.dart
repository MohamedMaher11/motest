// test/multiply_test.dart
import 'package:test/test.dart';
import 'package:testingnewapp/main.dart';

void main() {
  test("Multiply two numbers", () {
    int expectedProduct = 15;
    int result = multiply(3, 5);
    expect(result, expectedProduct);
  });

  test("Multiply with zero", () {
    int expectedProduct = 0;
    int result = multiply(0, 5);
    expect(result, expectedProduct);
  });

  test("Multiply two negative numbers", () {
    int expectedProduct = 20;
    int result = multiply(-4, -5);
    expect(result, expectedProduct);
  });
}
