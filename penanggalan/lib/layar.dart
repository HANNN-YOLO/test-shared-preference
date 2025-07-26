import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'fungsi.dart';
import 'package:intl/intl.dart';

class Layar extends StatelessWidget {
  static const penamaan = "/Layar";
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
                "https://i.pinimg.com/736x/42/8b/cc/428bcc418e90c4f8a280f577547e4463.jpg",
              ),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        title: Text("CRUD Date", style: TextStyle(color: Colors.white)),
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
        width: 200,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 35),
              height: 83,
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
                          "https://i.pinimg.com/736x/3a/e6/df/3ae6df1c03dea7a5ac20bc9b5e9d3c95.jpg",
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
              child: Consumer<Fungsi>(
                builder:
                    (context, value, child) => ListView.builder(
                      itemCount: value.dumydata.length,
                      itemBuilder:
                          (context, index) => ListTile(
                            title: Text(
                              DateFormat(
                                'dd-MM-yyyy',
                              ).format(value.dumydata[index]),
                            ),
                          ),
                    ),
              ),
            ),
          ],
        ),
      ),

      body: Container(
        height: 100,
        child: Consumer<Fungsi>(
          builder:
              (context, value, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 250,
                    child: TextField(
                      readOnly: true,
                      onTap: () => value.call(context),
                      onSubmitted: (_) => value.call(context),
                      controller: value.isilah,
                      decoration: InputDecoration(
                        hintText: "Masukkan Tanggal",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        prefixIcon: Icon(Icons.date_range),
                      ),
                    ),
                  ),
                  Container(
                    width: 90,
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
