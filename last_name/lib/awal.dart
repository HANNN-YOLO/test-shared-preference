import 'package:flutter/material.dart';
import 'package:last_name/fungsi.dart';
import 'package:provider/provider.dart';

class Awal extends StatelessWidget {
  static const nameroute = '/Awal';
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
                "https://i.pinimg.com/736x/aa/7d/e9/aa7de93174dc90981edb86d3ede6fc6c.jpg",
              ),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        title: Text(
          "State Management String",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Container(
            height: 50,
            width: 50,
            child: Builder(
              builder:
                  (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(Icons.history),
                  ),
            ),
          ),
        ],
      ),

      drawer: Drawer(
        width: 200,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, left: 10),
              height: 85,
              color: Colors.cyan,
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://i.pinimg.com/474x/80/11/31/801131fbc9f8c1f75efd9c1e0ed0042b.jpg",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
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
            // SizedBox(height: 10),
            Expanded(
              child: Container(
                height: 100,
                // color: Colors.red,
                child: Consumer<Fungsi>(
                  builder:
                      (context, value, child) => ListView.builder(
                        itemCount: value.name.length,
                        itemBuilder:
                            (ctx, index) => ListTile(
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
            ),
          ],
        ),
      ),

      body: Container(
        width: double.infinity,
        height: 150,
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              // padding: EdgeInsets.only(left: 20),
              width: 300,
              // color: Colors.purple,
              child: Consumer<Fungsi>(
                builder:
                    (context, value, child) => TextField(
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      controller: value.kimi,
                      onSubmitted: (_) => value.call(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        hintText: "Masukkan Nama Anda",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
              ),
            ),
            Container(
              // padding: EdgeInsets.only(left: 20),
              child: Consumer<Fungsi>(
                builder:
                    (context, value, child) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: () {
                        value.pencet();
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
