import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SocialPostPage(),
    );
  }
}

class SocialPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🌈 BACKGROUND GRADIENT (SCREEN LEVEL)
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 139, 138, 138),
              const Color.fromARGB(255, 70, 70, 70),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        // 📌 CENTER THE CARD
        child: Center(
          // 🧾 POST CARD
          child: Card(
            margin: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 👤 PROFILE HEADER SECTION
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                  ),
                  title: Text("John Doe"),
                  subtitle: Text("2 hrs ago"),
                  trailing: Icon(Icons.more_vert),
                ),

                // 🖼 IMAGE SECTION WITH STACK (LIKE BUTTON OVERLAY)
                Stack(
                  children: [
                    // POST IMAGE (BODY)
                    Image.asset(
                      "assets/images/background.jpg",
                      width: double.infinity,
                      height: 220,
                      fit: BoxFit.cover,
                    ),

                    // ❤️ FLOATING LIKE BUTTON
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.favorite, color: Colors.red),
                          onPressed: () {
                            print("Liked!");
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                // 📝 MULTI-LINE CAPTION SECTION
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Exploring Flutter UI \n"
                    "Gray wavy background for proffessional API.\n"
                    "Feels better seeing.",
                    style: TextStyle(fontSize: 14, height: 1.4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
