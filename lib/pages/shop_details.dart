import 'package:cakelaya/widgets/add_image.dart';
import 'package:cakelaya/widgets/custom_textbutton.dart';
import 'package:flutter/material.dart';

class ShopDetails extends StatefulWidget {
  const ShopDetails({super.key});

  @override
  State<ShopDetails> createState() => _ManageShopScreenState();
}

class _ManageShopScreenState extends State<ShopDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Add your back button functionality here
          },
        ),
        title: const Text('MANAGE SHOP'),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: const Text('Product Details'),
                onTap: () {
                  Navigator.of(context).pushNamed('product_details');
                },
              )
            ];
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shop Name:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Container(
              height: 33,
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Name of the Shop', border: InputBorder.none),
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(98, 98, 98, 1)),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const AddImage(
              labeltext: 'Shop Display Photo',
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: CustomTextbutton(
                        text: 'Manage Shop Items',
                        radius: 20,
                        onPressed: pushNamed)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void pushNamed() {
    Navigator.of(context).pushNamed('item_screen');
  }
}
