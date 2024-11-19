import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_sign_up_model.g.dart';

@JsonSerializable()
class UserSignUpModel extends Equatable {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  const UserSignUpModel({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  factory UserSignUpModel.fromJson(Map<String, dynamic> json) => _$UserSignUpModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserSignUpModelToJson(this);

  @override
  List<Object?> get props => [username, email, password, confirmPassword];

  UserSignUpModel copyWith({
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return UserSignUpModel(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
