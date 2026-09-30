import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const StorePage(),
    );
  }
}

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('My Store'),
              background: FlutterLogo(),
            ),
          ),

          SliverPersistentHeader(
            pinned: true,
            delegate: CategoryDelegate(),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    child: Center(
                      child: Text(
                        'Product ${index + 1}',
                      ),
                    ),
                  );
                },
                childCount: 8,
              ),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Recommended',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall,
              ),
            ),
          ),

          SliverFixedExtentList(
            itemExtent: 72,
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text(
                    'Recommended Item ${index + 1}',
                  ),
                );
              },
              childCount: 10,
            ),
          ),

          const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text(
                'End of Store',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryDelegate
    extends SliverPersistentHeaderDelegate {

  @override
  double get minExtent => 56;

  @override
  double get maxExtent => 56;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(
      elevation: overlapsContent ? 4 : 0,
      color: Theme.of(context).colorScheme.surface,
      child: const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 16),
            Chip(label: Text('All')),
            SizedBox(width: 8),
            Chip(label: Text('Phones')),
            SizedBox(width: 8),
            Chip(label: Text('Laptops')),
            SizedBox(width: 8),
            Chip(label: Text('Shoes')),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(
    covariant CategoryDelegate oldDelegate,
  ) {
    return false;
  }
}