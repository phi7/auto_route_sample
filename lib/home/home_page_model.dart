import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class HomePageModel extends ChangeNotifier {
  File? imageFile;
  String? id;
  Uint8List? fileBytes;
  bool isLoading = false;

  final picker = ImagePicker();

  void startLoading(){
    isLoading = true;
    notifyListeners();
  }

  void endLoading(){
    isLoading = false;
    notifyListeners();
  }

  Future addImageToStorage() async {

    final doc = FirebaseFirestore.instance.collection("pages").doc();

    String? imgURL;
    if (imageFile != null) {
      //storageにアップロード。firestoreのidと同じに
      final task = await FirebaseStorage.instance.ref('pages/${doc.id}').putFile(imageFile!);
      final id = doc.id;
      imgURL = await task.ref.getDownloadURL();
    }

    //firestoreに追加
    //下記は先にドキュメントをつくっておいてセットしている
    await doc.set(
      {
        'imgURL': imgURL,
        'id': id,
      },
    );
    /*
    //addはcollectionに対して加えるときに使う。idは勝手につくられる。
    await FirebaseFirestore.instance.collection("books").add(
      {
        'title': title,
        'author': author,
      },
    );

     */
  }

  Future addImageToStorage2() async {

    final doc = FirebaseFirestore.instance.collection("pages").doc();

    if (fileBytes != null) {
      //storageにアップロード。firestoreのidと同じに
      await FirebaseStorage.instance.ref('pages/${doc.id}').putData(fileBytes!);
      id = doc.id;
    }

    //firestoreに追加 storageにはfileBytesで保存したから、こっちには何を保存するんだというかんじだが、こっちもfileBytes保存しとくか
    //下記は先にドキュメントをつくっておいてセットしている
    await doc.set(
      {
        'id': id,
      },
    );
  }

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future pickImage2() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    //print(result);
    if (result != null) {
      fileBytes = result.files.first.bytes!;
      notifyListeners();
    }
  }

  /*
  Future getSnapshot() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('pages')
        .doc()
        .get();
    final PageParameter _pageParameter = PageParameter(snapshot);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

   */


}