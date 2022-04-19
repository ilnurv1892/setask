// ignore_for_file: prefer_const_constructors
import 'package:firebase_repository/src/authentication_repository.dart';
import 'package:test/test.dart';

void main() {
  group('AuthenticationRepository', () {
    test('can be instantiated', () {
      expect(AuthenticationRepository(), isNotNull);
    });
  });
}
