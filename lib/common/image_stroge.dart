import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class ImageStorage {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> imageUrl(String imageName, {bool profile = true}) async {
    final result = await storage
        .ref(profile ? "profile/$imageName" : "product/$imageName")
        .getDownloadURL();

    print("$imageName + $result");
    return result;
  }

  Future upload(String filePath, String imageName,
      {bool profile = true}) async {
    File file = File(filePath);
    try {
      await storage
          .ref(profile ? "profile/$imageName" : "product/$imageName")
          .putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}
