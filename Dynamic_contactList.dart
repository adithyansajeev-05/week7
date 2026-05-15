import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<String> categories = ["Friends", "Family", "Work", "College"];

  final List<String> contacts = [
    "Rahul",
    "Arjun",
    "Vivek",
    "Akash",
    "Nikhil",
    "Aman",
    "Rohit",
    "Kiran",
    "Deepak",
    "Sanjay",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Dynamic Contact List",
            style: TextStyle(color: Colors.white),
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              // GRID SECTION
              Padding(
                padding: const EdgeInsets.all(10),

                child: GridView.count(
                  crossAxisCount: 4, // grid layout

                  childAspectRatio: 3,

                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,

                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),

                  children: categories.map((category) {
                    return Container(
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Center(
                        child: Text(
                          category,

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              // CONTACT LIST
              ListView.builder(
                shrinkWrap: true,

                physics: NeverScrollableScrollPhysics(),

                itemCount: contacts.length,

                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),

                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,

                        child: Text(
                          contacts[index][0],

                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                      title: Text(
                        contacts[index],

                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      subtitle: Text(
                        "Flutter Developer",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(Icons.phone),

                      onTap: () {
                        //THE CONTACT LIST iS CLICABLE
                        print("${contacts[index]} clicked");
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
