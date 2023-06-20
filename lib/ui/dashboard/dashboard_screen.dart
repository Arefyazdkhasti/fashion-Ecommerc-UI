import 'package:fashion_ecommerce/data/model/category_entity.dart';
import 'package:fashion_ecommerce/ui/itemDetail/item_detail_screen.dart';
import 'package:fashion_ecommerce/ui/light_theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/utils.dart';
import '../../data/model/item_entity.dart';

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
                    return _ItemWidgets(items: ItemEntity.fakeListItem);
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

class _ItemWidgets extends StatefulWidget {
  const _ItemWidgets({super.key, required this.items});

  final List<ItemEntity> items;

  @override
  State<_ItemWidgets> createState() => _ItemWidgetsState();
}

class _ItemWidgetsState extends State<_ItemWidgets> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final picWidth = (MediaQuery.of(context).size.width - 48) / 2;
    final picHeight = picWidth * 1.5 - 20;
    final ratio = picHeight / picWidth;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('New Items',
              textAlign: TextAlign.start,
              style: themeData.textTheme.titleLarge?.copyWith(fontSize: 32)),
          const SizedBox(
            height: 16,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: ratio / 2.9),
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return Hero(
                tag: "mainItemImage",
                child: InkWell(
                  borderRadius: BorderRadius.circular(16.0),
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                        builder: (context) =>
                            ItemDetailScreen(item: widget.items[index])));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.asset(
                              widget.items[index].image,
                              width: picWidth,
                              height: picHeight,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                              top: 8,
                              right: 8,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    widget.items[index].isLiked =
                                        !widget.items[index].isLiked;
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Icon(widget.items[index].isLiked
                                      ? CupertinoIcons.heart_fill
                                      : CupertinoIcons.heart),
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(widget.items[index].title,
                            style: themeData.textTheme.bodyMedium?.copyWith(
                                fontSize: 24,
                                color: LightThemeColor.secondaryTextColor)),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(widget.items[index].price.toCurrency(),
                                  style: themeData.textTheme.bodyMedium?.copyWith(
                                      fontSize: 24,
                                      color: LightThemeColor.primaryTextColor)),
                            ),
                            CupertinoButton(
                                onPressed: () {},
                                child: const Icon(
                                  CupertinoIcons.add,
                                  size: 24,
                                  color: LightThemeColor.iconColos,
                                )),
                            
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ]),
      ),
    );
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
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: categories[index].image,
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
