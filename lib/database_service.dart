import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // This function makes two users friends in Firestore
  Future<void> makeFriends(String userAId, String userBId, String nameA,
      String nameB, String imgA, String imgB) async {
    // Add User B to User A's friends sub-collection
    await _db.collection('users').doc(userAId).collection('friends').doc(
        userBId).set({
      'uid': userBId,
      'name': nameB,
      'profileImageUrl': imgB,
      'createdAt': FieldValue.serverTimestamp(),
    });

    await _db.collection('users').doc(userBId).collection('friends').doc(
        userAId).set({
      'uid': userAId,
      'name': nameA,
      'profileImageUrl': imgA,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}