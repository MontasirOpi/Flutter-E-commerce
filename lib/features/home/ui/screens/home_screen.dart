import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/app/assets_path.dart';
import 'package:ecommerce/features/home/ui/widgets/app_bar_icon_button.dart';
import 'package:ecommerce/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:ecommerce/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              ProductSearchBar(
                controller: _searchBarController,
              ),
              const SizedBox(height: 16),
              HomeCarouselSlider()
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navBarAppLogoSvg),
      actions: [
        AppbarIconButton(
          icon: Icons.person,
          onTap: () {},
        ),
        const SizedBox(width: 6),
        AppbarIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(width: 6),
        AppbarIconButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}

