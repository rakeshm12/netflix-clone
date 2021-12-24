import 'package:flutter/material.dart';
import 'package:netflix_ui/widgets/app_bar.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: Scaffold(
            body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("STEP 2 OF 3"),
                        const Text("Choose your plan.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        ListTile(leading: Icon(Icons.check, size: 20, color: Colors.red.shade900,),
                          title: const Text('No commitments,cancel anytime.'),),
                        ListTile(leading: Icon(Icons.check, size: 20, color: Colors.red.shade900,),
                          title: const Text('Everything on Netflix for one low price.'),),
                        ListTile(leading: Icon(Icons.check, size: 20, color: Colors.red.shade900,),
                          title: const Text('No ads and no extra fees. Ever.'),),

                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 100,
              collapsedHeight: 100,
              pinned: true,
              bottom : PreferredSize(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.red.shade400,
                        width: 60,
                        height: 80,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child: Container(
                        color: Colors.red.shade400,
                        width: 60,
                        height: 80,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child: Container(
                        color: Colors.red.shade400,
                        width: 60,
                        height: 80,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child: Container(
                        color: Colors.red.shade400,
                        width: 60,
                        height: 80,
                      ),
                    ),
                  ],
                ),
              ),preferredSize: Size.zero,)
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: index.isOdd ? Colors.white : Colors.black12,
                    height: 100.0,
                    child: Center(
                      child: Text('$index', textScaleFactor: 5),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        )));
  }
}
