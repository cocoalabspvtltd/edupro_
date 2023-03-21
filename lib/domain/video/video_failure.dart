import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_failure.freezed.dart';

@freezed
class VideoFailure with _$VideoFailure {
  const factory VideoFailure.unexpected() = Unexpected;
  const factory VideoFailure.serverError(String errorCode) = ServerError;
  const factory VideoFailure.serverTimeOut() = ServerTimeOut;
  const factory VideoFailure.noData() = NoData;
}
