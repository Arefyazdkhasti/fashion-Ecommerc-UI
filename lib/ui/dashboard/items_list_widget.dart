import 'dart:ffi';

import 'package:fashion_ecommerce/common/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/model/item_entity.dart';
import '../itemDetail/item_detail_screen.dart';
import '../light_theme_color.dart';

class ItemWidgets extends StatelessWidget {
  const ItemWidgets({super.key, required this.items});

  final List<ItemEntity> items;

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
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListItemWidget(item: items[index], picWidth: picWidth, picHeight: picHeight,);
            },
          )
        ]),
      ),
    );
  }
}

class ListItemWidget extends StatefulWidget {

  final ItemEntity item;
  final double picWidth;
  final double picHeight;

  const ListItemWidget({super.key, required this.item, required this.picWidth, required this.picHeight}); 

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Hero(
      tag: "mainItemImage",
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
              builder: (context) =>
                  ItemDetailScreen(item: widget.item)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    widget.item.image,
                    width: widget.picWidth,
                    height: widget.picHeight,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.item.isLiked =
                              !widget.item.isLiked;
                        });
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(widget.item.isLiked
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
              child: Text(widget.item.title,
                  style: themeData.textTheme.bodyMedium?.copyWith(
                      fontSize: 24, color: LightThemeColor.secondaryTextColor)),
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
                    child: Text(widget.item.price.toCurrency(),
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
  }
}
