import 'package:cakelaya/widgets/custom_textbutton.dart';
import 'package:flutter/material.dart';

class FlavorForm extends StatefulWidget {
  static const routename = 'flavour-chart';

  const FlavorForm({super.key});
  @override
  FlavorFormState createState() => FlavorFormState();
}

class FlavorFormState extends State<FlavorForm> {
  final List<TextEditingController> _flavorControllers = [
    TextEditingController(),
    TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flavor Chart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Column(
            children: _buildFlavorFields(),
          ),
          // Add a spacer to push the button down

          CustomTextbutton(
              text: 'Insert ANother Flavour',
              radius: 8,
              onPressed: () {
                setState(() {
                  // Add a new TextEditingController to the list
                  _flavorControllers.add(TextEditingController());
                });
              })
        ]),
      ),
    );
  }

  List<Widget> _buildFlavorFields() {
    List<Widget> fields = [];
    for (var controller in _flavorControllers) {
      fields.add(Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.2)),
              borderRadius: BorderRadius.circular(8)),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
                hintText: 'Enter Flavor', border: InputBorder.none),
          ),
        ),
        const SizedBox(
          height: 5,
        )
      ]));
    }
    return fields;
  }
}
