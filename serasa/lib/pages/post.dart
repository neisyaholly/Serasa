import 'package:flutter/material.dart';
import 'package:serasa/pages/navbar.dart';
// import 'package:serasa/mapselection.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() {
    return _Post();
  }
}

void sementara() {
  return;
}

class _Post extends State<Post> {
  late DateTime _selectedDate;
  final _tglLahirController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now(); // Initialize with the current date
    _tglLahirController.text = _formatDate(_selectedDate);
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary:
                  Color.fromARGB(255, 237, 95, 85), // Change the primary color
              onPrimary: Color(0xFFFFFEF8), // Change the text color on primary
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _tglLahirController.text = _formatDate(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 254, 248, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigationBarExample(
                                      initialIndex: 3),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFFED6055),
                          size: 20,
                        ),
                      ),
                      const Text(
                        'Post',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Opacity(
                        opacity: 0,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 35.0),
                  child: Container(
                    width: 350,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Center(
                        child: Image.asset(
                            "assets/images/detailProduk/cireng.jpg",
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 1.5,
                  width: 350,
                  color: const Color.fromARGB(39, 0, 0, 0),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nama",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 350,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Ketik nama produkmu di sini',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                width: 350,
                                color: Color.fromARGB(39, 0, 0, 0),
                              ))),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15, left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Harga",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500)),
                      Row(
                        children: [
                          Text("Rp ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal)),
                          SizedBox(
                            width: 330,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Ketik harga produkmu di sini',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal),
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    width: 350,
                                    color: Color.fromARGB(39, 0, 0, 0),
                                  ))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Tanggal Kedaluwarsa",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500)),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      // Expanded(
                      SizedBox(
                        width: 350,
                        child: SizedBox(
                          height: 30,
                          child: TextFormField(
                            onTap: () {
                              _selectDate(context);
                            },
                            controller: _tglLahirController,
                            decoration: const InputDecoration(
                              labelText: 'Pilih Tanggal',
                              suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(255, 255, 255, 255),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 7.0, horizontal: 12.0),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Color(0xFFE45C50)),
                              ),
                              labelStyle: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.5,
                  width: 350,
                  color: const Color.fromARGB(67, 152, 152, 152),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 30),
                  child: Container(
                    width: 350,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(child: Text("location")),
                  ),
                ),
                SizedBox(
                  width: 342,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const BottomNavigationBarExample(initialIndex: 3),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 244, 99, 88),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(10),
                    ),
                    child: const Text("Post",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}