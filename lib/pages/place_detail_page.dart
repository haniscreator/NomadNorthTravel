import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_in_chiangmai/models/place_model.dart';

class PlaceDetailPage extends StatefulWidget {
  final Places place;
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
            child: BottomBar(price: widget.place.price.toString()),
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              floating: false,
              snap: false,
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
              child: SizedBox(
                height: 300,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Hero(
                      tag: '${widget.place.name}_image_0',
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: widget.place.image!.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Image.network(
                            widget.place.image![index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: widget.place.image!.length,
                        effect: const WormEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          activeDotColor: Colors.white,
                          dotColor: Colors.white54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _StickyTabBarDelegate(
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: "Overview"),
                    Tab(text: "Review"),
                  ],
                  indicatorColor: Colors.blue,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                ),
              ),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
            children: [
              OverviewTab(
                place: widget.place,
                currentIndex: _currentIndex,
              ),
              const ReviewTab(),
            ],
          ),
        ),
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _StickyTabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class OverviewTab extends StatelessWidget {
  final Places place;
  final int currentIndex;

  const OverviewTab({
    super.key,
    required this.place,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(milliseconds: 600),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 18),
                      const SizedBox(width: 4),
                      Text(place.location),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange),
                      Text('${place.rate}'),
                      const SizedBox(width: 6),
                      Text('(${place.review} reviews)'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    place.description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewTab extends StatelessWidget {
  const ReviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: const [
        Text("User Reviews:", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        ReviewTile(
          name: "John Doe",
          comment: "Amazing experience, loved the view!",
        ),
        ReviewTile(
          name: "Jane Smith",
          comment: "Comfortable and beautiful location!",
        ),
      ],
    );
  }
}

class ReviewTile extends StatelessWidget {
  final String name;
  final String comment;

  const ReviewTile({
    super.key,
    required this.name,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(name),
      subtitle: Text(comment),
    );
  }
}

class BottomBar extends StatelessWidget {
  final String price;

  const BottomBar({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            '\$$price',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(" / Person"),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            label: const Text("Add to Cart"),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              backgroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}