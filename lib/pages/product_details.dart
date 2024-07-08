import 'package:cakelaya/widgets/add_image.dart';
import 'package:cakelaya/widgets/custom_textbutton.dart';
import 'package:cakelaya/widgets/text_area.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  static const routename = 'product_details';
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final List<String> vegNonveg = ['Veg', 'Non Veg'];
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('PRODUCT DETAILS'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Product Name:',
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(98, 98, 98, 1)),
              ),
              linespace(),
              Container(
                height: 40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color.fromRGBO(0, 0, 0, 0.2)),
                    borderRadius: BorderRadius.circular(8)),
                child: const TextField(
                  decoration: InputDecoration(
                      hintText: 'Enter Product Name', border: InputBorder.none),
                ),
              ),
              const TextArea(
                labeltext: 'Description:',
                hinttext: 'Write Product Description!',
              ),
              const TextArea(
                  labeltext: 'Serving Information:',
                  hinttext: 'Write Serving Information!'),
              const TextArea(labeltext: 'Note:', hinttext: 'Write Note!'),
              linespace(),
              const Text(
                'Flavour Chart:',
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(98, 98, 98, 1)),
              ),
              linespace(),
              CustomTextbutton(
                  text: 'Edit List', radius: 8, onPressed: pushNamed),
              linespace(),
              const Text(
                'Size & Price Chart:',
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(98, 98, 98, 1)),
              ),
              linespace(),
              CustomTextbutton(text: 'Edit List', radius: 8, onPressed: () {}),
              linespace(),
              const Text(
                'Veg/Non Veg:',
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(98, 98, 98, 1)),
              ),
              linespace(),
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color.fromRGBO(0, 0, 0, 0.2)),
                    borderRadius: BorderRadius.circular(8)),
                child: DropdownButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                  ),
                  isExpanded: true,
                  underline: Container(),
                  hint: const Text(
                    'Select Food Type',
                    style: TextStyle(fontSize: 16),
                  ),
                  value: selectedItem,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedItem = newValue!;
                    });
                  },
                  items:
                      vegNonveg.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              linespace(),
              const AddImage(
                labeltext: 'Product Image',
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomTextbutton(
                      text: 'Save', radius: 20, onPressed: () {}))
            ],
          ),
        ),
      ),
    );
  }

  void pushNamed() {
    Navigator.of(context).pushNamed('flavour-chart');
  }

  Widget linespace() {
    return const SizedBox(
      height: 10,
    );
  }
}
