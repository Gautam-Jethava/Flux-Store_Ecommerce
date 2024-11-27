part of 'sign_in_screen_cubit.dart';

class SignInScreenState extends Equatable {
  final bool userSignIn;
  const SignInScreenState(this.userSignIn);

  @override
  List<Object> get props => [userSignIn];

  SignInScreenState copyWith({bool? userSignIn}) {
    return SignInScreenState(userSignIn ?? this.userSignIn);
  }
}
