import 'dart:io';

import 'package:cakelaya/widgets/custom_textbutton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImage extends StatefulWidget {
  final String labeltext;
  const AddImage({super.key, required this.labeltext});

  @override
  AddImageState createState() => AddImageState();
}

class AddImageState extends State<AddImage> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add ${widget.labeltext} (Max 1):',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextbutton(text: 'Add Image', radius: 8, onPressed: _pickImage),
        const SizedBox(
          height: 15,
        ),
        Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: _image != null
                    ? Image.file(
                        _image!,
                        height: 60,
                        width: 61,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: 61,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromRGBO(0, 0, 0, 0.25)),
                            borderRadius: BorderRadius.circular(20)),
                      )),
            Positioned(
              right: -14,
              bottom: -14,
              child: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    _image = null;
                  });
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}
