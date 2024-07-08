import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  final String labeltext;
  final String hinttext;
  const TextArea({super.key, required this.labeltext, required this.hinttext});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          labeltext,
          style: const TextStyle(
              fontSize: 16, color: Color.fromRGBO(98, 98, 98, 1)),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.2)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 1, 15, 10),
            child: TextField(
              minLines: 3,
              maxLines: 3,
              maxLength: 500,
              decoration: InputDecoration(
                hintText: hinttext,
                border: InputBorder.none,
              ),
            ),
          ),
        )
      ],
    );
  }
}
