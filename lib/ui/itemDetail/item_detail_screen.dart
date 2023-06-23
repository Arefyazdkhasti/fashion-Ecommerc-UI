import 'package:fashion_ecommerce/common/utils.dart';
import 'package:fashion_ecommerce/data/model/item_entity.dart';
import 'package:fashion_ecommerce/ui/light_theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({super.key, required this.item});

  final ItemEntity item;

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    bool isDescriptionVisible = true;

    return Scaffold(
      appBar: null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: LightThemeColor.secondaryColor,
          label: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 16),
              const Icon(CupertinoIcons.add, size: 20),
              const SizedBox(width: 16),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "Add To Basket",
                  style: themeData.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          )),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: "mainItemImage",
                    child: Image.asset(
                      widget.item.image,
                      width: MediaQuery.of(context).size.width,
                      height: 450,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 36,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 24,
                            )),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                widget.item.isLiked = !widget.item.isLiked;
                              });
                            },
                            icon: Icon(widget.item.isLiked
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.heart))
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                  top: 375,
                  right: 0,
                  left: 0,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Expanded(
                        child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                          color: LightThemeColor.backgroundColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(36),
                              topRight: Radius.circular(36))),
                    )),
                  )),
            ],
          ),
          Container(
            transform: Matrix4.translationValues(
                0.0, -50.0, 0.0), // act as nagative padding in android kotlin
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(36, 0, 36, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.item.title,
                          style: themeData.textTheme.titleLarge?.copyWith(
                              color: LightThemeColor.primaryTextColor,
                              fontSize: 30)),
                      Text(widget.item.price.toCurrency(),
                          style: themeData.textTheme.titleLarge?.copyWith(
                              color: LightThemeColor.primaryTextColor,
                              fontSize: 32,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(36, 0, 36, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Description",
                          style: themeData.textTheme.titleLarge?.copyWith(
                              color: LightThemeColor.primaryTextColor,
                              fontSize: 20)),
                      CupertinoButton(
                          child: RotatedBox(
                              quarterTurns: isDescriptionVisible ? 3 : 0,
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: LightThemeColor.iconColos,
                                size: 16,
                              )),
                          onPressed: () {
                            isDescriptionVisible = !isDescriptionVisible;
                          })
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                if (isDescriptionVisible)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(36, 0, 36, 0),
                    child: Text(widget.item.description,
                        style: themeData.textTheme.titleMedium?.copyWith(
                            color: LightThemeColor.secondaryTextColor,
                            fontSize: 20)),
                  ),
                const SizedBox(
                  height: 36,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(36, 0, 36, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Choose Size",
                        style: themeData.textTheme.titleLarge?.copyWith(
                          color: LightThemeColor.primaryTextColor,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 36),
                  child: SizedBox(
                    height: 70,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: defaultScrollPhysics,
                        itemCount: widget.item.size.length,
                        itemBuilder: (contect, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: LightThemeColor.secondaryTextColor
                                      .withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(35)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    widget.item.size[index].name,
                                    style: themeData.textTheme.titleMedium?.copyWith(
                                    color: LightThemeColor.primaryTextColor,
                                    fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

/* , */