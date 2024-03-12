import 'package:flutter/material.dart';
import 'package:serasa/classes/user.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/pages/login.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:video_player/video_player.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _tglLahirController = TextEditingController();
  final _telpController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _obscureText1 = true;

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now(); // Initialize with the current date
    _tglLahirController.text = _formatDate(_selectedDate);
    _controller = VideoPlayerController.asset('assets/videos/Timeline1.mp4')
      ..initialize().then((_) {
        setState(() {}); // Ini opsional, tergantung kebutuhan Anda
        _controller.setLooping(true); // Set looping video
        _controller.play(); // Play video secara otomatis setelah diinisialisasi
      });
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
              primary: Color(0xFFE45C50), // Change the primary color
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

  late VideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFFED6055)),
        child: Column(
          children: [
            Container(
              width: _controller.value.size.width * 0.30,
              height: _controller.value.size.height * 0.26,
              child: VideoPlayer(_controller),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 35, right: 35),
                width: MediaQuery.of(context).size.width * 1,
                decoration: const BoxDecoration(
                    color: Color(0xFFFFFEF8),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.12,
                        height: MediaQuery.of(context).size.height * 0.08,
                        // color: Colors.black,
                        child: Image.asset(
                          'assets/images/logoSerasaS.png',
                        ),
                      ),
                      const Text(
                        'DAFTAR',
                        style: TextStyle(
                          color: Color(0xFFE45C50),
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 100,
                            child: Text(
                              'Nama',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 32,
                              child: TextField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  labelText: 'Nama',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFFBDED7),
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
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 100,
                            child: Text(
                              'Tgl. Lahir',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 32,
                              child: TextFormField(
                                onTap: () {
                                  _selectDate(context);
                                },
                                controller: _tglLahirController,
                                // controller: TextEditingController(
                                //   text:
                                //       '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                                // ),
                                decoration: const InputDecoration(
                                  labelText: 'Pilih Tanggal',
                                  suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFFBDED7),
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
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 100,
                            child: Text(
                              'No. Telp',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 32,
                              child: TextField(
                                controller: _telpController,
                                decoration: const InputDecoration(
                                  labelText: 'No. Telp',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFFBDED7),
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
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 100,
                            child: Text(
                              'Email',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 32,
                              child: TextField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFFBDED7),
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
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 100,
                            child: Text(
                              'Kata Sandi',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 32,
                              child: TextField(
                                obscureText: _obscureText,
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  labelText: 'Kata Sandi',
                                  suffixIcon: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      _obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: _togglePasswordVisibility,
                                  ),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xFFFBDED7),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 7.0, horizontal: 12.0),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: Color(0xFFE45C50)),
                                  ),
                                  labelStyle: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 100,
                            child: Text(
                              'Konfirmasi',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 32,
                              child: TextField(
                                obscureText: _obscureText1,
                                controller: _confirmPasswordController,
                                decoration: InputDecoration(
                                  labelText: 'Konfirmasi',
                                  suffixIcon: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      _obscureText1
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: _toggleConfirmPasswordVisibility,
                                  ),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xFFFBDED7),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 7.0, horizontal: 12.0),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: Color(0xFFE45C50)),
                                  ),
                                  labelStyle: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                        //neisya eeq
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              final name = _nameController.text;
                              final tglLahir = _tglLahirController.text;
                              final email = _emailController.text;
                              final telp = _telpController.text;
                              final password = _passwordController.text;
                              final confirmPassword =
                                  _confirmPasswordController.text;
                              FocusScope.of(context).unfocus();
                              User? user = await registerUser(name, tglLahir,
                                  telp, email, password, confirmPassword);
                              // print(name + " - " + tglLahir + " - " + telp + " - " + email + " - " + password + " - " + confirmPassword);
                              if (user is User) {
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BottomNavigationBarExample(initialIndex: 0),
                                  ),
                                );
                              } else {
                                print("Registration Failed");
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
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              fixedSize: const MaterialStatePropertyAll(
                                Size(120, 20),
                              ),
                              textStyle: const MaterialStatePropertyAll(
                                TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.zero),
                            ),
                            child: const Text('Daftar'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Sudah Punya Akun? ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins'),
                          ),
                          TextButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.zero),
                            ),
                            child: const Text(
                              'Masuk, yuk!',
                              style: TextStyle(
                                color: Color(0xFFE45C50),
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFFE45C50),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
