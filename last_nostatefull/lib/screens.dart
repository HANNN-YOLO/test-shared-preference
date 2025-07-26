import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'penghubung.dart';

class Screens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // DateTime pilihan = DateTime.now();
    TextEditingController editan = TextEditingController();
    TextEditingController nomor = TextEditingController();
    // TextEditingController tgl = TextEditingController();
    final history = Provider.of<Penghubung>(context);

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: NetworkImage(
                "https://i.pinimg.com/736x/ec/91/97/ec919741549564aae65f3716c74ad3e6.jpg",
              ),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
        title: Text("To Do List", style: TextStyle(color: Colors.white)),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Builder(
              builder:
                  (context) => IconButton(
                    onPressed: () {
                      history.read();
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(Icons.menu),
                  ),
            ),
          ),
        ],
      ),

      drawer: Drawer(
        width: 250,
        // backgroundColor: Colors.red,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, top: 25),
              height: 85,
              color: Colors.cyan,
              child: Row(
                children: [
                  Container(
                    // alignment: Alignment.bottomLeft,
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://i.pinimg.com/474x/ac/01/47/ac014721e099bf111e4ee93ad00843a6.jpg",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "List Data",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 300,
                child: Consumer<Penghubung>(
                  builder:
                      (context, value, child) => ListView.builder(
                        itemCount: value.dumydata.length,
                        itemBuilder:
                            (context, index) => ListTile(
                              title: Text("${value.dumydata[index].nama}"),
                              subtitle: Text("${value.dumydata[index].nim}"),
                              trailing: Container(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  onPressed: () {
                                    // value.remove(index);
                                  },
                                  child: Icon(Icons.delete, color: Colors.red),
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

      body: Center(
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          height: 400,
          width: 450,
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 60),
                alignment: Alignment.bottomLeft,
                child: Text("Nama"),
              ),
              Consumer<Penghubung>(
                builder:
                    (context, value, child) => Container(
                      // color: Colors.red,
                      alignment: Alignment.center,
                      width: 300,
                      child: TextField(
                        controller: editan,
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          hintText: "Nama Tugas",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
              ),
              SizedBox(height: 30),

              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 60),
                child: Text("NIM"),
              ),
              Consumer<Penghubung>(
                builder:
                    (context, value, child) => Container(
                      width: 300,
                      child: TextField(
                        controller: nomor,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Masukkan NIM anda",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.numbers),
                          border: OutlineInputBorder(borderSide: BorderSide()),
                        ),
                      ),
                    ),
              ),
              // Container(
              //   alignment: Alignment.bottomLeft,
              //   padding: EdgeInsets.only(left: 60),
              //   child: Text("Deadline"),
              // ),
              // Consumer<Providers>(
              //   builder:
              //       (context, value, child) => Container(
              //         width: 300,
              //         child: TextField(
              //           onTap: () async {
              //             DateTime? pilih = await showDatePicker(
              //               context: context,
              //               firstDate: DateTime(1),
              //               lastDate: DateTime(3000),
              //             );
              //             if (pilih != null) {
              //               // Format tanggal untuk ditampilkan di TextField
              //               final formattedDate = DateFormat(
              //                 'dd MMM yyyy',
              //               ).format(pilih);
              //               value.tgl.text = formattedDate;

              //               // Simpan tanggal dalam format ISO untuk diproses
              //               value.savettl = pilih.toIso8601String();
              //               value.simpangtgl();
              //             }
              //             ;
              //           },
              //           controller: value.tgl,
              //           onSubmitted: (_) => value.simpangtgl(),
              //           keyboardType: TextInputType.number,
              //           readOnly: true,
              //           decoration: InputDecoration(
              //             hintText: "Kapan di Kumpul",
              //             hintStyle: TextStyle(color: Colors.grey),
              //             prefixIcon: Icon(Icons.date_range),
              //             border: OutlineInputBorder(borderSide: BorderSide()),
              //           ),
              //         ),
              //       ),
              // ),

              // Container(
              //   alignment: Alignment.bottomLeft,
              //   padding: EdgeInsets.only(left: 60),
              //   child: Text("Deadline"),
              // ),
              // Consumer<Providers>(
              //   builder:
              //       (context, value, child) => Container(
              //         width: 300,
              //         child: OutlinedButton(
              //           style: OutlinedButton.styleFrom(
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.zero,
              //             ),
              //           ),
              //           onPressed: () {
              //             showDatePicker(
              //               context: context,
              //               firstDate: DateTime(1),
              //               lastDate: DateTime(3000),
              //               initialDate: pilihan,
              //             );
              //           },
              //           child: Text(
              //             "Masukkan Tanggal Di kumpul",
              //             style: TextStyle(color: Colors.grey),
              //           ),
              //         ),
              //       ),
              // ),
              SizedBox(height: 30),
              Container(
                width: 300,
                height: 100,
                // color: Colors.purple,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Hapus",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      child: Consumer<Penghubung>(
                        builder:
                            (context, value, child) => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.cyan,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                              onPressed: () {
                                final name = editan.text;
                                final nim = nomor.text;

                                if (name.isEmpty || nim.isEmpty) {
                                  value.pemberitahuan(
                                    "Lengkapi datanya dulu",
                                    context,
                                  );
                                }

                                value.create(name, int.parse(nim), context);

                                editan.clear();
                                nomor.clear();
                              },
                              child: Text(
                                "Simpan",
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
        ),
      ),
    );
  }
}
