import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataController extends GetxController{
  Future getData(String collection) async{
    final Firestore firestore = Firestore.instance;
    QuerySnapshot snapshot = await firestore.collection(collection).getDocuments();
    return snapshot.documents;
  }

  Future queryData(String queryString) async {
    return Firestore.instance.collection('User')
        .where('Name', isGreaterThanOrEqualTo: queryString)
        .getDocuments();
  }

}
