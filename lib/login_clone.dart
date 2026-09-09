import 'package:flutter/material.dart';

class LoginClone extends StatefulWidget {
  const LoginClone({super.key});

  @override
  State<LoginClone> createState() => _LoginCloneState();
}

class _LoginCloneState extends State<LoginClone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111B21),

      appBar: AppBar(
        title: Text(
          "WhatsApp",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF202C33),
      ),

      body: Column(
        children: [
          SizedBox(height: 30),

          Icon(
            Icons.chat,
            size: 80,
            color: Color(0xFF25D366),
          ),

          SizedBox(height: 20),

          Text(
            "Enter your phone number",
            style: TextStyle(
              color: const Color.fromARGB(255, 135, 135, 135),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            " "
          ),

          Text(
            "Whatsapp will need to verify your phone number.",
            style: TextStyle(
              color: const Color.fromARGB(255, 135, 135, 135),
              fontSize: 16,
            ),
          ),

          Text(
            "Carrier charge may apply.",
            style: TextStyle(
              color: const Color.fromARGB(255, 135, 135, 135),
              fontSize: 16,
            ),
          ),

          Text(
            "What's my phone number?",
            style: TextStyle(
              color: Color(0xFF25D366),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 30),

          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Input Phone Number",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),

          SizedBox(height: 30),

          Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF25D366),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
      );
  }
}
