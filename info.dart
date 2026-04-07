import 'dart:math' as math;


import 'package:app/screens/items.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Details extends StatelessWidget {
  final String myshoe;
  final String myprice;

  const Details({super.key, required this.myshoe, required this.myprice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text("Iron Achle",style: GoogleFonts.dancingScript(color: Colors.white),))),
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
        
            
         
            children: [
              SizedBox(height: 30,),
                 Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(color: Colors.grey.shade200,borderRadius: BorderRadius.circular(12)),
                        child: Column(children: [
                           SizedBox(height: 30,),
                           Center(
                             child: Transform.rotate(
                               angle: -math.pi / 4,
                               child: Padding(
                                 padding: const EdgeInsets.only(right: 40),
                                 child: Container(
                                                   height: 100,
                                                   width: 180,
                                                  decoration: BoxDecoration(
                                                   
                                                   image: DecorationImage(image: AssetImage(myshoe),fit: BoxFit.fill)),
                                                  ),
                               ),
                             ),
                           )
                        ],),
                      ),
            SizedBox(height: 15,),
            Center(
              child: Column(
                
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Padding(
                         padding: const EdgeInsets.all(8),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                  
                           
                          
                          ],
                         ),
                       ),
                     
                   
                      SizedBox(height: 25,),
                      Text(myprice,style: GoogleFonts.aboreto(fontSize: 25,fontWeight: FontWeight.bold),),
                      Row(
                        children: [
                          Text("4.5",style: GoogleFonts.poppins(fontSize: 20),),
                          Icon(Icons.star,color: Colors.orange,)
                        ],
                      ),
                      SizedBox(height: 25,),
                      Text("The Nike Air Force 1, introduced in 1982, is a legendary basketball sneaker designed by Bruce Kilgore, featuring the first-ever Nike Air - -cushioning in a hoops shoe",style: GoogleFonts.poppins(color: Colors.grey.shade500,fontSize: 12),),
                      
            
                      Padding(
                        padding: const EdgeInsets.only(top: 280),
                        child: Container(
                          height:35 ,
                          width: 420,
                          child: Center(child: InkWell(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(),)),
                            child: Text("ADD TO CARD",style: GoogleFonts.poppins(color: Colors.white),))),
                          decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(8)),
                          
                          
                          
                          ),
                      ),
                      
                    
                      ],
                    ),
                  ),
                 
                ],
              ),
          
              
            ),
            
          
          ],),
        ),
      ),
    );
  }
}