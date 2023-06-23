import 'package:fashion_ecommerce/common/utils.dart';
import 'package:fashion_ecommerce/ui/light_theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/model/category_entity.dart';

class CategoriesScren extends StatefulWidget {
  const CategoriesScren({super.key});

  @override
  State<CategoriesScren> createState() => _CategoriesScrenState();
}

class _CategoriesScrenState extends State<CategoriesScren>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
          child: Column(
            children: [
              _ToolBar(themeData: themeData),
              const SizedBox(
                height: 32,
              ),
              _TabLayout(tabController: _tabController),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _TabBaritemWidget(
                        categories: CategoryEntity.fakeCategories),
                    _TabBaritemWidget(categories: CategoryEntity.fakeCategories)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class _TabBaritemWidget extends StatelessWidget {
  const _TabBaritemWidget({
    super.key,
    required this.categories,
  });
  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: defaultScrollPhysics,
          itemCount: categories.length,
          itemBuilder: (contect, index) {
            if (index == 0) {
              return Container();
            } else {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 8, 16),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          color: LightThemeColor.secondaryTextColor
                              .withOpacity(0.15),
                          borderRadius: BorderRadius.circular(24)),
                      child: categories[index].image,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(categories[index].title,
                            style: themeData.textTheme.bodyMedium?.copyWith(
                                color: LightThemeColor.primaryTextColor,
                                fontSize: 20)),
                      ),
                    ),
                     const SizedBox(
                      width: 16,
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16, color: LightThemeColor.iconColos,),
                    const SizedBox(
                      width: 16,
                    ),
                  ]),
                ),
              );
            }
          }),
    );
  }
}

class _TabLayout extends StatelessWidget {
  const _TabLayout({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 65,
          child: TabBar(
            // disable ripple effect
            splashFactory: NoSplash.splashFactory,
            physics: defaultScrollPhysics,
            enableFeedback: true,
            //change size inorder to fit the item size
            indicatorSize: TabBarIndicatorSize.tab,
            controller: _tabController,
            splashBorderRadius: BorderRadius.circular(12),
            // give the indicator a decoration (color and border radius)
            indicator: BoxDecoration(
                border: Border.all(color: LightThemeColor.secondaryColor),
                borderRadius: BorderRadius.circular(12)),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black,
            tabs: const [
              Tab(
                text: 'Wonam',
                height: 65,
              ),
              Tab(
                text: 'Man',
                height: 65,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ToolBar extends StatelessWidget {
  const _ToolBar({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
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
            child: Text("Categories",
                textAlign: TextAlign.center,
                style: themeData.textTheme.titleLarge?.copyWith(
                    color: LightThemeColor.primaryTextColor, fontSize: 24)),
          ),
        ),
        Stack(
          children: [
            CupertinoButton(
                onPressed: () {},
                child: const Icon(
                  CupertinoIcons.bag_fill,
                  size: 24,
                  color: Colors.black,
                )),
            Positioned(
              right: 12,
              bottom: 12,
              child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                      color: LightThemeColor.primaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                        child: Text("2",
                            style: themeData.textTheme.bodyMedium
                                ?.copyWith(fontSize: 12, color: Colors.black))),
                  )),
            )
          ],
        )
      ],
    );
  }
}
