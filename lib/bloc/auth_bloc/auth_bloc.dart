import 'package:blocauth/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'auth.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({required this.userRepository})
      : assert(userRepository != null),
        super(AuthenticationUninitialized()) {
    on<AppStarted>(_onAppState);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(onLoaggedOut);
  }

  void _onAppState(
    AppStarted event,
    Emitter<AuthenticationState> emit,
  ) async {
    final state = this.state;
    if (state is AppStarted) {
      final bool hasToken = await userRepository.hasToken();
      if (hasToken) {
        emit(AuthenticationAuthenticated());
      } else {
        emit(AuthenticationUnauthenticated());
      }
    }
  }

  void _onLoggedIn(
    LoggedIn event,
    Emitter<AuthenticationState> emit,
  ) async {
    final state = this.state;
    if (state is LoggedIn) {
      emit(AuthenticationLoading());
      await userRepository.persistToken(event.token);
      emit(AuthenticationAuthenticated());
    }
  }

  void onLoaggedOut(
    LoggedOut event,
    Emitter<AuthenticationState> emit,
  ) async {
    final state = this.state;
    if (state is LoggedOut) {
      emit(AuthenticationLoading());
      await userRepository.deleteToken();
      emit(AuthenticationUnauthenticated());
    }
  }
}
