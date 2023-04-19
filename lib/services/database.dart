import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unavidabrillante/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> updateUserData(String uid, String name, String email, DateTime dateOfBirth) async {
    return await usersCollection.doc(uid).set({
      'name': name,
      'email': email,
      'dateOfBirth': dateOfBirth,
    });
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.get('name') ?? '',
      email: snapshot.get('email') ?? '',
      dateOfBirth: snapshot.get('dateOfBirth').toDate() ?? DateTime.now(),
    );
  }

  // get user doc stream
  Stream<UserData> get userData {
    return usersCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
