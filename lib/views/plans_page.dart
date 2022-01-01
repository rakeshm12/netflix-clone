import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/views/payment.dart';
import 'package:netflix_ui/views/widgets/app_bar.dart';
import 'package:netflix_ui/views/widgets/custom_button.dart';
import 'package:netflix_ui/views/widgets/plan_selector.dart';
import 'package:netflix_ui/views/widgets/plans_widget.dart';

class PlansPage extends StatefulWidget {
  const PlansPage({Key? key}) : super(key: key);

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  int currentSelection = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarLoggedIn,
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
                        const Text(
                          "Choose your plan that's right \nfor you.",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.check,
                            size: 20,
                            color: Colors.red.shade900,
                          ),
                          title: const Text('No commitments,cancel anytime.'),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.check,
                            size: 20,
                            color: Colors.red.shade900,
                          ),
                          title: const Text(
                              'Everything on Netflix for one low price.'),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.check,
                            size: 20,
                            color: Colors.red.shade900,
                          ),
                          title: const Text('No ads and no extra fees. Ever.'),
                        ),
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
              bottom: PreferredSize(
                preferredSize: Size.zero,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      4,
                      (index) => InkWell(
                            onTap: () {
                              setState(() {
                                currentSelection = index++;
                              });
                            },
                            child: index == currentSelection
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    child: PlanSelector(
                                      plans: index == 0
                                          ? "Mobile"
                                          : index == 1
                                              ? "Basic"
                                              : index == 2
                                                  ? "Standard"
                                                  : "Premium",
                                      isSelected: true,
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    child: PlanSelector(
                                      plans: index == 0
                                          ? "Mobile"
                                          : index == 1
                                              ? "Basic"
                                              : index == 2
                                                  ? "Standard"
                                                  : "Premium",
                                      isSelected: false,
                                    ),
                                  ),
                          )),
                ),
              ),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Column(
                  children: [
                    PlansWidget(head: 'Monthly price', childrens: [
                      Text("₹ 149", style: TextStyle(color: currentSelection == 0 ? Colors.red : Colors.grey, fontWeight: FontWeight.bold),),
                      Text("₹ 199",style: TextStyle(color: currentSelection == 1 ? Colors.red : Colors.grey, fontWeight: FontWeight.bold)),
                      Text("₹ 499",style: TextStyle(color: currentSelection == 2 ? Colors.red : Colors.grey, fontWeight: FontWeight.bold)),
                      Text("₹ 649",style: TextStyle(color: currentSelection == 3 ? Colors.red : Colors.grey, fontWeight: FontWeight.bold)),
                    ]),
                    PlansWidget(head: 'Video quality', childrens: [
                      Text("Good",style: TextStyle(color: currentSelection == 0 ? Colors.red : Colors.grey, fontWeight: FontWeight.bold)),
                      Text("Good",style: TextStyle(color: currentSelection == 1 ? Colors.red : Colors.grey, fontWeight: FontWeight.bold)),
                      Text("Better",style: TextStyle(color: currentSelection == 2 ? Colors.red : Colors.grey, fontWeight: FontWeight.bold)),
                      Text("Best",style: TextStyle(color: currentSelection == 3 ? Colors.red : Colors.grey, fontWeight: FontWeight.bold)),
                    ]),
                     PlansWidget(head: 'Resolution', childrens: [
                      Text("480p",style: TextStyle(color: currentSelection == 0 ? Colors.red : Colors.grey, fontWeight: FontWeight.bold)),
                      Text("480p",style: TextStyle(color: currentSelection == 1 ? Colors.red : Colors.grey, fontWeight: FontWeight.bold)),
                      Text("1080p",style: TextStyle(color: currentSelection == 2 ? Colors.red : Colors.grey, fontWeight: FontWeight.bold)),
                      Text("4K + HDR",style: TextStyle(color: currentSelection == 3 ? Colors.red : Colors.grey, fontWeight: FontWeight.bold)),
                    ]),
                    PlansWidget(head: 'Devices you can watch', childrens: [
                      Column(
                        children:[
                          Icon(Icons.phone_iphone,color: currentSelection == 0 ? Colors.red : Colors.grey),
                          const SizedBox(height: 20,),
                          Icon(Icons.tablet,color: currentSelection == 0 ? Colors.red : Colors.grey),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.phone_iphone,color: currentSelection == 1 ? Colors.red : Colors.grey),
                          const SizedBox(height: 20),
                          Icon(Icons.tablet,color: currentSelection == 1 ? Colors.red : Colors.grey),
                          const SizedBox(height: 20),
                          Icon(Icons.computer,color: currentSelection == 1 ? Colors.red : Colors.grey),
                          const SizedBox(height: 20,),
                          Icon(Icons.tv,color: currentSelection == 1 ? Colors.red : Colors.grey)
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.phone_iphone,color: currentSelection == 2 ? Colors.red : Colors.grey),
                          const SizedBox(height: 20),
                          Icon(Icons.tablet,color: currentSelection == 2 ? Colors.red : Colors.grey),
                          const SizedBox(height: 20,),
                          Icon(Icons.computer,color: currentSelection == 2 ? Colors.red : Colors.grey),
                          const SizedBox(height: 20,),
                          Icon(Icons.tv,color: currentSelection == 2 ? Colors.red : Colors.grey)
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.phone_iphone,color: currentSelection == 3 ? Colors.red : Colors.grey),
                          const SizedBox(height: 20,),
                          Icon(Icons.tablet,color: currentSelection == 3 ? Colors.red : Colors.grey),
                          const SizedBox(height: 20,),
                          Icon(Icons.computer,color: currentSelection == 3 ? Colors.red : Colors.grey),
                          const SizedBox(height: 20,),
                          Icon(Icons.tv,color: currentSelection == 3 ? Colors.red : Colors.grey)
                        ],
                      ),
                    ]),
                    const SizedBox(
                      height: 15,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("HD(720p), Full HD(1080p), Ultra HD(4K), and HDR availability subject to your internet service and device capabilities. Not all content available in HD, Full HD, Ultra HD, or HDR. See Terms of Use for more details. \n"
                          "Only people who live with you may use your account. Watch on 4 different devices at the same time with Premium, 2 with standard, and 1 with Basic and Mobile",
                      style: TextStyle(fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    CustomButton(onTap: () => Get.to(PaymentSetup()), text: const Text("CONTINUE"), padding: 20)
                  ],
                );
              }, childCount: 1),
            ),
          ],
        )));
  }
}
