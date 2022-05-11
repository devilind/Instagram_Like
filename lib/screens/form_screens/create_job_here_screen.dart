import 'package:flutter/material.dart';

import '../../components/rounded_button.dart';

class CreateJobHereScreen extends StatelessWidget {
  const CreateJobHereScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 39,
            ),

            Image(image: AssetImage('assets/images/createJobHere.png'),),
            const SizedBox(
              height: 39,
            ),

            Text('Create Job Here', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24, fontFamily: 'Nunito'),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 5),
              child: Text('Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.',textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, fontFamily: 'Nunito'),),
            ),
            const SizedBox(
              height: 24,
            ),
            Center(child: RoundedButton(width: 260,colour: Color(0xffCE004A), title: 'Registration', onPressed: (){})),
          ],
        ),
      ),
    );
  }
}