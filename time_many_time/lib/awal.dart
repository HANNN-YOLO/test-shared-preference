import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:time_many_time/nested.dart';

class Awal extends StatelessWidget {
  static const routing = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: NetworkImage(
                "https://i.pinimg.com/736x/d0/c3/ca/d0c3caaa726c51bb23146dfb07546c23.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text("Time is Time", style: TextStyle(color: Colors.white)),
        actions: [
          Builder(
            builder:
                (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu),
                ),
          ),
        ],
      ),

      drawer: Drawer(
        width: 200,
        child: Column(
          children: [
            Container(
              color: Colors.cyan,
              height: 85,
              padding: EdgeInsets.only(top: 35),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://i.pinimg.com/736x/73/5a/25/735a258668201c10d8b0ed280e8c6f79.jpg",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "History / Read",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 750,
              color: Colors.grey,
              child: Consumer<Nested>(
                builder:
                    (context, value, child) => ListView.builder(
                      itemCount: value.masa.length,
                      itemBuilder:
                          (context, index) => ListTile(
                            title: Text(
                              DateFormat('HH:mm').format(value.masa[index]),
                            ),
                          ),
                    ),
              ),
            ),
          ],
        ),
      ),

      body: Container(
        height: 200,
        width: double.infinity,
        child: Consumer<Nested>(
          builder:
              (context, value, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 250,
                    child: TextField(
                      keyboardType: TextInputType.datetime,
                      readOnly: true,
                      controller: value.penulisan,
                      onTap: () => value.isi(context),
                      onSubmitted: (_) => value.isi(context),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        hintText: "Pilih Waktu",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.access_time),
                      ),
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: () {
                        value.create();
                      },
                      child: Text(
                        "Create",
                        style: TextStyle(color: Colors.white),
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
