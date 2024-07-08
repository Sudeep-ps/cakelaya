import 'package:cakelaya/pages/categories.dart';
import 'package:cakelaya/widgets/custom_textbutton.dart';
import 'package:flutter/material.dart';

class ManageShopItem extends StatefulWidget {
  static const routename = 'item_screen';
  const ManageShopItem({super.key});

  @override
  State<ManageShopItem> createState() => _ManageShopItemState();
}

class _ManageShopItemState extends State<ManageShopItem> {
  late List<String> selectedCategories = [
    'Burger',
    'Sandwich',
  ];
  late List<String> unselectedCategories = [
    'Cakes',
    'Pizza',
    'Roti',
    'Momos',
    'Cutlate',
    'Puffs'
  ];

  void updateSelectedCategories(List<String> newSelected) {
    setState(() {
      selectedCategories = List.from(newSelected);
    });
  }

  void updateUnselectedCategories(List<String> newUnselected) {
    setState(() {
      unselectedCategories = List.from(newUnselected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('MANAGE SHOP ITEMS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              minTileHeight: 40,
              tileColor: Colors.grey[300],
              title: const Text(
                'Total Items Listed :',
                style: TextStyle(fontSize: 16),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              trailing: Text(
                '${selectedCategories.length}',
                style: const TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextbutton(
                text: 'Add Product Category', radius: 8, onPressed: pushNamed),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Category Selected :',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 6,
            ),
            Flexible(
                child: ListView.separated(
              itemCount: selectedCategories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)),
                  title: Text(
                    selectedCategories[index],
                    style:
                        const TextStyle(color: Color.fromRGBO(98, 98, 98, 1)),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      color: Color.fromRGBO(98, 98, 98, 1)),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
            ))
          ],
        ),
      ),
    );
  }

  void pushNamed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Categories(
          unselected: unselectedCategories,
          selected: selectedCategories,
          updateSelectedCategories: updateSelectedCategories,
          updateUnselectedCategories: updateUnselectedCategories,
        ),
      ),
    );
  }
}
