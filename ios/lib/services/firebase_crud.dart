import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Juego');


class FirebaseCrud {

  static Future<Response> addGame({
    required String name,
    required String description,
    required String image,
    required String rated,
  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "description": description,
      "image": image,
      "rated": rated,
    };

    var result = await documentReferencer
        .set(data)
        .whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully added to the database";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }



  static Future<Response> updateGame({
    required String name,
    required String description,
    required String image,
    required String rated,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "description": description,
      "image": image,
      "rated": rated,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
      response.code = 200;
      response.message = "Si se pudo ALV";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Stream<QuerySnapshot> readGame() {
    CollectionReference notesItemCollection =
        _Collection;

    return notesItemCollection.snapshots();
  }

  static Future<Response> deleteGame({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete((){
      response.code = 200;
      response.message = "Adios ";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

}