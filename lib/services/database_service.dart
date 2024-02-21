import 'package:cloud_firestore/cloud_firestore.dart';

class CFSDatabaseService{

  static final FirebaseFirestore db = FirebaseFirestore.instance;

  // static Future<void> storeData({required String collectionPath, required Map<String, dynamic> data})async{
  //   await db.collection(collectionPath).add(data);
  // }
  //

  Future storeData({ required Map<String, dynamic> dataOfUsers, required String id,}) async{
    await db
        .collection('User')
        .doc(id)
        .set(dataOfUsers);
  }

  // static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> readAllData({required String collectionPath})async{
  //   await db.collection(collectionPath).get().then((value) {
  //     for(var doc in value.docs){
  //       documents.add(doc);
  //     }
  //   });
  //   return documents;
  // }

   Future<Stream<QuerySnapshot>> readAllData()async{
    return await db.collection('User').snapshots();
  }

  Future updateUser(String id, Map<String, dynamic> updateInfo) async{
    return await db.collection('User').doc(id).update(updateInfo);
  }

  Future deleteUser(String id) async{
    return await db.collection('User').doc(id).delete();
  }
}