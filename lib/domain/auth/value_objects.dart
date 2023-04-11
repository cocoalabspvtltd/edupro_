import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/core/failures.dart';
import 'package:pgs_edupro/domain/core/value_objects.dart';
import 'package:pgs_edupro/domain/core/value_validator.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    // ignore: unnecessary_null_comparison
    assert(input != null);
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    // ignore: unnecessary_null_comparison
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}

class Name extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Name(String input) {
    // ignore: unnecessary_null_comparison
    assert(input != null);
    return Name._(
      validateStringNotEmpty(input),
    );
  }

  const Name._(this.value);
}
class Qualification extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Qualification(String input) {
    // ignore: unnecessary_null_comparison
    assert(input != null);
    return Qualification._(
      validateStringNotEmpty(input),
    );
  }

  const Qualification._(this.value);
}
class Address extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Address(String input) {
    assert(input != null);
    return Address._(
      validateStringNotEmpty(input),
    );
  }

  const Address._(this.value);
}


class  Code extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Code(String input) {
    // ignore: unnecessary_null_comparison
    assert(input != null);
    return Code._(
      validateStringNotEmpty(input),
    );
  }

  const Code._(this.value);
}

class PhoneNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PhoneNumber(String input) {
    // ignore: unnecessary_null_comparison
    assert(input != null);
    return PhoneNumber._(
      validatePhoneNumber(input),
    );
  }

  const PhoneNumber._(this.value);
}

class DateFormatted extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory DateFormatted(String input) {
    // ignore: unnecessary_null_comparison
    assert(input != null);
    return DateFormatted._(
      validateDateFormat(input),
    );
  }

  const DateFormatted._(this.value);
}
