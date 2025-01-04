// import 'package:flutter/material.dart';
// import 'package:letsbrunch/presentation/providers/auth/repositories/auth_repository.dart';
// import 'package:riverpod/riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// // final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
// //   (ref) => AuthNotifier(),
// // );
// final authRepositoryProvider = Provider<AuthRepository>(
//   (ref) => AuthRepository(),
// );

// final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
//   (ref) {
//     final repository = ref.read(authRepositoryProvider);
//     return AuthNotifier(authRepository: repository);
//   },
// );

// class AuthState {
//   final String otpCode;
//   final String initialDialCode;
//   final String initialCountryCode;
//   final bool isLoading;
//   final bool isOtpCompleted;
//   final bool obscurePassword;
//   final bool rememberMe; // New field for remember me
//   final TextEditingController emailController;
//   final TextEditingController passwordController;
//   final TextEditingController emailsignController;
//   final TextEditingController passwordsignController;
//   final TextEditingController phoneNumberController;
//   final TextEditingController fNameController;
//   final TextEditingController lNameController;
//   final TextEditingController dobController;
//   final GlobalKey<FormState> formKey;

//   AuthState({
//     this.otpCode = '',
//     this.initialDialCode = '+1',
//     this.initialCountryCode = 'US',
//     this.isLoading = false,
//     this.isOtpCompleted = false,
//     this.obscurePassword = true,
//     this.rememberMe = false, // Default to false
//     TextEditingController? emailController,
//     TextEditingController? passwordController,
//     TextEditingController? emailsignController,
//     TextEditingController? passwordsignController,
//     TextEditingController? phoneNumberController,
//     TextEditingController? fNameController,
//     TextEditingController? lNameController,
//     TextEditingController? dobController,
//     GlobalKey<FormState>? formKey,
//   })  : emailController = emailController ?? TextEditingController(),
//         passwordController = passwordController ?? TextEditingController(),
//         emailsignController = emailsignController ?? TextEditingController(),
//         passwordsignController =
//             passwordsignController ?? TextEditingController(),
//         phoneNumberController =
//             phoneNumberController ?? TextEditingController(),
//         formKey = formKey ?? GlobalKey<FormState>(),
//         fNameController = fNameController ?? TextEditingController(),
//         lNameController = lNameController ?? TextEditingController(),
//         dobController = dobController ?? TextEditingController();

//   // Updated copyWith method to include rememberMe
//   AuthState copyWith({
//     String? otpCode,
//     String? initialDialCode,
//     String? initialCountryCode,
//     bool? isLoading,
//     bool? isOtpCompleted,
//     bool? obscurePassword,
//     bool? rememberMe, // New parameter
//     TextEditingController? emailController,
//     TextEditingController? passwordController,
//     TextEditingController? emailsignController,
//     TextEditingController? passwordsignController,
//     TextEditingController? phoneNumberController,
//     TextEditingController? fNameController,
//     TextEditingController? lNameController,
//     TextEditingController? dobController,
//     GlobalKey<FormState>? formKey,
//   }) {
//     return AuthState(
//       otpCode: otpCode ?? this.otpCode,
//       initialDialCode: initialDialCode ?? this.initialDialCode,
//       initialCountryCode: initialCountryCode ?? this.initialCountryCode,
//       isLoading: isLoading ?? this.isLoading,
//       isOtpCompleted: isOtpCompleted ?? this.isOtpCompleted,
//       obscurePassword: obscurePassword ?? this.obscurePassword,
//       rememberMe: rememberMe ?? this.rememberMe, // Added rememberMe
//       emailController: emailController ?? this.emailController,
//       passwordController: passwordController ?? this.passwordController,
//       emailsignController: emailsignController ?? this.emailsignController,
//       passwordsignController:
//           passwordsignController ?? this.passwordsignController,
//       fNameController: fNameController ?? this.fNameController,
//       lNameController: lNameController ?? this.lNameController,
//       phoneNumberController:
//           phoneNumberController ?? this.phoneNumberController,
//       dobController: dobController ?? this.dobController,
//       formKey: formKey ?? this.formKey,
//     );
//   }
// }

// class AuthNotifier extends StateNotifier<AuthState> {
//   final AuthRepository _authRepository;

//   AuthNotifier({required AuthRepository authRepository})
//       : _authRepository = authRepository,
//         super(AuthState()) {
//     _loadRememberedCredentials();
//   }

//   Future<void> signInWithEmail() async {
//     state = state.copyWith(isLoading: true);

//     try {
//       final email = state.emailsignController.text.trim();
//       final password = state.passwordsignController.text.trim();

//       await _authRepository.signInWithEmailAndPassword(email, password);

//       // Save credentials if 'Remember Me' is checked
//       await saveCredentials();
//     } catch (e) {
//       throw Exception("Sign-in failed: $e");
//     } finally {
//       state = state.copyWith(isLoading: false);
//     }
//   }

//   Future<void> signUp() async {
//     state = state.copyWith(isLoading: true);

//     try {
//       final email = state.emailController.text.trim();
//       final password = state.passwordController.text.trim();
//       final firstName = state.fNameController.text.trim();
//       final lastName = state.lNameController.text.trim();
//       final dob = state.dobController.text.trim();
//       final phoneNumber = state.phoneNumberController.text.trim();

//       await _authRepository.signUp(
//         email: email,
//         password: password,
//         firstName: firstName,
//         lastName: lastName,
//         dateOfBirth: dob,
//         phoneNumber: phoneNumber,
//       );
//     } catch (e) {
//       throw Exception("Sign-up failed: $e");
//     } finally {
//       state = state.copyWith(isLoading: false);
//     }
//   }

//   // Method to toggle remember me
//   void toggleRememberMe(bool value) {
//     state = state.copyWith(rememberMe: value);
//   }

//   // Save credentials when user logs in
//   Future<void> saveCredentials() async {
//     if (state.rememberMe) {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setString('rememberedEmail', state.emailsignController.text);
//       await prefs.setString(
//           'rememberedPassword', state.passwordsignController.text);
//       await prefs.setBool('rememberMe', true);
//     } else {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.remove('rememberedEmail');
//       await prefs.remove('rememberedPassword');
//       await prefs.remove('rememberMe');
//     }
//   }

//   // Load saved credentials
//   Future<void> _loadRememberedCredentials() async {
//     final prefs = await SharedPreferences.getInstance();
//     final rememberedEmail = prefs.getString('rememberedEmail');
//     final rememberedPassword = prefs.getString('rememberedPassword');
//     final isRememberMe = prefs.getBool('rememberMe') ?? false;

//     if (isRememberMe && rememberedEmail != null && rememberedPassword != null) {
//       state.emailsignController.text = rememberedEmail;
//       state.passwordsignController.text = rememberedPassword;
//       state = state.copyWith(rememberMe: true);
//     }
//   }

//   // Existing methods remain the same...
//   void setLoading(bool value) {
//     state = state.copyWith(isLoading: value);
//   }

//   void setOtpCompletion(bool value) {
//     state = state.copyWith(isOtpCompleted: value);
//   }

//   void togglePasswordVisibility() {
//     state = state.copyWith(obscurePassword: !state.obscurePassword);
//   }

//   bool validateForm() {
//     return state.formKey.currentState?.validate() ?? false;
//   }

//   void updateDialCode(String dialCode) {
//     state = state.copyWith(initialDialCode: dialCode);
//   }

//   String get phoneNumber =>
//       '${state.initialDialCode}${state.phoneNumberController.text}';
// }
