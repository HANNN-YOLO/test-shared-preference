import 'package:flutter/material.dart';
import 'models.dart';
import 'package:provider/provider.dart';

class Layar extends StatelessWidget {
  static const route = 'Layar';
  @override
  Widget build(BuildContext context) {
    // final daftar = Provider.of<Models>(context, listen: false);
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
        title: Text("CRUD Angka", style: TextStyle(color: Colors.white)),
        actions: [
          Builder(
            builder:
                (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.history, color: Colors.red),
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
                          "https://i.pinimg.com/736x/2b/4c/58/2b4c585d2943083bf3f38bdf8f6b8538.jpg",
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
            SingleChildScrollView(
              child: Container(
                // color: Colors.purple,
                height: 750,
                child: Consumer<Models>(
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
                                        value.bilangan.text =
                                            "${value.dumydata[index]}";

                                        showDialog(
                                          context: context,
                                          builder:
                                              (context) => AlertDialog(
                                                content: Container(
                                                  height: 134,
                                                  // width: 200,
                                                  child: Column(
                                                    children: [
                                                      Text("Update"),
                                                      TextField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        controller:
                                                            value.bilangan,
                                                        onSubmitted:
                                                            (_) =>
                                                                value.isian(),
                                                        decoration: InputDecoration(
                                                          border:
                                                              OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .zero,
                                                              ),
                                                          hintText:
                                                              "Update Angka",
                                                          hintStyle: TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                              top: 10,
                                                            ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
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
                                                                "Back",
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
                                                                    Colors.blue,
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
                                        Icons.system_update,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        value.delete(index);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
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
        height: 200,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text("CREATE", style: TextStyle(fontSize: 20)),
            ),
            Container(
              height: 130,
              // color: Colors.purple,
              child: Consumer<Models>(
                builder:
                    (context, value, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 250,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: value.bilangan,
                            onSubmitted: (_) => value.isian(),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                              hintText: "Hanya Angka",
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon: Icon(Icons.numbers),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          onPressed: () {
                            value.tombol();
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
