import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: 100,
            expandedHeight: 60,
            title: const Text('Coming Soon'),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.cast)),
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.widgets)),
            ],
            bottom: PreferredSize(
              preferredSize: Size.zero,
              child: Row(
                children: const [
                  Expanded(
                    child: ListTile(
                      leading: Icon(Icons.notifications_none),
                      title: Text('Notifications'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  child: Image.network('https://picsum.photos/200'),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
