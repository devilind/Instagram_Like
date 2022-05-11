import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jbs/components/rounded_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../constants/textfield.dart';

enum JobType {
  group,
  single_person,
  company,
}

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  int stackIndex = 0;
  JobType _groupValue = JobType.single_person;
  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            'Registration',
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
              const Text('Police Verfication Certificate Photo',
                  style: kFormFieldHintTextStyle),
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
                          value: JobType.single_person,
                          groupValue: _groupValue,
                          onChanged: (value) {
                            log(pin1.toString());
                            log(pin2.toString());
                            _groupValue = value as JobType;
                            setState(() {
                              stackIndex = 0;
                            });
                          }),
                      const Text(
                        'Single Person',
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
                          value: JobType.company,
                          groupValue: _groupValue,
                          onChanged: (value) {
                            log(pin1.toString());
                            log(pin2.toString());
                            _groupValue = value as JobType;
                            setState(() {
                              stackIndex = 1;
                            });
                          }),
                      const Text(
                        'Company',
                        style: kFormFieldTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              IndexedStack(
                index: stackIndex,
                children: [
                  SinglePersonWidget(pin1: pin1),
                  CompanyWidget(pin2: pin2),
                ],
              ),
              // _groupValue == JobType.single_person
              //     ?
              // SinglePersonWidget(pin1: pin1)
              //     :
              // CompanyWidget(pin2: pin2),

            ],
          ),
        ),
      ),
    );
  }
}

class CompanyWidget extends StatelessWidget {
  const CompanyWidget({
    Key? key,
    required this.pin2,
  }) : super(key: key);

  final TextEditingController pin2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Shop Name', style: kFormFieldHintTextStyle),
        const SizedBox(
          height: 12,
        ),
        TextField(
          style: kFormFieldTextStyle,
          decoration:
          kTextFieldDecoration.copyWith(hintText: 'Enter shop name'),
        ),
        const SizedBox(
          height: 25,
        ),
        const Text('Shop Address', style: kFormFieldHintTextStyle),
        const SizedBox(
          height: 12,
        ),
        TextField(
          style: kFormFieldTextStyle,
          decoration:
          kTextFieldDecoration.copyWith(hintText: 'Enter shop address'),
        ),
        const SizedBox(
          height: 25,
        ),
        const Text('Mobile Number', style: kFormFieldHintTextStyle),
        const SizedBox(
          height: 12,
        ),
        TextField(
          style: kFormFieldTextStyle,
          decoration:
          kTextFieldDecoration.copyWith(hintText: 'Enter mobile number'),
        ),
        const SizedBox(
          height: 25,
        ),
        const Text('OTP Verification', style: kFormFieldHintTextStyle),
        const SizedBox(
          height: 12,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: PinCodeTextField(
            onChanged: (value) {},
            appContext: context,
            length: 6,
            obscureText: false,
            controller: pin2,
            validator: (v) {
              if (v!.length < 6) {
                return 'Enter six digit OTP';
              } else {
                return null;
              }
            },
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: Colors.white,
              inactiveColor: Colors.grey,
            ),
            cursorColor: Colors.white,
            keyboardType: TextInputType.number,
            boxShadows: const [
              BoxShadow(
                offset: Offset(0, 1),
                color: Colors.black12,
                blurRadius: 36,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        const Text('Shop Phone Number', style: kFormFieldHintTextStyle),
        const SizedBox(
          height: 12,
        ),
        TextField(
          style: kFormFieldTextStyle,
          decoration:
          kTextFieldDecoration.copyWith(hintText: 'Enter mobile number'),
        ),
        SizedBox(height: 45,),
        Center(child: RoundedButton(width: 260,title: 'Next', onPressed: (){}, colour: const Color(0xffCE004A))),
        SizedBox(height: 20,),

      ],
    );
  }
}

class SinglePersonWidget extends StatelessWidget {
  const SinglePersonWidget({
    Key? key,
    required this.pin1,
  }) : super(key: key);

  final TextEditingController pin1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Mobile Number', style: kFormFieldHintTextStyle),
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
        const Text('OTP Verification', style: kFormFieldHintTextStyle),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: PinCodeTextField(
            onChanged: (value) {},
            appContext: context,
            length: 6,
            obscureText: false,
            controller: pin1,
            validator: (v) {
              if (v!.length < 6) {
                return 'Enter six digit OTP';
              } else {
                return null;
              }
            },
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: Colors.white,
              inactiveColor: Colors.grey,
            ),
            cursorColor: Colors.white,
            keyboardType: TextInputType.number,
            boxShadows: const [
              BoxShadow(
                offset: Offset(0, 1),
                color: Colors.black12,
                blurRadius: 36,
              )
            ],
          ),
        ),
        SizedBox(height: 200,),
        Center(child: RoundedButton(width: 260,title: 'Next', onPressed: (){}, colour: const Color(0xffCE004A))),

      ],
    );
  }
}
