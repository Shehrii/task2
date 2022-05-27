import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:task2/info.model.dart';
import 'package:task2/widgets.dart';

class ContactInfoScreen extends StatefulWidget {
  final int selectedValue;

  const ContactInfoScreen({Key? key, required this.selectedValue})
      : super(key: key);

  @override
  _ContactInfoScreenState createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  String? name, mobile, description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: customText(
                  "Cancel",
                  onTap: () => Navigator.pop(context),
                ),
              ),
              Container(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: customText(
                  "Contact Info",
                  size: 34,
                  bold: true,
                ),
              ),
              Container(
                height: 30,
              ),
              customTextField(
                hint: "Name",
                onChanged: (val) => name = val,
              ),
              customTextField(
                hint: "Mobile No",
                keyboardType: TextInputType.phone,
                onChanged: (val) => mobile = val,
              ),
              customTextField(
                hint: "Description",
                keyboardType: TextInputType.text,
                minLines: 5,
                onChanged: (val) => description = val,
              ),
              Container(
                height: 30,
              ),
              customButton(context, "Submit", onTap: () => submitData())
            ],
          ),
        ),
      ),
    );
  }

  submitData() {
    Info info = Info(
        name: name,
        mobile: mobile,
        description: description,
        selection: widget.selectedValue);
    FirebaseDatabase.instance
        .ref()
        .child("info")
        .push()
        .set(info)
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Successfully uploaded the content info"),
        ),
      );
    });
  }
}
