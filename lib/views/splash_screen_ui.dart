// ignore_for_file: unused_import, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_cake_shop_app/views/cake_shop_detail_ui.dart';
import 'package:flutter_cake_shop_app/views/cake_shop_list_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    // หน่วงเวลาในการแสดง Splash Screen
    Future.delayed(
      Duration(seconds: 3),
      () {
        // หลังจากหน่วงเวลา 3 วินาที ให้เปลี่ยนหน้าไปยังหน้า CakeShopDetailUI
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CakeShopListUI(),
          ),
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ชั้นที่ 1 แสดงรูปพื้นหลัง
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_welcome.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // ชั้นที่ 2 แสดงขื่อ แสดง progress indicator
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Text(
                  'สายด่วนกินเค้ก',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.042,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                Text(
                  'CAKE CALL FAST',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.028,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(184, 244, 67, 54),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                CircularProgressIndicator(
                  color: Colors.grey[800],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
