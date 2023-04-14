part of 'institution_deletion_class_bloc.dart';

@freezed
class InstitutionDeletionClassState with _$InstitutionDeletionClassState {
  const factory InstitutionDeletionClassState.initial() = _Initial;
  const factory InstitutionDeletionClassState({

    required bool showErrorMessages,
    required bool isLoading,
    required bool isSubmitting,

  }) = _InstitutionDeletionClassState;
}
