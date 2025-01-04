// import 'dart:async';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:otp_text_field/otp_field.dart';

// final authOtpProvider = StateNotifierProvider<AuthNotifier, AuthOtpState>(
//   (ref) => AuthNotifier(),
// );

// class AuthOtpState {
//   final String otpCode;
//   final bool isLoading;
//   final bool isOtpCompleted;
//   final bool canResendOtp;
//   final int remainingMinutes;
//   final int remainingSeconds;
//   final OtpFieldController otpFieldController;

//   AuthOtpState({
//     this.otpCode = '',
//     this.isLoading = false,
//     this.isOtpCompleted = false,
//     this.canResendOtp = false,
//     this.remainingMinutes = 2,
//     this.remainingSeconds = 0,
//     OtpFieldController? otpFieldController,
//   }) : otpFieldController = otpFieldController ?? OtpFieldController();

//   AuthOtpState copyWith({
//     String? otpCode,
//     bool? isLoading,
//     bool? isOtpCompleted,
//     bool? canResendOtp,
//     int? remainingMinutes,
//     int? remainingSeconds,
//     OtpFieldController? otpFieldController,
//   }) {
//     return AuthOtpState(
//       otpCode: otpCode ?? this.otpCode,
//       isLoading: isLoading ?? this.isLoading,
//       isOtpCompleted: isOtpCompleted ?? this.isOtpCompleted,
//       canResendOtp: canResendOtp ?? this.canResendOtp,
//       remainingMinutes: remainingMinutes ?? this.remainingMinutes,
//       remainingSeconds: remainingSeconds ?? this.remainingSeconds,
//       otpFieldController: otpFieldController ?? this.otpFieldController,
//     );
//   }
// }

// class AuthNotifier extends StateNotifier<AuthOtpState> {
//   Timer? _timer;

//   AuthNotifier() : super(AuthOtpState()) {
//     _startTimer();
//   }

//   // Update OTP as user types
//   void updateOtp(String otp) {
//     state = state.copyWith(otpCode: otp, isOtpCompleted: otp.length == 4);
//   }

//   // Handle OTP completion
//   void completeOtp(String otp) {
//     state = state.copyWith(otpCode: otp, isOtpCompleted: true);
//   }

//   // Resend OTP
//   void resendOtp() {
//     state = state.copyWith(
//         canResendOtp: false, remainingMinutes: 2, remainingSeconds: 0);
//     _startTimer();
//     // Add logic to resend the OTP
//   }

//   // Start a timer for OTP expiry
//   void _startTimer() {
//     _timer?.cancel();
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (state.remainingSeconds > 0) {
//         state = state.copyWith(remainingSeconds: state.remainingSeconds - 1);
//       } else if (state.remainingMinutes > 0) {
//         state = state.copyWith(
//           remainingMinutes: state.remainingMinutes - 1,
//           remainingSeconds: 59,
//         );
//       } else {
//         state = state.copyWith(canResendOtp: true);
//         _timer?.cancel();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
// }
