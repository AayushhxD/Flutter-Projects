import 'package:brand_store/Checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Map<String, dynamic>> cartItems = [
    {
      'image': 'assets/Rectangle 980 (1).png',
      'name': 'Premium Togerine Shirt',
      'color': 'Yellow',
      'size': 'Size 8',
      'price': 257.85,
      'quantity': 1,
    },
    {
      'image': 'assets/Rectangle 980 (1).png',
      'name': 'Premium Togerine Shirt',
      'color': 'Yellow',
      'size': 'Size 8',
      'price': 257.85,
      'quantity': 1,
    },
  ];

  void _deleteItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void _incrementQuantity(int index) {
    setState(() {
      cartItems[index]['quantity']++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      }
    });
  }

  double _calculateTotal() {
    double total = 0;
    for (var item in cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Color.fromRGBO(13, 13, 14, 1),
                  ),
                ),
                const SizedBox(
                  width: 130,
                ),
                Text(
                  "Cart",
                  style: GoogleFonts.imprima(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: const Color.fromRGBO(13, 13, 14, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "My Orders ",
              style: GoogleFonts.imprima(
                fontWeight: FontWeight.w400,
                fontSize: 40,
                color: const Color.fromRGBO(13, 13, 14, 1),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Slidable(
                    closeOnScroll: true,
                    endActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) => _deleteItem(index),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 155,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Image.asset(item['image']),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: GoogleFonts.imprima(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: const Color.fromRGBO(13, 13, 14, 1),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  item['color'],
                                  style: GoogleFonts.imprima(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color:
                                        const Color.fromRGBO(121, 119, 128, 1),
                                  ),
                                ),
                                Text(
                                  item['size'],
                                  style: GoogleFonts.imprima(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color:
                                        const Color.fromRGBO(121, 119, 128, 1),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "\$ ${item['price'].toStringAsFixed(2)}",
                                      style: GoogleFonts.imprima(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: const Color.fromRGBO(
                                            121, 119, 128, 1),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: () =>
                                              _decrementQuantity(index),
                                        ),
                                        Text(
                                          "${item['quantity']}",
                                          style: GoogleFonts.imprima(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            color: const Color.fromRGBO(
                                                13, 13, 14, 1),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: () =>
                                              _incrementQuantity(index),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                width: 315,
                height: 1,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(227, 227, 227, 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Items (${cartItems.length})",
                        style: GoogleFonts.imprima(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: const Color.fromRGBO(121, 119, 128, 1),
                        ),
                      ),
                      Text(
                        "\$ ${_calculateTotal().toStringAsFixed(2)}",
                        style: GoogleFonts.imprima(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: const Color.fromRGBO(13, 13, 14, 1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Standard Delivery",
                        style: GoogleFonts.imprima(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: const Color.fromRGBO(121, 119, 128, 1),
                        ),
                      ),
                      Text(
                        "\$ 12.00",
                        style: GoogleFonts.imprima(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: const Color.fromRGBO(13, 13, 14, 1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Payment",
                        style: GoogleFonts.imprima(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: const Color.fromRGBO(121, 119, 128, 1),
                        ),
                      ),
                      Text(
                        "\$ ${(_calculateTotal() + 12.00).toStringAsFixed(2)}",
                        style: GoogleFonts.imprima(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: const Color.fromRGBO(13, 13, 14, 1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const Checkout();
                      }));
                    },
                    child: Container(
                      height: 62,
                      width: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: const Color.fromRGBO(255, 122, 0, 1),
                      ),
                      child: Center(
                        child: Text(
                          "Checkout Now ",
                          style: GoogleFonts.imprima(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
