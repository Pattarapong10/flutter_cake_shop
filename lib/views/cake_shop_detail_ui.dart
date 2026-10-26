// ignore_for_file: sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_cake_shop_app/models/cake_shop.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// ignore: must_be_immutable
class CakeShopDetailUI extends StatefulWidget {
  // สร้างตัวแปรเก็บค่าที่ส่งมาจากอีกหน้าจอหนึ่ง
  CakeShop? cakeShopshow;

  // เอาตัวแปรที่สร้างมารับค่าที่จะถูกส่งมา
  CakeShopDetailUI({super.key, this.cakeShopshow});

  @override
  State<CakeShopDetailUI> createState() => _CakeShopDetailUIState();
}

class _CakeShopDetailUIState extends State<CakeShopDetailUI> {
  // เมธอดโทร
  Future<void> _makePhoneCall(String phoneNumber) async {
    final launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  // เมธอดเปิดเว็บไซต์ เปิดเฟซบุ๊ก เปิดแผนที่
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.cakeShopshow!.name!,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 50.5,
            bottom: 50.5,
            left: 45.0,
            right: 45.0,
          ),
          child: Center(
            child: Column(
              children: [
                // ส่วนของรูป 1 รูป ---------------
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    widget.cakeShopshow!.image1!,
                    width: 120.0,
                    height: 70.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                // ส่วนของการแสดงรูป 2 รูป ---------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        widget.cakeShopshow!.image2!,
                        width: 120.0,
                        height: 70.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        widget.cakeShopshow!.image3!,
                        width: 120.0,
                        height: 70.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                // ส่วนแสดงชื่อร้าน ----------------
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ชื่อร้าน 🏪',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShopshow!.name!,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                // ส่วนเวลาเปิด-ปิดร้าน ----------------
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เวลาเปิดปิด ⏰',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShopshow!.openCloseTime!,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                // ส่วนแสดงรายละเอียดร้าน ----------------
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'รายละเอียดร้าน 📝',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShopshow!.description!,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                // ส่วนแสดงที่อยู่ร้าน ----------------
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ที่อยู่ร้าน 📍',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShopshow!.address!,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                // ส่วนโทรไปยังเบอร์โทรร้าน ----------------
                ElevatedButton(
                  onPressed: () {
                    // เรียกใช้เมธอดโทร
                    _makePhoneCall(widget.cakeShopshow!.phone!);
                  },
                  child: Text(
                    '📞 ${widget.cakeShopshow!.phone!}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      200.0,
                      55.0,
                    ),
                    backgroundColor: Colors.green,
                  ),
                ),
                // ส่วนแสดงเว็บไซต์ร้าน และเปิดเว็บไซต์ได้ ----------------
                SizedBox(
                  height: 10.0,
                ),
                ListTile(
                  onTap: () {
                    _launchInBrowser(Uri.parse(widget.cakeShopshow!.website!));
                  },
                  leading: FaIcon(
                    FontAwesomeIcons.earthAsia,
                    color: Colors.amber,
                  ),
                  trailing: Icon(
                    Icons.link,
                  ),
                  title: Text(
                    widget.cakeShopshow!.website!,
                  ),
                ),
                // ส่วนแสดง Facebook ร้าน และเปิด Facebook ได้ ----------------
                ListTile(
                  onTap: () {
                    _launchInBrowser(Uri.parse(widget.cakeShopshow!.facebook!));
                  },
                  leading: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                  ),
                  trailing: Icon(
                    Icons.link,
                  ),
                  title: Text(
                    widget.cakeShopshow!.facebook!,
                  ),
                ),
                // ส่วนแสดงแผนที่ร้าน และเปิดแผนที่ได้ ----------------
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 450,
                  child: FlutterMap(
                    options: MapOptions(
                      // กำหนดพิกัดเริ่มต้น (ศูนย์กลางแผนที่) และระดับการซูม (Zoom)
                      initialCenter: LatLng(
                        double.parse(widget.cakeShopshow!.latitude!),
                        double.parse(widget.cakeShopshow!.longitude!),
                      ), // กรุงเทพมหานคร
                      initialZoom: 13.0,
                    ),
                    children: [
                      // 1. เลเยอร์แสดงภาพแผนที่ (Tile Layer) จาก OpenStreetMap
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName:
                            'com.example.flutter_cake_shop_app', // เปลี่ยนเป็น Package Name ของตัวเอง
                      ),

                      // 2. เลเยอร์สำหรับปักหมุดหรือแสดง Marker บนแผนที่
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(
                              double.parse(widget.cakeShopshow!.latitude!),
                              double.parse(widget.cakeShopshow!.longitude!),
                            ),
                            width: 80.0,
                            height: 80.0,
                            child: GestureDetector(
                              onTap: () {
                                // เปิด Google Maps
                                _launchInBrowser(
                                  Uri.parse(
                                    'https://www.google.com/maps/@${widget.cakeShopshow!.latitude!},${widget.cakeShopshow!.longitude!},15z',
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.red,
                                size: 40.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
