import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({
    Key? key,
    required this.Items,
  }) : super(key: key);

  final List<String> Items;

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {

  String? dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 48,
      padding: EdgeInsets.only(left: 7, right: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(width: 1, color: Colors.grey.shade300),
      ),
      child: DropdownButton<String>(
        value: dropDownValue,
        hint: Text(
          'Select',
          style: TextStyle(
            fontFamily: 'Nunito',
              fontSize: 14,
              color: Color(0xffB1B1B3),
              fontWeight: FontWeight.w400),
        ),
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Color(0xffB1B1B3),
          size: 26,
        ),
        elevation: 10,
        style: const TextStyle(
          fontFamily: 'Nunito',
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        isExpanded: true,
        underline: SizedBox(
          height: 0,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropDownValue = newValue!;
          });
        },
        items: widget.Items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
