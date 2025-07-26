import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data.dart';

class Awal extends StatelessWidget {
  static const route = 'Awal';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("CRUD Angka Part 2", style: TextStyle(color: Colors.white)),
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: NetworkImage(
                "https://i.pinimg.com/736x/f3/05/2f/f3052fbf2c12b5ab29712cb9e575d010.jpg",
              ),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        actions: [
          Builder(
            builder:
                (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.timelapse),
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
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://i.pinimg.com/736x/f5/64/f3/f564f362efa6328ac0a958fe5d777a74.jpg",
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
              child: Consumer<Data>(
                builder:
                    (context, value, child) => ListView.builder(
                      itemCount: value.dumydata.length,
                      itemBuilder:
                          (context, index) => ListTile(
                            title: Text("${value.dumydata[index]}"),
                            trailing: Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      value.isi.text =
                                          "${value.dumydata[index]}";
                                      showDialog(
                                        context: context,
                                        builder:
                                            (context) => AlertDialog(
                                              content: Container(
                                                height: 100,
                                                child: Column(
                                                  children: [
                                                    TextField(
                                                      keyboardType:
                                                          TextInputType.number,
                                                      controller: value.isi,
                                                      onSubmitted:
                                                          (_) => value.terisi(),
                                                      decoration:
                                                          InputDecoration(
                                                            hintText:
                                                                "Perubahan",
                                                            hintStyle:
                                                                TextStyle(
                                                                  color:
                                                                      Colors
                                                                          .grey,
                                                                ),
                                                          ),
                                                    ),
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          ElevatedButton(
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
                                                              "Kembali",
                                                              style: TextStyle(
                                                                color:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                            ),
                                                          ),
                                                          ElevatedButton(
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
                                                            },
                                                            child: Text(
                                                              "Update",
                                                              style: TextStyle(
                                                                color:
                                                                    Colors
                                                                        .white,
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
                                    icon: Icon(
                                      Icons.upload,
                                      color: Colors.cyan,
                                    ),
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
            ),
          ],
        ),
      ),

      body: Container(
        width: double.infinity,
        height: 100,
        child: Consumer<Data>(
          builder:
              (context, value, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 250,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: value.isi,
                      onSubmitted: (_) => value.terisi(),
                      decoration: InputDecoration(
                        hintText: "Masukkan INt",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        prefixIcon: Icon(Icons.format_list_numbered),
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
                      value.create();
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
