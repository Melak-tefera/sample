import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          
          SliverAppBar(
            backgroundColor: Colors.grey,
            expandedHeight: 250,
            toolbarHeight: 70,
            centerTitle: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Container(color: Colors.grey),
                  const Positioned(
                    left: 16,
                    bottom: 16,
                    child: Text('Products'),
                  ),
                ],
              ),
            ),
            //floating: true,
            //snap: true,
            
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: CategoryHeaderDelegate(),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text('Product ${index + 1}'),
                  subtitle: const Text('Product description'),
                );
              },
              childCount: 70,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 60;

  @override
  double get maxExtent => 120;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    
    final currentHeight = maxExtent - (shrinkOffset.clamp(0, maxExtent - minExtent));
    return Material(
      elevation: overlapsContent ? 4 : 0,
      color: Theme.of(context).colorScheme.surface,
      child: SizedBox(
        height: currentHeight,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('All'),
            Text('Popular'),
            Text('New'),
            Text('Sale'),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant CategoryHeaderDelegate oldDelegate) {
    return false;
  }
}