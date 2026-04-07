
import 'package:app/database/dbhelper.dart';

import 'package:app/model/mymodel.dart';
import 'package:app/screens/info.dart';
import 'package:app/screens/items.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class S1 extends StatefulWidget {
  const S1({super.key});

  @override
  State<S1> createState() => _S1State();
}

class _S1State extends State<S1> {
  final List<String> mypic = [
    "lib/images/s1.png",
    "lib/images/s2.png",
    "lib/images/s3.png",
    "lib/images/s4.png"
  ];

  final List<String> myprice = [
    "250\$",
    "220\$",
    "190\$",
    "170\$",
  ];

  final List<String> shoesname = [
    "Air force 1",
    "Air Max",
    "Dunk",
    "Jordan 1",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              /// 🔹 Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Iron ACHLE",
                    style: GoogleFonts.dancingScript(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cart()),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              /// 🔹 Search Bar
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Text("Search"),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              /// 🔹 Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Big Sale! Up To 75% OFF",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Grab Yours Now!",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Step Up Your Style - Find Your Perfect Pair!",
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              /// 🔹 Grid
              Expanded(
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.4,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Details(myshoe: shoesname[index], myprice: myprice[index]),)),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              mypic[index],
                              height: 80,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              myprice[index],
                              style: GoogleFonts.aboreto(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              shoesname[index],
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                      
                            /// 🔹 Add Button
                            InkWell(
                              onTap: () async {
                                final db = DBHelper();
                      
                                await db.addToCart(
                                  Shoe(
                                    image: mypic[index],
                                    price: myprice[index],
                                    name: shoesname[index],
                                  ),
                                );
                      
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Added to Cart"),
                                  ),
                                );
                              },
                              child: Container(
                                height: 30,
                                width: 90,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "ADD",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}