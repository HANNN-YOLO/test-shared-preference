import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'nested.dart';
import 'package:intl/intl.dart';

class Screen extends StatelessWidget {
  @override
  static const arah = 'Screens';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: NetworkImage(
                "https://i.pinimg.com/736x/e6/f5/7c/e6f57c512279ae8c2f8c1b27cabf1555.jpg",
              ),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        title: Text("CRD Waktu", style: TextStyle(color: Colors.white)),
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
                          "https://i.pinimg.com/736x/45/de/8d/45de8d693751b9fae8b18b392d82952c.jpg",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Read", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            Container(
              height: 750,
              // color: Colors.red
              child: Consumer<Nested>(
                builder:
                    (context, value, child) => ListView.builder(
                      itemCount: value.isi.length,
                      itemBuilder:
                          (context, index) => ListTile(
                            title: Text(
                              DateFormat('HH:mm').format(value.isi[index]),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    value.jam.text =
                                        "${DateFormat('HH:mm').format(value.isi[index])}";
                                    showDialog(
                                      context: context,
                                      builder:
                                          (context) => AlertDialog(
                                            content: Container(
                                              height: 150,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text("Update"),
                                                  TextField(
                                                    keyboardType:
                                                        TextInputType.datetime,
                                                    readOnly: true,
                                                    controller: value.jam,
                                                    onTap:
                                                        () => value.build(
                                                          context,
                                                        ),
                                                    onSubmitted:
                                                        (_) => value.build(
                                                          context,
                                                        ),
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          "Perubahan Waktu",
                                                      hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                      prefixIcon: Icon(
                                                        Icons.punch_clock,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .zero,
                                                          ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor:
                                                                Colors.red,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .zero,
                                                                ),
                                                          ),
                                                          onPressed: () {
                                                            value.backormalas(
                                                              context,
                                                            );
                                                          },
                                                          child: Text(
                                                            "Back",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor:
                                                                Colors.cyan,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .zero,
                                                                ),
                                                          ),
                                                          onPressed: () {
                                                            value.update(index);
                                                            Navigator.of(
                                                              context,
                                                            ).pop();
                                                          },
                                                          child: Text(
                                                            "Update",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                    );
                                  },
                                  icon: Icon(Icons.upload, color: Colors.cyan),
                                ),
                                IconButton(
                                  onPressed: () {
                                    value.delete(index);
                                  },
                                  icon: Icon(Icons.delete, color: Colors.red),
                                ),
                              ],
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
        // color: Colors.red,
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
                      controller: value.jam,
                      onTap: () => value.build(context),
                      onSubmitted: (_) => value.build(context),
                      decoration: InputDecoration(
                        hintText: "Masukkan Tanggal",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.keyboard_capslock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
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
