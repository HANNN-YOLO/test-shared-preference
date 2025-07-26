import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'fungsi.dart';
import 'package:intl/intl.dart';

class Layar extends StatelessWidget {
  static const halo = 'Layar';
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
                "https://i.pinimg.com/736x/a6/17/cd/a617cd29f7fe3ff546549f2c5f469ad2.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text("Last CRUD Waktu", style: TextStyle(color: Colors.white)),
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
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Colors.grey,
        width: 200,
        child: Column(
          children: [
            Container(
              height: 85,
              padding: EdgeInsets.only(top: 35),
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
                          "https://i.pinimg.com/736x/22/54/59/2254598e74166d1d1416feb2728da72f.jpg",
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
              child: Consumer<Fungsi>(
                builder:
                    (context, value, child) => ListView.builder(
                      itemCount: value.halo.length,
                      itemBuilder:
                          (context, index) => ListTile(
                            title: Text(
                              DateFormat('HH:mm').format(value.halo[index]),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    value.hapus(index);
                                  },
                                  icon: Icon(Icons.delete, color: Colors.red),
                                ),
                                IconButton(
                                  onPressed: () {
                                    value.hola.text =
                                        "${DateFormat('HH:mm').format(value.halo[index])}";
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
                                                    controller: value.hola,
                                                    onTap:
                                                        () => value.bangunan(
                                                          context,
                                                        ),
                                                    onSubmitted:
                                                        (_) => value.bangunan(
                                                          context,
                                                        ),
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          "Masukkan Perubahan",
                                                      hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                      prefixIcon: Icon(
                                                        Icons.home,
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
                                                            shape:
                                                                RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .zero,
                                                                ),
                                                            backgroundColor:
                                                                Colors.red,
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
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .zero,
                                                                ),
                                                            backgroundColor:
                                                                Colors.cyan,
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
        child: Consumer<Fungsi>(
          builder:
              (context, value, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 250,
                    child: TextField(
                      keyboardType: TextInputType.datetime,
                      readOnly: true,
                      controller: value.hola,
                      onTap: () => value.bangunan(context),
                      onSubmitted: (_) => value.bangunan(context),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        hintText: "Masukkan Waktu",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.circle_notifications_sharp),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () {
                      value.buat();
                    },
                    child: Text(
                      "Create",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
