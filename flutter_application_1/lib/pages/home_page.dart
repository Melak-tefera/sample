import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
 HomePage({super.key});

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
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Products'),
              background: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/purple.gif',
                fit: BoxFit.cover,
              ),
              
            ),
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
                  subtitle: const Text(
                    'Product description',
                  ),
                );
              },
              childCount: 30,
            ),
          ),
        ],
      ),
    
    );
  }
}

class CategoryHeaderDelegate
    extends SliverPersistentHeaderDelegate {

  @override
  double get minExtent => 20;

  @override
  double get maxExtent => 60;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(
      elevation: overlapsContent ? 4 : 0,
      color: Theme.of(context).colorScheme.surface,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('All'),
          Text('Popular'),
          Text('New'),
          Text('Sale'),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(
    covariant CategoryHeaderDelegate oldDelegate,
  ) {
    return false;
  }
}