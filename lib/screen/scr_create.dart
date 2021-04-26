import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();
  File _image;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: [IconButton(icon: Icon(Icons.send), onPressed: () {})],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _image == null ? Text('이미지 없음.') : Image.file(_image),
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(hintText: '내용을 입력하세요.'),
          )
        ],
      ),
    );
  }

  Future _getImage() async {
    // PickedFile image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedFile.path);
    });
  }
}
