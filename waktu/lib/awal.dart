import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/data.dart';
import 'package:intl/intl.dart';

class Awal extends StatelessWidget {
  static const jalan = "Awal";
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
                "https://i.pinimg.com/736x/93/40/ab/9340abe0bf82044ad0e70af17ea3a514.jpg",
              ),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        title: Text("Last One Time", style: TextStyle(color: Colors.white)),
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
                          "https://i.pinimg.com/736x/f3/3a/30/f33a3096d177f34942056e87c6c6f5be.jpg",
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
              child: Consumer<Data>(
                builder:
                    (context, value, child) => ListView.builder(
                      itemCount: value.dumydata.length,
                      itemBuilder:
                          (context, index) => ListTile(
                            title: Text(
                              DateFormat('HH:mm').format(value.dumydata[index]),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    value.waktu.text =
                                        "${DateFormat('HH:mm').format(value.dumydata[index])}";
                                    showDialog(
                                      context: context,
                                      builder:
                                          (context) => AlertDialog(
                                            content: Container(
                                              height: 135,
                                              child: Column(
                                                children: [
                                                  Text("Perubahan"),
                                                  TextField(
                                                    keyboardType:
                                                        TextInputType.datetime,
                                                    readOnly: true,
                                                    controller: value.waktu,
                                                    onTap:
                                                        () => value.pilihwaktu(
                                                          context,
                                                        ),
                                                    onSubmitted:
                                                        (_) => value.pilihwaktu(
                                                          context,
                                                        ),
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          "Pilihlah Perubahan",
                                                      hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                      prefixIcon: Icon(
                                                        Icons.timelapse,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .zero,
                                                          ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Container(
                                                          child: ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              backgroundColor:
                                                                  Colors.red,
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .zero,
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                context,
                                                              ).pop();
                                                            },
                                                            child: Text(
                                                              "Back",
                                                              style: TextStyle(
                                                                color:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                              backgroundColor:
                                                                  Colors.cyan,
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .zero,
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              value.update(
                                                                index,
                                                              );
                                                              Navigator.of(
                                                                context,
                                                              ).pop();
                                                            },
                                                            child: Text(
                                                              "YES",
                                                              style: TextStyle(
                                                                color:
                                                                    Colors
                                                                        .white,
                                                              ),
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
        height: 150,
        width: double.infinity,
        child: Consumer<Data>(
          builder:
              (context, value, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 250,
                    child: TextField(
                      keyboardType: TextInputType.datetime,
                      readOnly: true,
                      controller: value.waktu,
                      onTap: () => value.pilihwaktu(context),
                      onSubmitted: (_) => value.pilihwaktu(context),
                      decoration: InputDecoration(
                        hintText: "Masukkan Tanggal",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.timelapse_rounded),
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
