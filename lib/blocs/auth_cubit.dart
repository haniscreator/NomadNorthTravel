import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<String?> {
  AuthCubit() : super(null);

  void login({required String email}) {
    emit(email); // Use the email as logged-in identifier
  }

  void logout() {
    emit(null); // Reset state to logged out
  }
}
