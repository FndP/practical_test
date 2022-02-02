import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'vendor_screen.dart';

class DashBoardControllerScreen extends StatefulWidget {
  const DashBoardControllerScreen({Key? key}) : super(key: key);

  @override
  _DashBoardControllerScreenState createState() =>
      _DashBoardControllerScreenState();
}

class _DashBoardControllerScreenState extends State<DashBoardControllerScreen> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        child: Container(
          color: const Color(0xFFF9F9F9),
          padding: const EdgeInsets.only(top: 48.0),
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(onTap:(){
                      showToast("Menu");
                    },child: Image.asset("assets/ic_menu.png", height: 30, width: 30)),
                    Text(
                      'My Vendors',
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: (){
                        showToast("add");
                      },
                        child: Image.asset("assets/ic_add.png", height: 25, width: 25))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                child: TextField(
                  controller: _searchController,
                  maxLines: 1,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search_rounded, size: 24,),
                      prefixIconColor: Colors.grey[800],
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                      ),
                      filled: true,
                      hintStyle: GoogleFonts.lato(
                          color: Colors.grey[800],
                          fontSize: 18,),
                      hintText: "Search",
                      fillColor: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        preferredSize: const Size.fromHeight(120.0),
      ),
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: const [VendorScreen(), VendorScreen()],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFFFF7F50),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: GoogleFonts.lato(
              color: const Color(0xFFFF7F50),
              fontSize: 14,
              fontWeight: FontWeight.bold),
          unselectedLabelStyle: GoogleFonts.lato(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image.asset(
                    "assets/${_currentIndex == 0 ? "ic_vendor_selected" : "ic_vendor"}.png",
                    height: 30,
                    width: 30),
                label: 'Vendor'),
            BottomNavigationBarItem(
                icon: Image.asset(
                    "assets/${_currentIndex == 1 ? "ic_showroom_selected" : "ic_showroom"}.png",
                    height: 30,
                    width: 30),
                label: 'Showroom'),
          ],
        ),
      ),
    );
  }

  showToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
