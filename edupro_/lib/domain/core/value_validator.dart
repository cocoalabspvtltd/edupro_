import 'package:dartz/dartz.dart';
import 'package:pgs_edupro/domain/core/failures.dart';
import 'package:kt_dart/collection.dart';

Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(ValueFailure.exceedingLength(
      failedValue: input,
      max: maxLength,
    ));
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isEmpty) {
    return left(ValueFailure.empty(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (input.contains('\n')) {
    return left(ValueFailure.multiline(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<KtList<T>>, KtList<T>> validateMaxListLength<T>(
    KtList<T> input, int maxLength) {
  if (input.size <= maxLength) {
    return right(input);
  } else {
    return left(ValueFailure.listTooLong(
      failedValue: input,
      max: maxLength,
    ));
  }
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  // Maybe not the most robust way of email validation but it's good enough
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  // You can also add some advanced password checks (uppercase/lowercase, at least 1 number, ...)
  if (input.length >= 8) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateName(String input) {
  const nameRegExp = r"""^[a-zA-Z][a-zA-Z\s]{0,20}[a-zA-Z]$)""";
  if (input.isEmpty) {
    return left(ValueFailure.empty(failedValue: input));
  } else if (!RegExp(nameRegExp).hasMatch(input)) {
    return left(ValueFailure.invalidName(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validatePhoneNumber(String input) {
  if (input.isEmpty) {
    return left(ValueFailure.empty(failedValue: input));
  } else if (input.length != 10) {
    return left(ValueFailure.invalidPhoneNumber(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateDateFormat(String input) {
  const dateRegExp =
      r"""^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)[0-9]{2}""";
  if (input.isEmpty) {
    return left(ValueFailure.empty(failedValue: input));
  } else if (!RegExp(dateRegExp).hasMatch(input)) {
    return left(ValueFailure.invalidDateFormat(failedValue: input));
  } else {
    return right(input);
  }
}
