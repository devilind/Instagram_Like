import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';


class Attachment extends StatefulWidget {
  const Attachment({
    Key? key,
  }) : super(key: key);

  @override
  State<Attachment> createState() => _AttachmentState();
}

class _AttachmentState extends State<Attachment> {
  File? imgFile;

  final imgPicker = ImagePicker();

  Future<void> showAttachDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:  const Text("Options"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child:  const Text("Capture Image From Camera"),
                    onTap: () {
                      openCamera();
                    },
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child:  const Text("Take Image From Gallery"),
                    onTap: () {
                      openGallery();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void openCamera() async {
    var imgNotice = await imgPicker.pickImage(source: ImageSource.camera);

    if (imgNotice == null) return;
    setState(() {
      imgFile = File(imgNotice.path);
    });
    Navigator.of(context).pop();
  }

  void openGallery() async {
    var imgNotice = await imgPicker.pickImage(source: ImageSource.gallery);
    if (imgNotice == null) return;
    setState(() {
      imgFile = File(imgNotice.path);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showAttachDialog(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 91,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(width: 1, color: Colors.grey.shade300),
        ),
        child: imgFile != null
            ? Material(
          borderRadius: BorderRadius.circular(15),
          child: Image.file(
            imgFile!,
            fit: BoxFit.cover,
          ),
        )
            : Container(
          child: DottedBorder(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(child: Icon(Icons.attachment_outlined, color: Color(0xffCE004A),),),
                Text(
                  "Attach Photo",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, fontFamily: 'Nunito'),
                ),
              ],
            ),
            color: const Color(0xffCE004A),
            strokeWidth: 1,
            dashPattern: const [8],
            radius: const Radius.circular(8),
          ),
          margin: const EdgeInsets.all(11),
          //width: size.width - 60,
          height: 71,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(width: 1, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

