import 'package:flutter/material.dart';

import '../../components/rounded_button.dart';

class MemberAddedSuccessfullyScreen extends StatelessWidget {
  const MemberAddedSuccessfullyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Image(image: AssetImage('assets/images/memberAddedSuccessfully.png'),),
          Text('Member Added Successfully', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22, fontFamily: 'Nunito'),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 22),
            child: Center(child: Text('Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, fontFamily: 'Nunito'),)),
          ),
          Center(child: RoundedButton(width: 260,colour: Color(0xffCE004A), title: 'Done', onPressed: (){})),
          const SizedBox(
            height: 45,
          ),
        ],
      ),
    );
  }
}