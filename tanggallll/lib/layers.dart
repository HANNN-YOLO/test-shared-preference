import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models.dart';
import 'package:intl/intl.dart';

class Layers extends StatelessWidget {
  static const arah = "Layers";
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
                "https://i.pinimg.com/736x/34/8a/1e/348a1eba813b7b4aead6ddea0949b4af.jpg",
              ),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        title: Container(
          child: Text("CR Date", style: TextStyle(color: Colors.white)),
        ),
        actions: [
          Builder(
            builder:
                (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.home),
                ),
          ),
        ],
      ),

      drawer: Drawer(
        width: 250,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 35),
              height: 85,
              color: Colors.cyan,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://i.pinimg.com/736x/9b/cf/75/9bcf75c67f4993a71fef6bd09fe8ff31.jpg",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Read", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            Container(
              height: 750,
              child: Consumer<Models>(
                builder:
                    (context, value, child) => ListView.builder(
                      itemCount: value.sehari.length,
                      itemBuilder:
                          (context, index) => ListTile(
                            title: Text(
                              DateFormat(
                                'dd-MM-yyyy',
                              ).format(value.sehari[index]),
                            ),
                          ),
                    ),
              ),
            ),
          ],
        ),
      ),

      body: Container(
        padding: EdgeInsets.only(top: 40),
        child: Consumer<Models>(
          builder:
              (context, value, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 300,
                    child: TextField(
                      keyboardType: TextInputType.datetime,
                      readOnly: true,
                      controller: value.ini,
                      onTap: () => value.pengisian(context),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        hintText: "Masukkan tanggal",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.date_range),
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
                        value.kirim();
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
