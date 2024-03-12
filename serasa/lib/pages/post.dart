import 'dart:io';
import 'package:flutter/material.dart';
import 'package:serasa/classes/produk_komunitas.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:serasa/functions/functions.dart';
import 'package:image_picker/image_picker.dart';
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
  final _expController = TextEditingController();
  final _namaController = TextEditingController();
  final _hargaController = TextEditingController();
  final _deskripsiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchProdukKomunitas();
    _selectedDate = DateTime.now(); // Initialize with the current date
    _expController.text = _formatDate(_selectedDate);
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
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
        _expController.text = _formatDate(picked);
      });
    }
  }

  List<ProdukKomunitas> _produkKomunitass = [];

  void _fetchProdukKomunitas() async {
    List<ProdukKomunitas> fetchedProdukKomunitass =
        await fetchProdukKomunitass();
    setState(() {
      _produkKomunitass = fetchedProdukKomunitass;
    });
  }

  File? _imageFile;
  String? _imageUrl;

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
                  padding:
                      const EdgeInsets.only(top: 15, left: 15.0, right: 15),
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
                ElevatedButton(
                      onPressed: () {
                        openCamera(context);
                      },
                      child: Text('Open Camera'),
                    ),
                
                      _imageFile != null
                          ?
                          Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Image.file(
                                _imageFile!, fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(height: 10,),
                            ],
                          ) 
                          : SizedBox(),
                Container(
                  height: 1.5,
                  width: 350,
                  color: const Color.fromARGB(39, 0, 0, 0),
                ),
                Padding(
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
                          controller: _namaController,
                          decoration: InputDecoration(
                              hintText: 'Ketik nama produkmu di sini',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.5,
                  width: 350,
                  color: const Color.fromARGB(39, 0, 0, 0),
                ),
                Padding(
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
                              controller: _hargaController,
                              decoration: InputDecoration(
                                  hintText: 'Ketik harga produkmu di sini',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal),
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1.5,
                  width: 350,
                  color: const Color.fromARGB(39, 0, 0, 0),
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
                      const Padding(padding: EdgeInsets.only(bottom: 20)),
                      // Expanded(
                      SizedBox(
                        width: 350,
                        child: SizedBox(
                          height: 30,
                          child: TextFormField(
                            onTap: () {
                              _selectDate(context);
                            },
                            controller: _expController,
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
                  padding: EdgeInsets.only(top: 15, left: 30, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Lokasi",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 330,
                            child: Text(
                              _produkKomunitass.isNotEmpty
                                  ? _produkKomunitass[4].kab_kota!
                                  : 'Tidak ada produk',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                        ],
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
                  padding:
                      EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Deskripsi",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors
                              .white, // Set the background color of the container
                          borderRadius: BorderRadius.circular(
                              5), // Set the border radius of the container
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(
                                  0.6), // Set the shadow color with opacity
                              spreadRadius:
                                  0.5, // Set the spread radius of the shadow
                              blurRadius:
                                  3, // Set the blur radius of the shadow
                              offset: const Offset(
                                  0, 0.1), // Set the offset of the shadow
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _deskripsiController,
                          maxLines: 5, // Set the maximum number of lines
                          decoration: InputDecoration(
                            hintText: 'Ketik deskripsi produk',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color(0xFFFFFFFF),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 7.0, horizontal: 12.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color.fromRGBO(0, 0, 0, 0.6),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                            // Add a border around the text field
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
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 342,
                  child: ElevatedButton(
                    onPressed: () async {
                      final userID = currentUser!.id!;
                      final nama = _namaController.text;
                      final harga = int.tryParse(_hargaController.text);
                      final exp = _expController.text;
                      final deskripsi = _deskripsiController.text;
                      const foto = "https://raw.githubusercontent.com/neisyaholly/Serasa/main/serasa/assets/images/produk_komunitas/sotokuning.png";
                      FocusScope.of(context).unfocus();
                      ProdukKomunitas? pk = await addProdukKomunitas(
                          userID, nama, harga, exp, deskripsi, foto);

                      if (pk is ProdukKomunitas) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const BottomNavigationBarExample(
                                    initialIndex: 3),
                          ),
                        );
                      } else {
                        print("error");
                      }
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
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> openCamera(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _imageUrl = pickedFile.path;
      });
    } else {
      print('No image selected.');
    }
  }
}
