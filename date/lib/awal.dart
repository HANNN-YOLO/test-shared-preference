import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers.dart';
import 'package:intl/intl.dart';

class Awal extends StatelessWidget {
  static const harus = "Awal";
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
                "https://i.pinimg.com/736x/f3/89/86/f38986152a49e4c9444ce192bb6bf829.jpg",
              ),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        title: Text("CRUD DATE", style: TextStyle(color: Colors.white)),
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
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 35),
                height: 83,
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
                            "https://i.pinimg.com/736x/6a/f2/ae/6af2ae041866c4aa5f291bdee55ce10f.jpg",
                          ),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "READ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 750,
                child: Consumer<Providers>(
                  builder:
                      (context, value, child) => ListView.builder(
                        itemCount: value.date.length,
                        itemBuilder:
                            (context, index) => ListTile(
                              title: Text(
                                DateFormat(
                                  'dd-MM-yyyy',
                                ).format(value.date[index]),
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
        height: 150,
        width: double.infinity,
        child: Consumer<Providers>(
          builder:
              (context, value, child) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 250,
                    child: TextField(
                      readOnly: true,
                      controller: value.hari,
                      onSubmitted: (_) => value.call(context),
                      onTap: () => value.call(context),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        hintText: "Input Date",
                        hintStyle: TextStyle(color: Colors.grey),
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
                      FocusScope.of(context).unfocus();
                      value.create(context);
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
