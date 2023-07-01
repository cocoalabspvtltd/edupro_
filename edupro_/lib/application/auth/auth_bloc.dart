import 'package:pgs_edupro/domain/auth/i_auth_facade.dart';
import 'package:pgs_edupro/domain/auth/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade? authFacade;

  AuthBloc({this.authFacade}) : super(const AuthState.initial()) {
    on<AuthCheckRequested>((event, emit) async {
      final userOption = await authFacade!.getSignedInUser();
      emit(userOption.fold(
        () => const AuthState.unauthenticated(),
        (user) => AuthState.authenticated(user),
      ));
    });

    on<SignedOut>((event, emit) async {
      await authFacade!.signOut();
      emit(const AuthState.unauthenticated());
    });
  }

  // @override
  // Stream<AuthState> mapEventToState(
  //   AuthEvent event,
  // ) async* {
  //   yield* event.map(
  //     authCheckRequested: (e) async* {
  //       final userOption = await _authFacade.getSignedInUser();
  //       yield userOption.fold(
  //         () => const AuthState.unauthenticated(),
  //         (user) => AuthState.authenticated(user),
  //       );
  //     },
  //     signedOut: (e) async* {
  //       await _authFacade.signOut();
  //       yield const AuthState.unauthenticated();
  //     },
  //   );
  // }
}
