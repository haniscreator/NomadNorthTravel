import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/models/data_model.dart';

import 'package:travel_in_chiangmai/widgets/detail_bottom_bar.dart';
import 'package:travel_in_chiangmai/widgets/detail_overview_tab.dart';

import 'package:travel_in_chiangmai/widgets/detail_place_image_carousel.dart';
import 'package:travel_in_chiangmai/widgets/detail_tab_bar.dart';
import 'package:travel_in_chiangmai/widgets/detail_review_tab.dart';

// Make sure to import your custom widget

class PlaceDetailPage extends StatefulWidget {
  //final Places place;
  final PopularPlaces place;
  final int initialIndex;

  const PlaceDetailPage({
    super.key,
    required this.place,
    required this.initialIndex,
  });

  @override
  State<PlaceDetailPage> createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends State<PlaceDetailPage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late int _currentIndex;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: BottomAppBar(
          elevation: 0,
          color: Colors.white,
          child: SizedBox(
            height: 72,
            child: DetailBottomBar(price: widget.place.price.toString()),
          ),
        ),
      ),

      body: NestedScrollView(
        headerSliverBuilder:
            (context, innerBoxIsScrolled) => [
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.bookmark_border),
                    onPressed: () {},
                  ),
                ],
                title: Text(widget.place.name),
              ),
              SliverToBoxAdapter(
                child: DetailPlaceImageCarousel(
                  place: widget.place,
                  pageController: _pageController,
                  currentIndex: _currentIndex,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              DetailPlaceTabBar(tabController: _tabController),
            ],
        body: TabBarView(
          controller: _tabController,
          children: [
            DetailOverviewTab(place: widget.place, currentIndex: _currentIndex),
            const DetailReviewTab(),
          ],
        ),
      ),
    );
  }
}
