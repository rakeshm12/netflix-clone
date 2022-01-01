import 'package:flutter/material.dart';
import 'package:netflix_ui/widgets/custom_button.dart';

class Downloads extends StatelessWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Downloads'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                label: const Text(
                  'Smart Downloads',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Introducing Downloads for You',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  'we\'ll download a personalised selection of movies and shows for you, So there\'s always something to watch on your phone.'),
              Center(child: Image.asset('assets/download.png')),
              CustomButton(
                  onTap: () {},
                  text: const Text(
                    'Set Up',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  padding: 10),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Find More to Download',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
