import 'package:flutter/material.dart';
import 'package:jbs/components/rounded_button.dart';

import '../../components/attachments.dart';
import '../../constants/textfield.dart';

enum JobType {
  group,
  male,
  female,
}

class DeliveryPartnerRegistrationScreen extends StatefulWidget {
  const DeliveryPartnerRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryPartnerRegistrationScreen> createState() =>
      _DeliveryPartnerRegistrationScreenState();
}

class _DeliveryPartnerRegistrationScreenState
    extends State<DeliveryPartnerRegistrationScreen> {
  int nodeIndex = 0;
  bool firstNodeComplete = false;
  bool secondNodeComplete = false;
  bool thirdNodeComplete = false;

  void firstFormSubmit() {
    nodeIndex = 1;
    firstNodeComplete = true;
    setState(() {});
  }

  void secondFormSubmit() {
    nodeIndex = 2;
    secondNodeComplete = true;
    setState(() {});
  }

  void thirdFormSubmit() {
    thirdNodeComplete = true;
    setState(() {});
  }

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
        elevation: 0,
        title: const Center(
          child: Text(
            'Delivery Partner Registration',
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
            children: [
              Row(
                children: [
                  ProgressNode(
                    isCompleted: firstNodeComplete,
                    isFocused: nodeIndex == 0 ? true : false,
                    nodeNumber: 1,
                    onPressed: () {},
                    nodeTitle: 'Registration',
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          color: const Color(0xffCE004A),
                          height: 1.6,
                        ),
                        const SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ProgressNode(
                    isCompleted: secondNodeComplete,
                    isFocused: nodeIndex == 1 ? true : false,
                    nodeNumber: 2,
                    onPressed: () {},
                    nodeTitle: 'ID Proof',
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          color: const Color(0xffCE004A),
                          height: 1.6,
                        ),
                        const SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ProgressNode(
                    isCompleted: thirdNodeComplete,
                    isFocused: nodeIndex == 2 ? true : false,
                    nodeNumber: 3,
                    onPressed: () {},
                    nodeTitle: 'Vehicle',
                  ),
                ],
              ),
              IndexedStack(
                index: nodeIndex,
                children: [
                  Form1(onButtonPress: firstFormSubmit),
                  Form2(onButtonPress: secondFormSubmit),
                  Form3(onButtonPress: thirdFormSubmit),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Form1 extends StatefulWidget {
  const Form1({
    Key? key,
    required this.onButtonPress,
  }) : super(key: key);

  final VoidCallback onButtonPress;

  @override
  State<Form1> createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  JobType _groupValue = JobType.male;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Center(
            child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.png'),
          radius: 40,
        )),
        const SizedBox(
          height: 16,
        ),
        const Text('Name', style: kFormFieldHintTextStyle),
        const SizedBox(
          height: 12,
        ),
        TextField(
          style: kFormFieldTextStyle,
          decoration: kTextFieldDecoration.copyWith(hintText: 'Enter name'),
        ),
        const SizedBox(
          height: 25,
        ),
        const Text('Parent\'s name', style: kFormFieldHintTextStyle),
        const SizedBox(
          height: 12,
        ),
        TextField(
          style: kFormFieldTextStyle,
          decoration: kTextFieldDecoration.copyWith(hintText: 'Enter here'),
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
          decoration: kTextFieldDecoration.copyWith(
              hintText: 'DD/MM/YYYY',
              suffixIcon: GestureDetector(
                child: const Icon(Icons.calendar_today_rounded),
              )),
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
        const Text('Enter Address (As per aadhar)',
            style: kFormFieldHintTextStyle),
        const SizedBox(
          height: 12,
        ),
        TextField(
          style: kFormFieldTextStyle,
          decoration: kTextFieldDecoration.copyWith(hintText: 'Enter address'),
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
          decoration: kTextFieldDecoration.copyWith(hintText: 'Enter District'),
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
          decoration: kTextFieldDecoration.copyWith(hintText: '000000'),
        ),
        const SizedBox(
          height: 25,
        ),
        Center(
            child: RoundedButton(
                colour: const Color(0xffCE004A),
                title: 'Next',
                width: 260,
                onPressed: widget.onButtonPress)),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}

class Form2 extends StatefulWidget {
  const Form2({
    Key? key,
    required this.onButtonPress,
  }) : super(key: key);

  final VoidCallback onButtonPress;

  @override
  _Form2State createState() => _Form2State();
}

class _Form2State extends State<Form2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 25,
        ),
        const Text(
          'ID Proof',
          style: TextStyle(
              fontFamily: 'Nunito', fontSize: 14, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text('Aadhar Card Photo', style: kFormFieldHintTextStyle),
        const SizedBox(
          height: 12,
        ),
        const Attachment(),
        const SizedBox(
          height: 25,
        ),
        const Text('Aadhar Card Number', style: kFormFieldHintTextStyle),
        const SizedBox(
          height: 12,
        ),
        TextField(
          style: kFormFieldTextStyle,
          decoration: kTextFieldDecoration.copyWith(hintText: '000000'),
        ),
        const SizedBox(
          height: 25,
        ),
        const Text('Full Name', style: kFormFieldHintTextStyle),
        const SizedBox(
          height: 12,
        ),
        TextField(
          style: kFormFieldTextStyle,
          decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Name'),
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
          decoration: kTextFieldDecoration.copyWith(
              hintText: 'DD/MM/YYYY',
              suffixIcon: GestureDetector(
                child: const Icon(Icons.calendar_today_rounded),
              )),
        ),
        const SizedBox(
          height: 25,
        ),
        const Text('Pan Card Photo', style: kFormFieldHintTextStyle),
        const SizedBox(
          height: 12,
        ),
        const Attachment(),
        const SizedBox(
          height: 25,
        ),
        const Text('Pan Card Number', style: kFormFieldHintTextStyle),
        const SizedBox(
          height: 12,
        ),
        TextField(
          style: kFormFieldTextStyle,
          decoration: kTextFieldDecoration.copyWith(hintText: '000000'),
        ),
        const SizedBox(
          height: 25,
        ),
        const Text('Full Name', style: kFormFieldHintTextStyle),
        const SizedBox(
          height: 12,
        ),
        TextField(
          style: kFormFieldTextStyle,
          decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Name'),
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
          decoration: kTextFieldDecoration.copyWith(
              hintText: 'DD/MM/YYYY',
              suffixIcon: GestureDetector(
                child: const Icon(Icons.calendar_today_rounded),
              )),
        ),
        const SizedBox(
          height: 25,
        ),
        Center(
            child: RoundedButton(
                colour: const Color(0xffCE004A),
                title: 'Next',
                width: 260,
                onPressed: widget.onButtonPress)),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}

enum DeliveryPartnerType {
  group,
  self,
  company,
}

class Form3 extends StatefulWidget {
  const Form3({
    Key? key,
    required this.onButtonPress,
  }) : super(key: key);

  final VoidCallback onButtonPress;

  @override
  State<Form3> createState() => _Form3State();
}

class _Form3State extends State<Form3> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int stackIndex = 0;
  DeliveryPartnerType _deliveryPartnerType = DeliveryPartnerType.self;
  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        TabBar(
          unselectedLabelColor: Colors.black,
          labelColor: const Color(0xffCE004A),
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Cycle',
            ),
            Tab(
              text: 'Bike',
            ),
            Tab(
              text: 'Walk',
            ),
          ],
        ),
        SizedBox(
          height: 1000,
          child: TabBarView(controller: _tabController, children: [
            Container(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 26,
                ),
                const Text('Driving License Photo',
                    style: kFormFieldHintTextStyle),
                const SizedBox(
                  height: 12,
                ),
                const Attachment(),
                const SizedBox(
                  height: 25,
                ),
                const Text('RC Book Photo', style: kFormFieldHintTextStyle),
                const SizedBox(
                  height: 12,
                ),
                const Attachment(),
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
                const Text('Locality', style: kFormFieldHintTextStyle),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  style: kFormFieldTextStyle,
                  decoration:
                      kTextFieldDecoration.copyWith(hintText: 'Enter Locality'),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text('Police Verification Certificate Photo',
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
                            value: DeliveryPartnerType.self,
                            groupValue: _deliveryPartnerType,
                            onChanged: (value) {
                              _deliveryPartnerType =
                                  value as DeliveryPartnerType;
                              setState(() {
                                stackIndex = 0;
                              });
                            }),
                        const Text(
                          'Self',
                          style: kFormFieldTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            activeColor: const Color(0xffCE004A),
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => const Color(
                                    0xffCE004A)), //fillColor: Color(0xffCE004A),
                            value: DeliveryPartnerType.company,
                            groupValue: _deliveryPartnerType,
                            onChanged: (value) {
                              _deliveryPartnerType =
                                  value as DeliveryPartnerType;
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
                    const SizedBox()
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                stackIndex == 0
                    ? Column(
                        children: [
                          const Attachment(),
                          const SizedBox(
                            height: 25,
                          ),
                          Center(
                              child: RoundedButton(
                                  colour: const Color(0xffCE004A),
                                  title: 'Submit',
                                  width: 260,
                                  onPressed: widget.onButtonPress)),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Additional Charge',
                              style: kFormFieldHintTextStyle),
                          const SizedBox(
                            height: 12,
                          ),
                          TextField(
                            style: kFormFieldTextStyle,
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Enter..'),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Center(
                              child: RoundedButton(
                                  colour: const Color(0xffCE004A),
                                  title: 'Payment',
                                  width: 260,
                                  onPressed: widget.onButtonPress)),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
            Container(),
          ]),
        )
      ],
    );
  }
}

class ProgressNode extends StatelessWidget {
  const ProgressNode({
    Key? key,
    required this.isCompleted,
    required this.isFocused,
    required this.nodeNumber,
    required this.onPressed,
    required this.nodeTitle,
  }) : super(key: key);

  final bool isCompleted;
  final bool isFocused;
  final int nodeNumber;
  final VoidCallback onPressed;
  final String nodeTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Column(
          children: [
            Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xffCE004A)),
                  color: isFocused ? const Color(0xffCE004A) : Colors.white,
                ),
                child: Center(
                    child: isCompleted
                        ? Icon(Icons.check,
                            color: isFocused
                                ? Colors.white
                                : const Color(0xffCE004A))
                        : Text(
                            '$nodeNumber',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                color: isFocused
                                    ? Colors.white
                                    : const Color(0xffCE004A),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ))),
            const SizedBox(
              height: 4,
            ),
            Text(
              nodeTitle,
              style: const TextStyle(fontSize: 10),
            )
          ],
        ));
  }
}
