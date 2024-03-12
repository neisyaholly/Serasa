import 'package:flutter/material.dart';
import 'package:serasa/classes/user.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/pages/navbar.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({super.key});

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _telpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFFEF8),
      body: Container(
        margin: const EdgeInsets.only(top: 55),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const BottomNavigationBarExample(initialIndex: 4),
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
                    "Edit Profil",
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9).withOpacity(0.4)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: NetworkImage(currentUser!.foto!),
                            fit: BoxFit.contain)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Ubah Foto Profil",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFFED6055)),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Nama",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        child: TextField(
                          controller: _namaController,
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFFACFC7),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            hintText: "Ketik namamu di sini",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Email",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFFACFC7),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            hintText: "Ketik emailmu di sini",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Nomor Telepon",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        child: TextField(
                          controller: _telpController,
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFFACFC7),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            hintText: "Ketik nomor teleponmu di sini",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final name = _namaController.text;
                      final email = _emailController.text;
                      final telp = _telpController.text;
                      final userID = currentUser!.id!;

                      User? user = await editProfil(name, email, telp, userID);
                      if (user is User) {
                        // ignore: use_build_context_synchronously
                        FocusScope.of(context).unfocus();
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const BottomNavigationBarExample(
                                    initialIndex: 4),
                          ),
                        );
                      } else {
                        print("Update Failed!");
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        Color(0xFFE45C50),
                      ),
                      foregroundColor: const MaterialStatePropertyAll(
                        Color(0xFFFFFAFA),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      fixedSize: const MaterialStatePropertyAll(
                        Size(140, 38),
                      ),
                      textStyle: const MaterialStatePropertyAll(
                        TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.zero),
                    ),
                    child: const Text('Simpan'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}