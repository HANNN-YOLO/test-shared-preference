import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'menghilang.dart';
import 'package:intl/intl.dart';

class Tampilan extends StatelessWidget {
  static const isi = 'tampilan';
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
                "https://i.pinimg.com/736x/65/dc/41/65dc419d781791a83ac191e893b7ab92.jpg",
              ),
              fit: BoxFit.cover,
              // alignment: Alignment.topCenter
            ),
          ),
        ),
        title: Text("Bismillah Last", style: TextStyle(color: Colors.white)),
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
        width: 250,
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
                          "https://i.pinimg.com/736x/22/1b/65/221b655f3aae4c87c5b9aeae19b26e8c.jpg",
                        ),
                        fit: BoxFit.cover,
                        // alignment: Alignment.topCenter
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
              child: Consumer<Menghilang>(
                builder:
                    (context, value, child) => ListView.builder(
                      itemCount: value.mydata.length,
                      itemBuilder:
                          (context, index) => ListTile(
                            title: Text(
                              DateFormat(
                                'dd-MM-yyyy',
                              ).format(value.mydata[index]),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    value.isi.text =
                                        "${DateFormat('dd-MM-yyyy').format(value.mydata[index])}";
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
                                                  Container(
                                                    child: Text("Update Date"),
                                                  ),
                                                  Container(
                                                    child: TextField(
                                                      keyboardType:
                                                          TextInputType
                                                              .datetime,
                                                      readOnly: true,
                                                      controller: value.isi,
                                                      onTap:
                                                          () => value.submittap(
                                                            context,
                                                          ),
                                                      onSubmitted:
                                                          (_) =>
                                                              value.submittap(
                                                                context,
                                                              ),
                                                      decoration: InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .zero,
                                                            ),
                                                        hintText: "Update",
                                                        hintStyle: TextStyle(
                                                          color: Colors.grey,
                                                        ),
                                                        prefixIcon: Icon(
                                                          Icons.date_range,
                                                        ),
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
                                  icon: Icon(Icons.update, color: Colors.cyan),
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
        width: double.infinity,
        height: 150,
        child: Consumer<Menghilang>(
          builder:
              (context, value, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 250,
                    child: TextField(
                      keyboardType: TextInputType.datetime,
                      readOnly: true,
                      controller: value.isi,
                      onTap: () => value.submittap(context),
                      onSubmitted: (_) => value.submittap(context),
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
