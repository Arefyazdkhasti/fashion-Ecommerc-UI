import 'package:fashion_ecommerce/data/model/category_entity.dart';
import 'package:fashion_ecommerce/ui/categories/categories_screen.dart';
import 'package:fashion_ecommerce/ui/dashboard/items_list_widget.dart';
import 'package:fashion_ecommerce/ui/itemDetail/item_detail_screen.dart';
import 'package:fashion_ecommerce/ui/light_theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/utils.dart';
import '../../data/model/item_entity.dart';
import '../category/category_screen.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = FocusNode();

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              physics: defaultScrollPhysics,
              itemCount: 5,
              itemBuilder: (contect, index) {
                switch (index) {
                  case 0:
                    return _SearchWidget(myFocusNode: myFocusNode);
                  case 1:
                    return _CategoryWidget(
                        categories: CategoryEntity.fakeCategories);
                  case 2:
                    return const _DiscountWidget();
                  case 3:
                    return ItemWidgets(items: ItemEntity.fakeListItem);
                  case 4:
                    return const SizedBox(
                      height: 60,
                    );
                  default:
                    return Container();
                }
              }),
        ));
  }
}

class _DiscountWidget extends StatelessWidget {
  const _DiscountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            width: 16,
          ),
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
                color: LightThemeColor.backgroundColor,
                borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.discount,
                size: 24, color: LightThemeColor.primaryTextColor),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('50% OFF',
                    style: themeData.textTheme.titleLarge?.copyWith(
                        color: LightThemeColor.primaryTextColor, fontSize: 28)),
                Text('on all womans shoes',
                    style: themeData.textTheme.titleMedium?.copyWith(
                        color: LightThemeColor.secondaryTextColor,
                        fontSize: 18))
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          const Icon(Icons.arrow_forward_ios,
              color: LightThemeColor.iconColos, size: 24),
          const SizedBox(
            width: 16,
          ),
        ]),
      ),
    );
  }
}

class _CategoryWidget extends StatelessWidget {
  const _CategoryWidget({
    super.key,
    required this.categories,
  });
  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return SizedBox(
      height: 160,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: defaultScrollPhysics,
          itemCount: categories.length,
          itemBuilder: (contect, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
              child: Column(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {
                      if (index == 0) {
                        //navigate to Categories Screen
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => const CategoriesScren()));
                      } else {
                        //navigate to Category Screen
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) => CategoryScren(category: categories[index])));
                      }
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      child: categories[index].image,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(categories[index].title,
                      textAlign: TextAlign.center,
                      style: themeData.textTheme.bodyMedium?.copyWith(
                          color: LightThemeColor.primaryTextColor,
                          fontSize: 20))
                ],
              ),
            );
          }),
    );
  }
}

class _SearchWidget extends StatelessWidget {
  const _SearchWidget({super.key, required this.myFocusNode});

  final FocusNode myFocusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
                focusNode: myFocusNode,
                cursorColor: LightThemeColor.primaryColor,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    suffixIcon: Icon(CupertinoIcons.search),
                    labelText: 'Search',
                    labelStyle:
                        TextStyle(color: LightThemeColor.secondaryTextColor),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: LightThemeColor.secondaryColor),
                        borderRadius:
                            BorderRadius.all(Radius.circular(12.0))))),
          ),
          const SizedBox(
            width: 8,
          ),
          CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.sort_down,
                size: 32,
                color: LightThemeColor.secondaryColor,
              ))
        ],
      ),
    );
  }
}
