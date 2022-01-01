import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/views/carousel_page.dart';

class BottomModal extends StatelessWidget {
 BottomModal({Key? key, this.title, this.date, this.desc,this.rating, this.image, required this.onTap, }) : super(key: key);

 final String? title, date, desc, image;
 var rating;
 final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => const CarouselPage())!.then((value) => Get.close(0)),
      child: Card(
        color: Colors.grey.shade900,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Image.network(image! ,
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text( date!.substring(0, 4) + "    " + rating.toString(),
                            style: const TextStyle(fontSize: 12)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          desc!,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        fixedSize:
                            MaterialStateProperty.all(const Size.fromWidth(150))),
                    onPressed: onTap,
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Play',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: (){},
                    child: Column(
                      children: const [
                        Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                        Text(
                          'Download',
                          style: TextStyle(color: Colors.white38),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      children: const [
                        Icon(
                          Icons.play_arrow_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          'Trailer',
                          style: TextStyle(color: Colors.white38),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('Episodes & Info'),
                trailing: Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
        ),
      ),
    );
  }
}
