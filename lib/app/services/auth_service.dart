import '../models/user_model.dart';

class AuthService {
  Future<UserModel> login(String email, String password) async {
    // Make API call to authenticate user
    // Simulating an asynchronous API call with a delay
    await Future.delayed(const Duration(seconds: 2));

    // Replace this with your actual authentication logic
    if (email == 'test@example.org' && password == '12345') {
      return UserModel(email: '', password: '');
    } else {
      throw Exception('Invalid credentials');
    }
  }

  Future<void> logout() async {
    // Perform logout logic, e.g., clear session, remove tokens, etc.
    // Simulating an asynchronous logout process with a delay
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> signup(String name, String email, String password) async {
    // Make API call to register user
    // Simulating an asynchronous signup process with a delay
    await Future.delayed(const Duration(seconds: 2));

    // Replace this with your actual signup logic
    // Handle the registration process
    // Throw an exception if signup fails
    if (email == 'test@example.com') {
      throw Exception('Email already exists');
    }
  }
}
