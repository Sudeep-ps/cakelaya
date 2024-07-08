import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  static const routename = 'categories';
  final List<String> unselected;
  final List<String> selected;
  final Function(List<String>) updateSelectedCategories;
  final Function(List<String>) updateUnselectedCategories;

  const Categories({
    super.key,
    required this.unselected,
    required this.selected,
    required this.updateSelectedCategories,
    required this.updateUnselectedCategories,
  });

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late List<String> unselectedCategory;
  late List<String> selectedCategory;

  @override
  void initState() {
    super.initState();
    unselectedCategory = List.from(widget.unselected);
    selectedCategory = List.from(widget.selected);
  }

  void selecteCategory(String category) {
    setState(() {
      unselectedCategory.remove(category);
      selectedCategory.add(category);
      widget.updateSelectedCategories(selectedCategory);
      widget.updateUnselectedCategories(unselectedCategory);
    });
  }

  void unSelecteCategory(String category) {
    setState(() {
      selectedCategory.remove(category);
      unselectedCategory.add(category);
      widget.updateSelectedCategories(selectedCategory);
      widget.updateUnselectedCategories(unselectedCategory);
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
        title: const Text('CATEGORIES'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Categories Selected :',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              Flexible(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 200),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: selectedCategory.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        minTileHeight: 55,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.grey.shade200, width: 2),
                            borderRadius: BorderRadius.circular(8)),
                        horizontalTitleGap: 10.0,
                        minVerticalPadding: 4,
                        onTap: () {},
                        dense: false,
                        title: Text(selectedCategory[index],
                            style: const TextStyle(
                                color: Color.fromRGBO(255, 22, 22, 1))),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.cancel_outlined,
                            size: 19,
                          ),
                          color: const Color.fromRGBO(255, 22, 22, 1),
                          onPressed: () {
                            unSelecteCategory(selectedCategory[index]);
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Other Categories :',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: unselectedCategory.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      minTileHeight: 55,
                      shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: Colors.grey.shade200, width: 2),
                          borderRadius: BorderRadius.circular(8)),
                      horizontalTitleGap: 10.0,
                      minVerticalPadding: 4,
                      onTap: () {},
                      dense: false,
                      title: Text(unselectedCategory[index],
                          style: const TextStyle(
                              color: Color.fromRGBO(255, 22, 22, 1))),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.add,
                          size: 19,
                        ),
                        color: const Color.fromRGBO(255, 22, 22, 1),
                        onPressed: () {
                          selecteCategory(unselectedCategory[index]);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
