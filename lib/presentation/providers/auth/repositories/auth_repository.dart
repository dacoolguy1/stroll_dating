// class AuthRepository extends BaseRepository {
//   final ApiClient _apiClient; // Your API client

//   AuthRepository({required ApiClient apiClient}) : _apiClient = apiClient;

//   Future<User?> login(String email, String password) async {
//     try {
//       final response = await _apiClient.post(
//         '/auth/login',
//         data: {'email': email, 'password': password},
//       );
//       return User.fromJson(response.data);
//     } catch (e) {
//       // Handle errors
//       return null;
//     }
//   }

//   Future<void> logout() async {
//     // Implement logout logic
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthRepository({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  })  : _auth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception("Email and password cannot be empty");
    }

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "An error occurred during sign-in");
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String dateOfBirth,
    required String phoneNumber,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception("Email and password cannot be empty");
    }

    try {
      // Create user in Firebase Authentication
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;

      if (user == null) {
        throw Exception("Failed to create user");
      }

      // Update the user's display name
      await user.updateDisplayName('$firstName $lastName');

      // Create a Firestore document for the user
      final userDoc = _firestore.collection('users').doc(user.uid);

      await userDoc.set({
        'fullName': '$firstName $lastName',
        'email': email,
        'phoneNumber': phoneNumber,
        'dateOfBirth': dateOfBirth,
        'bio': '', // Optional field
        'profilePicture': '', // Optional field
        'createdAt':
            FieldValue.serverTimestamp(), // Track when the user was created
      });
    } on FirebaseAuthException catch (e) {
      print(3);
      throw Exception(e.message ?? "An error occurred during sign-up");
    } catch (e) {
      print(e);
      throw Exception("An unexpected error occurred: $e");
    }
  } // Additional methods for sign-up, password reset, etc., can be added here.
}
