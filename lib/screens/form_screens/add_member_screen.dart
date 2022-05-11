import 'package:flutter/material.dart';
import 'package:jbs/components/attachments.dart';

import '../../components/rounded_button.dart';
import '../../constants/textfield.dart';

enum JobType {
  group,
  male,
  female,
}

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({Key? key}) : super(key: key);

  @override
  _AddMemberScreenState createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  JobType _groupValue = JobType.group;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back_ios_outlined,
          size: 20,
          color: Colors.black,
        ),
        actions: const [
          SizedBox(
            width: 60,
          )
        ],
        elevation: 0,
        title: const Center(
          child: Text(
            'Add Member',
            style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, top: 30, right: 22),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Full Name', style: kFormFieldHintTextStyle),
              const SizedBox(
                height: 12,
              ),
              TextField(
                style: kFormFieldTextStyle,
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter name'),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('Address', style: kFormFieldHintTextStyle),
              const SizedBox(
                height: 12,
              ),
              TextField(
                style: kFormFieldTextStyle,
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter address'),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('Date of Birth', style: kFormFieldHintTextStyle),
              const SizedBox(
                height: 12,
              ),
              TextField(
                style: kFormFieldTextStyle,
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'DD/MM/YYYY'),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('Gender preferences', style: kFormFieldHintTextStyle),
              const SizedBox(
                height: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Male',
                        style: kFormFieldTextStyle,
                      ),
                      const Spacer(),
                      Radio(
                          activeColor: const Color(0xffCE004A),
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => const Color(0xffCE004A)),
                          value: JobType.male,
                          groupValue: _groupValue,
                          onChanged: (value) {
                            _groupValue = value as JobType;
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Female',
                        style: kFormFieldTextStyle,
                      ),
                      const Spacer(),
                      Radio(
                          activeColor: const Color(0xffCE004A),
                          fillColor: MaterialStateColor.resolveWith((states) =>
                              const Color(
                                  0xffCE004A)), //fillColor: Color(0xffCE004A),
                          value: JobType.female,
                          groupValue: _groupValue,
                          onChanged: (value) {
                            _groupValue = value as JobType;
                            setState(() {});
                          }),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text('Mobile No.', style: kFormFieldHintTextStyle),
              const SizedBox(
                height: 12,
              ),
              TextField(
                style: kFormFieldTextStyle,
                decoration:
                    kTextFieldDecoration.copyWith(hintText: '+91-000000000'),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('Aadhar Number', style: kFormFieldHintTextStyle),
              const SizedBox(
                height: 12,
              ),
              TextField(
                style: kFormFieldTextStyle,
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter'),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('Aadhaar Card Photo', style: kFormFieldHintTextStyle),
              const SizedBox(
                height: 12,
              ),
              const Attachment(),
              const SizedBox(
                height: 25,
              ),
              const Text('Personal Mobile Number',
                  style: kFormFieldHintTextStyle),
              const SizedBox(
                height: 12,
              ),
              TextField(
                style: kFormFieldTextStyle,
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter'),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('+ New Member',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Color(0xffCE004A),
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
              const TextField(
                style: kFormFieldTextStyle,
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                  child: RoundedButton(
                      width: 260,
                      colour: const Color(0xffCE004A),
                      title: 'Next',
                      onPressed: () {})),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
