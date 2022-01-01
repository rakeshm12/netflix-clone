import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/views/choose_plan.dart';
import 'package:netflix_ui/views/create_account.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leadingWidth: 200,
        leading: Row(
          children: [
            IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back)),
            Expanded(
              child: Image.asset(
                'assets/netflix.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.grey.shade800,
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade800,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: OutlinedButton(
                  onPressed: () {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      return;
                    } else {

                      Get.off( () => const ChoosePlan());
                    }
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(color: Colors.white)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 16)),
                    overlayColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _launchURL();
                      });

                    },
                    child: const Text(
                      " Need help?",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("New to Netflix?"),
                        TextButton(
                          onPressed: () => Get.to(const CreateAccount()),
                          child: const Text(
                            " Sign up now.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: ReadMoreText(
                      "Sign in is protected by Google reCAPTCHA to ensure you're not \na bot. \n\nThe information collected by Google reCAPTCHA is subject to \nthe Google Privacy Policy and Terms of Service, and is used for \nproviding, maintaining, and improving the reCAPTCHA service \nand for general security purpose(it is not used for personalized advertising by Google).",
                      trimLines: 2,
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      textAlign: TextAlign.center,
                      trimCollapsedText: 'Learn more.',
                      trimExpandedText: '',
                      style: TextStyle(fontSize: 11.0),
                      moreStyle: TextStyle(fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _launchURL() async {
  try {
    if (!await launch('https://www.netflix.com/in/loginhelp')) {}
  } catch (e) {
    throw Exception(e);
  }
}
