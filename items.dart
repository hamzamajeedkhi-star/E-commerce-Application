import 'package:app/database/dbhelper.dart';

import 'package:app/model/mymodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final DBHelper db = DBHelper();
  List<Shoe> cartItems = [];

  @override
  void initState() {
    super.initState();
    loadCart();
  }

  // 🔹 Load cart data from database
  void loadCart() async {
    final data = await db.getCartItems();
    setState(() {
      cartItems = data;
    });
  }

  // 🔹 Delete item
  void deleteItem(int id) async {
    await db.removeFromCart(id);
    loadCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,title: Center(child: Text("Cart page",style: GoogleFonts.dancingScript(color: Colors.white),)),),
      body: SafeArea(
        child: Column(
          children: [
           
        
      
                    Expanded(
                          child: ListView.builder(
                            itemCount: cartItems.length,
                            itemBuilder: (context, index) {
                              final item = cartItems[index];
              
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    leading: Image.asset(
                                      item.image,
                                      height: 50,
                                      width: 50,
                                    ),
                                    title: Text(
                                      item.name,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "${item.price}  x${item.quantity}",
                                      style: GoogleFonts.aboreto(),
                                    ),
                                    trailing: IconButton(
                                      onPressed: () =>
                                          deleteItem(item.id!),
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          
    );
  }
}