import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Xác thực đăng nhập', () {
    test('Phone và mật khẩu hợp lệ', () {
      final validator = LoginValidator();

      final isValid = validator.validate('0965674033', '12345678');

      expect(isValid, true);
    });

    test('Phone không hợp lệ', () {
      final validator = LoginValidator();

      final isValid = validator.validate('096567403a', '12345678');

      expect(isValid, false);
    });

    test('Mật khẩu không hợp lệ', () {
      final validator = LoginValidator();

      final isValid = validator.validate('example@example.com', '');

      expect(isValid, false);
    });

    test('Mật khẩu đủ mạnh', () {
      final validator = LoginValidator();

      final isValid = validator.validatePass('12345678');

      expect(isValid, 'Mật khẩu đủ mạnh');
    });

    test('Mật khẩu không đủ mạnh', () {
      final validator = LoginValidator();

      final isValid = validator.validatePass('1234');

      expect(isValid, 'Mật khẩu không đủ mạnh');
    });
  });
}

class LoginValidator {
  bool validate(String phone, String password) {
    if (phone.isEmpty || password.isEmpty) {
      return false;
    }
    // Kiểm tra định dạng phone number
    final phoneRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    if (!phoneRegExp.hasMatch(phone)) {
      return false;
    }
    return true;
  }

  String? validatePass(String? value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return (regExp.hasMatch(value ?? '') || ((value ?? '').length > 7))
        ? 'Mật khẩu đủ mạnh'
        : 'Mật khẩu không đủ mạnh';
  }
}
