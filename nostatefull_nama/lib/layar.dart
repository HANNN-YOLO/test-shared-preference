import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models.dart';

class Layar extends StatelessWidget {
  static const nameroute = 'layar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: NetworkImage(
                "https://i.pinimg.com/474x/04/70/c3/0470c37616ce1aebb5771d4a26c935ea.jpg",
              ),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
        title: Text(
          "ONLY PROVIDER - NAMA",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Builder(
            builder:
                (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.history),
                ),
          ),
        ],
      ),

      drawer: Drawer(
        width: 200,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 35, left: 10),
              height: 85,
              color: Colors.cyan,
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://i.pinimg.com/474x/7a/56/66/7a56667afaa6b755c61d092fdd28c8b5.jpg",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "History",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
              child: Consumer<Models>(
                builder:
                    (context, value, child) => ListView.builder(
                      itemCount: value.name.length,
                      itemBuilder:
                          (context, index) => ListTile(
                            title: Text(value.name[index]),
                            trailing: IconButton(
                              onPressed: () {
                                value.hapus(index);
                              },
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ),
                    ),
              ),
            ),
          ],
        ),
      ),

      body: Container(
        width: double.infinity,
        height: 150,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20),
              width: 300,
              child: Consumer<Models>(
                builder:
                    (context, value, child) => TextField(
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      controller: value.namaewa,
                      onSubmitted: (_) => value.ketikan(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Berupa String",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Consumer<Models>(
                builder:
                    (context, value, child) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: () {
                        value.button();
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
