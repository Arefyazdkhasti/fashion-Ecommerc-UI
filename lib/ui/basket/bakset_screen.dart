import 'package:fashion_ecommerce/data/model/basket_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/utils.dart';
import '../light_theme_color.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0), child: AppBar()),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
        child: Column(children: [
          const _ToolBar(),
          _BasketItemWidget(items: BasketEntity.fakeBasketItems)
        ]),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(54), topRight: Radius.circular(54))),
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Order Info",
                    style: themeData.textTheme.bodyMedium?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: LightThemeColor.primaryTextColor),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bright beret",
                        style: themeData.textTheme.bodyMedium?.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: LightThemeColor.primaryTextColor),
                      ),
                      Text(
                        "1 item",
                        style: themeData.textTheme.bodyMedium?.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: LightThemeColor.primaryTextColor
                                .withOpacity(0.8)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery",
                        style: themeData.textTheme.bodyMedium?.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: LightThemeColor.primaryTextColor),
                      ),
                      Text(
                        "10.00",
                        style: themeData.textTheme.bodyMedium?.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price",
                        style: themeData.textTheme.bodyMedium?.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: LightThemeColor.primaryTextColor),
                      ),
                      Text(
                        "750.00",
                        style: themeData.textTheme.bodyMedium?.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                left: 100,
                right: 100,
                child: FloatingActionButton.extended(
                    onPressed: () {},
                    backgroundColor: LightThemeColor.secondaryColor,
                    label: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Placing an Order",
                        style: themeData.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _BasketItemWidget extends StatefulWidget {
  const _BasketItemWidget({
    super.key,
    required this.items,
  });

  final List<BasketEntity> items;

  @override
  State<_BasketItemWidget> createState() => _BasketItemWidgetState();
}

class _BasketItemWidgetState extends State<_BasketItemWidget> {
  @override
  Widget build(BuildContext context) {
    final picWidth = (MediaQuery.of(context).size.width - 48) / 5;
    final picHeight = picWidth * 1.5 - 20;
    final ThemeData themeData = Theme.of(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6 - 100,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: defaultScrollPhysics,
          itemCount: widget.items.length,
          itemBuilder: (contect, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Checkbox(
                    value: widget.items[index].isChecked,
                    splashRadius: 20,
                    checkColor: Colors.white,
                    activeColor: LightThemeColor.secondaryColor,
                    shape: const CircleBorder(),
                    onChanged: (value) {
                      setState(() {
                        widget.items[index].isChecked =
                            !widget.items[index].isChecked;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      widget.items[index].image,
                      width: picWidth,
                      height: picHeight,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.items[index].title,
                            textAlign: TextAlign.left,
                            style: themeData.textTheme.bodyMedium?.copyWith(
                                fontSize: 24,
                                color: LightThemeColor.secondaryTextColor)),
                        Text("(${widget.items[index].size.name})",
                            textAlign: TextAlign.left,
                            style: themeData.textTheme.bodyMedium?.copyWith(
                                fontSize: 20,
                                color: LightThemeColor.secondaryTextColor)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          widget.items[index].price.toCurrency(),
                          style: themeData.textTheme.bodyMedium?.copyWith(
                              fontSize: 22,
                              color: LightThemeColor.primaryTextColor),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoButton(
                          child: const Icon(
                            CupertinoIcons.minus,
                            color: LightThemeColor.iconColos,
                          ),
                          onPressed: () {
                            setState(() {
                              if (widget.items[index].count > 1) {
                                widget.items[index].count -= 1;
                              }
                            });
                          }),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(widget.items[index].count.toString(),
                            style: themeData.textTheme.bodyMedium?.copyWith(
                                fontSize: 22,
                                color: LightThemeColor.primaryTextColor)),
                      ),
                      CupertinoButton(
                          child: const Icon(
                            CupertinoIcons.plus,
                            color: LightThemeColor.iconColos,
                          ),
                          onPressed: () {
                            setState(() {
                              widget.items[index].count += 1;
                            });
                          })
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}

class _ToolBar extends StatelessWidget {
  const _ToolBar({
    super.key,
  });

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
            child: Text("Basket",
                textAlign: TextAlign.center,
                style: themeData.textTheme.titleLarge?.copyWith(
                    color: LightThemeColor.primaryTextColor, fontSize: 24)),
          ),
        ),
        const SizedBox(
          width: 48,
        )
      ],
    );
  }
}
