import 'package:flutter/material.dart';
import 'package:last_provider/data.dart';
import 'package:provider/provider.dart';

class Tampilan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bodyheight = MediaQuery.of(context).size.height;
    final bodyweight = MediaQuery.of(context).size.width;
    final atas = MediaQuery.of(context).padding.top;

    final AppBar judul = AppBar(
      backgroundColor: Colors.cyan,
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: NetworkImage(
              "https://i.pinimg.com/736x/11/74/19/117419e91425ff7d0dde85ba2aa6f538.jpg",
            ),
            fit: BoxFit.cover,
            alignment: Alignment.centerRight,
          ),
        ),
      ),
      title: Text("Tanpa Statefull", style: TextStyle(color: Colors.white)),
      actions: [
        Container(
          child: Builder(
            builder:
                (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu),
                ),
          ),
        ),
      ],
    );

    final lastbody = bodyheight - judul.preferredSize.height - atas;

    return Scaffold(
      appBar: judul,

      drawer: Drawer(
        width: bodyweight * 0.5,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: bodyweight * 0.03,
                top: atas * 0.9,
                right: bodyweight * 0.05,
              ),
              color: Colors.cyan,
              height: lastbody * 0.105,
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    // color: Colors.purple
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://i.pinimg.com/474x/26/ba/6a/26ba6afbd9bbcb503e120ed724ae796d.jpg",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: bodyweight * 0.02),
                    child: Text(
                      "History",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: lastbody * 0.5,
              child: Consumer<Data>(
                builder:
                    (context, value, child) => ListView.builder(
                      itemCount: value.hasil.length,
                      itemBuilder:
                          (context, index) => ListTile(
                            title: Text(value.hasil[index]),
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

      body: Column(
        children: [
          Container(
            // padding: EdgeInsets.only(top: lastbody * 0.1),
            width: double.infinity,
            height: lastbody * 0.2,
            // color: Colors.red,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: bodyweight * 0.03),
                  width: bodyweight * 0.7,
                  // color: Colors.amber,
                  child: Consumer<Data>(
                    builder:
                        (context, value, child) => TextField(
                          controller: value.namaewa,
                          onSubmitted: (_) => value.call(),
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
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
                  padding: EdgeInsets.only(left: bodyweight * 0.05),
                  width: bodyweight * 0.25,
                  child: Consumer<Data>(
                    builder:
                        (context, value, child) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent[400],
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
        ],
      ),
    );
  }
}
