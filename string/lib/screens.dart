import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models.dart';

class Screens extends StatelessWidget {
  static const routing = '/Screens';
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
                "https://i.pinimg.com/474x/96/3e/40/963e4053a9979be848514e645c178341.jpg",
              ),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
        title: Text(
          "Provider String CRUD",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Container(
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
        width: 250,
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 30),
                color: Colors.cyan,
                height: 85,
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://i.pinimg.com/474x/c2/8e/cc/c28ecc453da22babe1227ff54277948e.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Read",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Consumer<Models>(
                    builder:
                        (context, value, child) => ListView.builder(
                          itemCount: value.mydata.length,
                          itemBuilder:
                              (context, index) => ListTile(
                                title: Text(value.mydata[index]),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        value.mengapa.text =
                                            value.mydata[index];
                                        showDialog(
                                          context: context,
                                          builder:
                                              (context) => AlertDialog(
                                                content: Container(
                                                  height: 150,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        child: Text("Update"),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                              top: 10,
                                                            ),
                                                        child: TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          textCapitalization:
                                                              TextCapitalization
                                                                  .words,
                                                          controller:
                                                              value.mengapa,
                                                          decoration: InputDecoration(
                                                            border:
                                                                OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .zero,
                                                                ),
                                                            hintText:
                                                                "Update String",
                                                            hintStyle:
                                                                TextStyle(
                                                                  color:
                                                                      Colors
                                                                          .grey,
                                                                ),
                                                            prefixIcon: Icon(
                                                              Icons.task_alt,
                                                            ),
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
                                                                  .spaceEvenly,
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
                                                                "Cancel",
                                                                style: TextStyle(
                                                                  color:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                              ),
                                                            ),
                                                            ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .zero,
                                                                ),
                                                                backgroundColor:
                                                                    Colors.cyan,
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
                                        Icons.update,
                                        color: Colors.cyan,
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
            ],
          ),
        ),
      ),

      body: Container(
        width: double.infinity,
        height: 100,
        child: Consumer<Models>(
          builder:
              (context, value, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 300,
                    child: TextField(
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      controller: value.mengapa,
                      onSubmitted: (_) => value.panggil(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        hintText: "Wajib String",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.task),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyanAccent,
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
