import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(title: Text("Responsive LayoutBuilder UI")),

        body: LayoutBuilder(
          builder: (context, constraints) {
            // 📱 MOBILE LAYOUT
            if (constraints.maxWidth < 600) {
              return Column(
                children: [
                  Container(
                    height: 80,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    child: Center(
                      child: Text(
                        "MOBILE HEADER",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: ListView(
                      children: [
                        buildCard(
                          "Mobile Item 1",
                          const Color.fromARGB(255, 46, 0, 253),
                        ),
                        buildCard(
                          "Mobile Item 2",
                          const Color.fromARGB(255, 0, 26, 255),
                        ),
                        buildCard(
                          "Mobile Item 3",
                          const Color.fromARGB(255, 0, 4, 255),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            // 💻 TABLET / DESKTOP LAYOUT
            else {
              return Row(
                children: [
                  // 📌 Sidebar
                  Container(
                    width: 200,
                    color: Colors.black87,
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          child: Center(
                            child: Text(
                              "SIDEBAR",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),

                        sidebarItem("Home"),
                        sidebarItem("Profile"),
                        sidebarItem("Settings"),
                        sidebarItem("Logout"),
                      ],
                    ),
                  ),

                  // 📌 Main Content
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      padding: EdgeInsets.all(16),
                      children: [
                        buildCard(
                          "Tablet Card 1",
                          const Color.fromARGB(255, 0, 132, 255),
                        ),
                        buildCard(
                          "Tablet Card 2",
                          const Color.fromARGB(255, 0, 119, 255),
                        ),
                        buildCard(
                          "Tablet Card 3",
                          const Color.fromARGB(255, 0, 132, 255),
                        ),
                        buildCard(
                          "Tablet Card 4",
                          const Color.fromARGB(255, 0, 119, 255),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  // 📌 Sidebar Item Widget
  Widget sidebarItem(String title) {
    return ListTile(
      title: Text(title, style: TextStyle(color: Colors.white)),
      leading: Icon(Icons.star, color: Colors.white),
    );
  }

  // 📌 Reusable Card Widget
  Widget buildCard(String title, Color color) {
    return Container(
      margin: EdgeInsets.all(12),
      height: 140,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 📌 Item 1
          Icon(Icons.dashboard, color: Colors.white, size: 40),

          SizedBox(height: 10),

          // 📌 Item 2
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          // 📌 Item 3
          Text(
            "This is sample card content",
            style: TextStyle(color: Colors.white70, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),

      // child: Center(
      //   child: Text(
      //     title,
      //     style: TextStyle(color: Colors.white, fontSize: 22),
      //     textAlign: TextAlign.center,
      //   ),
    );
  }
}
