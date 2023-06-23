import 'package:fashion_ecommerce/data/model/category_entity.dart';
import 'package:fashion_ecommerce/data/model/item_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/utils.dart';
import '../itemDetail/item_detail_screen.dart';
import '../light_theme_color.dart';

class CategoryScren extends StatelessWidget {
  const CategoryScren({super.key, required this.category});

  final CategoryEntity category;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
            child: Column(children: [
              _ToolBar(categoryGrpup: category),
              Text("${ItemEntity.fakeListItem.length.toString()} items...",
                  style: themeData.textTheme.bodyMedium?.copyWith(
                      color: LightThemeColor.secondaryTextColor, fontSize: 20)),
              _ItemsList(items: ItemEntity.fakeListItem)
            ])),
      ),
    );
  }
}

class _ToolBar extends StatelessWidget {
  const _ToolBar({
    super.key,
    required this.categoryGrpup,
  });

  final CategoryEntity categoryGrpup;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Row(
      children: [
        CupertinoButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: Colors.black,
            )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(categoryGrpup.title,
                textAlign: TextAlign.center,
                style: themeData.textTheme.titleLarge?.copyWith(
                    color: LightThemeColor.primaryTextColor, fontSize: 24)),
          ),
        ),
        CupertinoButton(
            onPressed: () {},
            child: const Icon(
              CupertinoIcons.sort_down,
              size: 24,
              color: Colors.black,
            ))
      ],
    );
  }
}

class _ItemsList extends StatelessWidget {
  const _ItemsList({super.key, required this.items});

  final List<ItemEntity> items;

  @override
  Widget build(BuildContext context) {
    final picWidth = (MediaQuery.of(context).size.width - 48) / 3;
    final picHeight = picWidth * 1.5 - 20;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListItemWidget(
          item: items[index],
          picWidth: picWidth,
          picHeight: picHeight,
        );
      },
    );
  }
}

class ListItemWidget extends StatefulWidget {
  final ItemEntity item;
  final double picWidth;
  final double picHeight;

  const ListItemWidget(
      {super.key,
      required this.item,
      required this.picWidth,
      required this.picHeight});

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final heartIcon =
        widget.item.isLiked ? CupertinoIcons.heart_fill : CupertinoIcons.heart;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
              builder: (context) => ItemDetailScreen(item: widget.item)));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: "mainItemImage",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      widget.item.image,
                      width: widget.picWidth,
                      height: widget.picHeight,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.item.isLiked = !widget.item.isLiked;
                        });
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Icon(
                          heartIcon,
                          size: 18,
                        ),
                      ),
                    ))
              ],
            ),
            const SizedBox(width: 16,),
            Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 64 - widget.picWidth - 16,
                  child: Text(widget.item.title,
                      textAlign: TextAlign.left,
                      style: themeData.textTheme.bodyMedium?.copyWith(
                          fontSize: 24,
                          color: LightThemeColor.secondaryTextColor)),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 64 - widget.picWidth - 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            widget.item.price.toCurrency(),
                            style: themeData.textTheme.bodyMedium?.copyWith(
                                fontSize: 24,
                                color: LightThemeColor.primaryTextColor),
                          )),
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
            )
          ],
        ),
      ),
    );
  }
}
