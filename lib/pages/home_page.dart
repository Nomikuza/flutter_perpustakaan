// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:first_flutter_vscode/pages/add_book.dart';
import 'package:first_flutter_vscode/pages/add_student.dart';
import 'package:first_flutter_vscode/pages/qr_scanner.dart';
import 'package:first_flutter_vscode/pages/returning_book.dart';
import 'package:first_flutter_vscode/pages/search_screen.dart';
import 'package:first_flutter_vscode/util/emoticon_face.dart';
import 'package:first_flutter_vscode/util/exercise_tile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  

  @override
  State<HomePage> createState() => _HomePageState();
}
@override
  int _selectedIndex = 0;

  //  create list of screens

  final List<Widget> _NavScreens = <Widget>[
    HomePage(), 
    SearchScreen()
  ];

//  sign user out
void signOut() {
  FirebaseAuth.instance.signOut();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],          
          body: SafeArea(      
              child: Column(
              children: [                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      children: [
                        //  greetings row
                        Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //  Hi Jared!
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi Jared!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '23 Jan 2024',
                              style: TextStyle(color: Colors.blue[200]),
                              )
                            ],
                          ),
                  
                      //  Notification
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                    ],
                                ),
                      SizedBox(
                        height: 25,
                      ),              
                                //  search bar
                    Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(12)
                      ),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Search',
                              style: TextStyle(
                                color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  
                    SizedBox(
                      height: 25,
                    ),
                  
                      //  how do you feel?                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Menu',
                            style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                          ),                
                          Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          ),
                        ],
                      ),
                  
                      SizedBox(
                      height: 25,
                    ),
                  
                    //  menu
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      //  Tambah buku
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddBook(), 
                                )
                            ),
                            child: EmoticonFace(
                              icon: Icons.library_books,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Buku',                       
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              ),
                          ),
                        ],
                      ),
                  
                      //  Peminjaman
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                height: 750,
                                color: Colors.white,
                              )),
                            child: EmoticonFace(
                              icon: Icons.library_books,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Peminjaman',                       
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              ),
                          ),
                        ],
                      ),
                  
                      //  Pengembalian
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => showModalBottomSheet(
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              context: context,
                              builder: (context) => QRScanner(
                                
                              )
                              ),
                            child: EmoticonFace(
                              icon: Icons.sports_bar,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Pengembalian',                       
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              ),
                          ),
                        ],
                      ),
                  
                      //  Tambah Anggota
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddStudent(), 
                                )
                            ),
                            child: EmoticonFace(
                              icon: Icons.badge_rounded,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Mahasiswa',                       
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              ),
                          ),
                        ],
                      ),
                    ],
                    ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32),),
                      child: Container(                    
                        padding: EdgeInsets.all(25),
                        height: 500,
                        color: Colors.grey[200], //boxdec
                        child: Center(
                          child: Column(
                            children: [
                              //  exercise heading
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Exercises',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold, 
                                      fontSize: 20,
                                      ),
                                    ),
                                  Icon(Icons.more_horiz),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                    
                              //  listview of exercises
                              Expanded(
                                child: ListView(
                                  children: [
                                    ExerciseTile(
                                      icon: Icons.favorite,
                                      exerciseName: 'Speaking Skills',
                                      numberOfExercises: 16,
                                      color: Colors.orange,
                                    ),
                                    ExerciseTile(
                                      icon: Icons.person,
                                      exerciseName: 'Reading Skills',
                                      numberOfExercises: 8,
                                      color: Colors.green,
                                    ),
                                    

                                    
                                    IconButton(
                                      onPressed: signOut, icon: Icon(Icons.logout),
                                      ),
                                    
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
              ),            
          ),
      );
    }
  }