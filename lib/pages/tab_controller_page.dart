import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import '../services/constants.dart';
import 'all_products_page.dart';
import 'only_favorites_page.dart';

class TabControllerPage extends StatefulWidget {


  const TabControllerPage({
    Key? key
  }) : super(key: key);

  @override
  State<TabControllerPage> createState() => _TabControllerPageState();
}

class _TabControllerPageState extends State<TabControllerPage> {


  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        child: DefaultTabController(
          length: 2,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSize.paddingSize10,
                  right: AppSize.paddingSize10,
                  top: AppSize.paddingSize10,
                ),
                child: SegmentedTabControl(
                  // Customization of widget
                  radius: const Radius.circular(20),
                  backgroundColor: AppColors.greyColor.shade300,
                  indicatorColor: AppColors.amberColor,
                  tabTextColor: AppColors.greyColor,
                  selectedTabTextColor: AppColors.blackColor,
                  squeezeIntensity: 2,
                  height: 45,
                  tabPadding: const EdgeInsets.symmetric(horizontal: 8),
                  textStyle: Theme.of(context).textTheme.bodyText1,
                  tabs: [
                    const SegmentTab(
                      label: 'Barchasi',
                      color: AppColors.amberColor,
                    ),
                    SegmentTab(
                      label: 'Sevimli',
                      backgroundColor: AppColors.greyColor.shade300,
                      selectedTextColor: AppColors.blackColor,
                      textColor: AppColors.black26Color,
                    ),
                  ],
                ),
              ),
              // Sample pages
              const Padding(
                padding: EdgeInsets.only(top: 70, bottom: 5),
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    AllProductsPage(),
                    OnlyFavoritesPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}