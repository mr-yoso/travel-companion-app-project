import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? get currentUser => _auth.currentUser;

  bool get isAuthenticated => currentUser != null;

  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<void> signup(String name, String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;

      // Save user profile info to Firestore
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
        'name': name,
        'email': email,
        'profilePhoto': '',
      });
    } catch (e) {
      throw Exception('Signup failed: $e');
    }
  }

  void logout() async {
    await _auth.signOut();
    notifyListeners();
  }

  Future<void> addPlace(String userId, String title, String description, String imageUrl, GeoPoint location) async {
    try {
      await _firestore.collection('places').add({
        'userId': userId,
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
        'location': location,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to add place: $e');
    }
  }

  Stream<List<Map<String, dynamic>>> fetchPlaces(String userId) {
    return _firestore
        .collection('places')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }
}
