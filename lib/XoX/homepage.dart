import 'package:flutter/material.dart';
import 'package:tic_tac_toe/XoX/3x3.dart';
import '4x4.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.orangeAccent,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Center(child: Text('Tic Tac Toe',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w500),)),

           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('X',style: TextStyle(fontSize: 65,color: Colors.blue[400],fontWeight: FontWeight.w900),),
               SizedBox(width: 10,),
                  Text('O',style: TextStyle(fontSize: 65,color: Colors.green[300],fontWeight: FontWeight.w900),),
             ],
           ),

            SizedBox(height: 90,),
            const Center(child: Text('choose your play mode',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),)),
            SizedBox(height: 40,),

           GestureDetector(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => const mode3(),));
             },
             child: Container(
               width: 200,
               height: 45,
               padding: const EdgeInsets.all(10),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(30),
                 color: Colors.grey[800],
               ),
               child: const Center(child: Text('3x3 Mode',
                 style: TextStyle(
                     color: Colors.white,
                     fontSize: 20),)),
             ),
           ),

            SizedBox(height: 40,),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const mode4(),));
              },
              child: Container(
                width: 200,
                height: 45,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[800],
                ),
                child: const Center(child: Text('4x4 Mode',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20),)),
              ),
            ),

            SizedBox(height: 40,),

            const Center(child: Text('created by Noor',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300,),)),

          ],
        ),
      ),
    );

  }
}

