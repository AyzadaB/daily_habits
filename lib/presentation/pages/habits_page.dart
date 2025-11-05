import 'package:flutter/material.dart';

class HabitsPage extends StatefulWidget {
  const HabitsPage({super.key});

  @override
  HabitsPageState createState() => HabitsPageState();
}

class HabitsPageState extends State<HabitsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 162, 162, 244),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 162, 162, 244),
        title: Text("My habits", style: TextStyle(fontWeight: FontWeight.w600)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 251, 245, 245),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Today, I have to do:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              "Raed a book",
                              style: TextStyle(
                                color: Color.fromARGB(255, 75, 75, 233),
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.check_box,
                                color: Color.fromARGB(255, 162, 162, 244),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 150, bottom: 20),
        child: FloatingActionButton(
          onPressed: () {},
          hoverColor: Color.fromARGB(255, 162, 162, 244),
          child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        ),
      ),
    );
  }
}
