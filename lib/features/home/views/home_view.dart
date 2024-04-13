import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_base/common/common.dart';
import 'package:flutter_bloc_base/common/widgets/src/app_search_delegate.dart';

class HomePage extends StatelessWidget with PageNavigateMixin {
  @override
  String get goName => 'home-view';
  @override
  String get routeName => goNameWithSlash;

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTitle(),
              _buildSearchBar(),
              _buildTopSellingCarousel(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        context.l10n.home,
        style: getExtraBoldStyle(fontSize: FontSize.s30),
        textScaler: TextScaler.linear(
          ScaleSize.textScaleFactor(context),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return AppSearchBar(
      onPressed: () {
        showSearch(context: context, delegate: AppSearchDelegate());
      },
    );
  }

  Widget _buildTopSellingCarousel() {
    return CarouselSlider.builder(
      itemCount: 10,
      itemBuilder: (context, index, realIndex) {
        return Card();
      },
      options: CarouselOptions(aspectRatio: 16 / 9),
    );
  }
}
