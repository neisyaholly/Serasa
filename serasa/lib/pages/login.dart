import 'package:flutter/material.dart';
import 'package:serasa/classes/user.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:serasa/pages/register.dart';
import 'package:video_player/video_player.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  late VideoPlayerController _controller;

  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/Timeline1.mp4')
      ..initialize().then((_) {
        setState(() {}); // Ini opsional, tergantung kebutuhan Anda
        _controller.setLooping(true); // Set looping video
        _controller.play(); // Play video secara otomatis setelah diinisialisasi
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFFED6055)),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 0),
              width: _controller.value.size.width *0.30,
              height: _controller.value.size.height * 0.26,
              child: VideoPlayer(_controller)),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 35, right: 35),
                width: MediaQuery.of(context).size.width * 1,
                decoration: const BoxDecoration(
                    color: Color(0xFFFFFEF8),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
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
                      'MASUK',
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
                      height: 30,
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
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                suffixIcon: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: _togglePasswordVisibility,
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
                      height: 70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            final email = _emailController.text;
                            final password = _passwordController.text;
                            User? user = await loginUser(email, password);
                            if (user is User) {
                              // ignore: use_build_context_synchronously
                              FocusScope.of(context).unfocus();
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BottomNavigationBarExample(
                                          initialIndex: 0),
                                ),
                              );
                            } else {
                              print("Login Failed!");
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
                          child: const Text('Masuk'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Belum Punya Akun? ',
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
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.zero),
                          ),
                          child: const Text(
                            'Daftar, yuk!',
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
