import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Authentication Methods
  static Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Error: $e');
      return null;
    }
  }

  static Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Error: $e');
      return null;
    }
  }

  static Future<void> signOut() async {
    await auth.signOut();
  }

  // Firestore Methods
  static Future<void> addData({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    try {
      await firestore.collection(collection).add(data);
    } catch (e) {
      print('Error: $e');
    }
  }

  static Future<void> updateData({
    required String collection,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await firestore.collection(collection).doc(docId).update(data);
    } catch (e) {
      print('Error: $e');
    }
  }

  static Future<DocumentSnapshot> getData({
    required String collection,
    required String docId,
  }) async {
    try {
      DocumentSnapshot doc =
          await firestore.collection(collection).doc(docId).get();
      return doc;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  static Future<void> deleteData({
    required String collection,
    required String docId,
  }) async {
    try {
      await firestore.collection(collection).doc(docId).delete();
    } catch (e) {
      print('Error: $e');
    }
  }
}
