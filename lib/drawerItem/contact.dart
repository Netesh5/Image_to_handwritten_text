import 'package:flutter/material.dart';

class contactus extends StatefulWidget {
  const contactus({Key? key}) : super(key: key);

  @override
  State<contactus> createState() => _contactusState();
}

class _contactusState extends State<contactus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.primary),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("assets/images/netesh.heic"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Nitesh Paudel ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Theme.of(context).backgroundColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Mobile App Developer",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).backgroundColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
