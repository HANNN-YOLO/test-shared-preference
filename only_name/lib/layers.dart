import 'package:flutter/material.dart';
import 'package:only_name/tugas.dart';
import 'package:provider/provider.dart';

class Layers extends StatelessWidget {
  static const nameroute = '/layers';
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
                "https://i.pinimg.com/474x/69/42/c6/6942c66fc97945e987c3ddeee0679296.jpg",
              ),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
        title: Text("String", style: TextStyle(color: Colors.white)),
        actions: [
          Container(
            child: Builder(
              builder:
                  (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(Icons.access_alarm, color: Colors.red),
                  ),
            ),
          ),
        ],
      ),

      drawer: Drawer(
        width: 250,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 25),
              color: Colors.cyan,
              height: 85,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://i.pinimg.com/736x/8d/cc/91/8dcc91c66ae437295f6648ca2818d0bf.jpg",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "History String",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 10),
            Expanded(
              child: Container(
                height: 150,
                // color: Colors.red,
                child: Consumer<Tugas>(
                  builder:
                      (context, value, child) => ListView.builder(
                        itemCount: value.siapasaja.length,
                        itemBuilder:
                            (ctx, i) => ListTile(
                              title: Text(value.siapasaja[i]),
                              trailing: Container(
                                // height: 50,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        value.siapa.text = value.siapasaja[i];
                                        showDialog(
                                          context: context,
                                          builder:
                                              (ctx) => AlertDialog(
                                                title: Text("Ubah String"),
                                                content: Container(
                                                  height: 120,
                                                  child: Column(
                                                    children: [
                                                      TextField(
                                                        keyboardType:
                                                            TextInputType.name,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .words,
                                                        controller: value.siapa,
                                                        onSubmitted:
                                                            (_) => value.isi(),
                                                        decoration: InputDecoration(
                                                          hintText:
                                                              "Perubahan Tersimpan",
                                                          hintStyle: TextStyle(
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 10),
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
                                                                "Batal",
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
                                                                value.update(i);
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
                                        value.delete(i);
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
        width: double.infinity,
        height: 100,
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 300,
              child: Consumer<Tugas>(
                builder:
                    (context, value, child) => TextField(
                      controller: value.siapa,
                      onSubmitted: (_) => value.isi(),
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        hintText: "Hanya String",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.person_4),
                      ),
                    ),
              ),
            ),
            Container(
              width: 80,
              child: Consumer<Tugas>(
                builder:
                    (context, value, child) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
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
    );
  }
}
