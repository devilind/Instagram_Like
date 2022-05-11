import 'package:flutter/material.dart';
import 'package:jbs/components/rounded_button.dart';
import '../../components/attachments.dart';
import '../../components/dropdown_button.dart';
import '../../constants/textfield.dart';

enum JobType {
  //group,
  fresh,
  repair,
  services,
}

class CreateJobScreen extends StatefulWidget {
  const CreateJobScreen({Key? key}) : super(key: key);

  @override
  State<CreateJobScreen> createState() => _CreateJobScreenState();
}

class _CreateJobScreenState extends State<CreateJobScreen> {
  JobType _groupValue = JobType.fresh;

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
            'Create Job',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Select Category', style: kFormFieldHintTextStyle),
              const SizedBox(
                height: 12,
              ),
              const DropDownButton(Items: [
                'Home Cleaning',
                'Carpenters',
                'Electricians',
                'Painters',
                'Pest Control Services',
                'Plumbers',
                'Salon at home',
                'Welder',
                'Gas',
                'Other'
              ]),
              const SizedBox(
                height: 25,
              ),
              const Text('Which work', style: kFormFieldHintTextStyle),
              const SizedBox(
                height: 12,
              ),
              TextField(
                style: kFormFieldTextStyle,
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter here'),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('Select Type', style: kFormFieldHintTextStyle),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Radio(
                          activeColor: const Color(0xffCE004A),
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => const Color(0xffCE004A)),
                          value: JobType.fresh,
                          groupValue: _groupValue,
                          onChanged: (value) {
                            _groupValue = value as JobType;
                            setState(() {});
                          }),
                      const Text(
                        'New',
                        style: kFormFieldTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          activeColor: const Color(0xffCE004A),
                          fillColor: MaterialStateColor.resolveWith((states) =>
                              const Color(
                                  0xffCE004A)), //fillColor: Color(0xffCE004A),
                          value: JobType.repair,
                          groupValue: _groupValue,
                          onChanged: (value) {
                            _groupValue = value as JobType;
                            setState(() {});
                          }),
                      const Text(
                        'Repair',
                        style: kFormFieldTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          activeColor: const Color(0xffCE004A),
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => const Color(0xffCE004A)),
                          value: JobType.services,
                          groupValue: _groupValue,
                          onChanged: (value) {
                            _groupValue = value as JobType;
                            setState(() {});
                          }),
                      const Text(
                        'Services',
                        style: kFormFieldTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const DropDownButton(Items: ['Size', 'Height', 'Width', 'Feet']),
              const SizedBox(
                height: 25,
              ),
              const Text('Upload Photo', style: kFormFieldHintTextStyle),
              const SizedBox(
                height: 12,
              ),
              const Attachment(),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: const [
                  Text('Work Related Information',
                      style: kFormFieldHintTextStyle),
                  Spacer(),
                  Text('(Optional)',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          color: Color(0xffB1B1B3),
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                style: kFormFieldTextStyle,
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Start Recording', suffixIcon: GestureDetector(child: Icon(Icons.mic),)),
                
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('Enter Address / Current Location',
                  style: kFormFieldHintTextStyle),
              const SizedBox(
                height: 12,
              ),
              TextField(
                style: kFormFieldTextStyle,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'ABC Estate, 16 Apple Ct, Community 12, Surat'),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('City', style: kFormFieldHintTextStyle),
              const SizedBox(
                height: 12,
              ),
              TextField(
                style: kFormFieldTextStyle,
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter City'),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('District', style: kFormFieldHintTextStyle),
              const SizedBox(
                height: 12,
              ),
              TextField(
                style: kFormFieldTextStyle,
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter District'),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('State', style: kFormFieldHintTextStyle),
              const SizedBox(
                height: 12,
              ),
              TextField(
                style: kFormFieldTextStyle,
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter State'),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('Pincode', style: kFormFieldHintTextStyle),
              const SizedBox(
                height: 12,
              ),
              TextField(
                style: kFormFieldTextStyle,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: '000000',
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                  child: RoundedButton(
                      width: 260,
                      colour: const Color(0xffCE004A),
                      title: 'Submit',
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
