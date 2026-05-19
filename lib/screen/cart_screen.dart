import 'package:flutter/material.dart';
import 'package:food_app/components/cards_list.dart';
import 'package:food_app/screen/main_wrapper.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    List<int> productIndices = globalCartItems.keys.toList();
    double totalPrice = 0.0;
    for (int currentProductIndex in productIndices) {
      int quantity = globalCartItems[currentProductIndex] ?? 0;

      // Direkt düz yazıyı alıp sayıya (double) çeviriyoruz, tertemiz!
      double price = double.parse(cards[currentProductIndex]["price"]);

      totalPrice += (price * quantity);
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dinamik başlık: Sepette kaç farklı ürün olduğunu söyler
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "${productIndices.length} items in cart",
                style: const TextStyle(
                  color: Color(0xFF8366AA),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Eğer sepet boşsa ekranda uyarı göster, doluysa ürünleri listele
            productIndices.isEmpty
                ? const Expanded(
                    child: Center(
                      child: Text("Sepetinizde ürün bulunmamaktadır."),
                    ),
                  )
                : SizedBox(
                    height: 350,
                    child: ListView.builder(
                      itemCount: productIndices.length,
                      itemBuilder: (context, index) {
                        // 🎯 İşte o anki ürünün gerçek indeksi (m yerine geçiyor)
                        int currentProductIndex = productIndices[index];
                        // Bu üründen kaç tane eklendiği
                        int quantity =
                            globalCartItems[currentProductIndex] ?? 1;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 130,
                                width: 107,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white,
                                ),
                                child: Image.asset(
                                  cards[currentProductIndex]["image"],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    top: 15,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                        ),
                                        child: Text(
                                          cards[currentProductIndex]["title"],
                                          style: const TextStyle(
                                            fontSize: 17,
                                            color: Color(0xFF8856CC),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                        ),
                                        child: Text(
                                          cards[currentProductIndex]["price"],
                                          style: const TextStyle(
                                            fontSize: 28,
                                            color: Color(0xFF8366AA),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                globalCartItems[currentProductIndex] =
                                                    quantity + 1;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.add_circle_outline_outlined,
                                              color: Color(0xFF8D59D9),
                                              size: 30,
                                            ),
                                          ),
                                          Text(
                                            "$quantity",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (quantity > 1) {
                                                  globalCartItems[currentProductIndex] =
                                                      quantity - 1;
                                                } else {
                                                  // 1'den aşağı düşerse sepetten tamamen sil
                                                  globalCartItems.remove(
                                                    currentProductIndex,
                                                  );
                                                }
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.remove_circle_outline,
                                              color: Color(0xFF8D59D9),
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    // Çarpıya basınca direkt sepetten çıkart
                                    globalCartItems.remove(currentProductIndex);
                                  });
                                },
                                icon: const Icon(
                                  Icons.cancel_outlined,
                                  color: Color(0xFFF54848),
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total: ",
                  style: TextStyle(fontSize: 25, color: Color(0xFF8366AA)),
                ),
                Text(
                  "\$${totalPrice.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 25, color: Color(0xFF8366AA)),
                ),
              ],
            ),
            SizedBox(height: 30,),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(25),
              ),
              textColor: Colors.white,
              minWidth: 350,
              color: Color(0xFF9C58A2),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("Checkout", style: TextStyle(fontSize: 31)),
              ),
              onPressed: () {},
            ),
            
            Center(
              child: TextButton(onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainWrapper()), (route) => false,);
                
              }, child: Text("Back to menu" , style: TextStyle(
                fontSize: 18
              ),)),
            )
          ],
        ),
      ),
    );
  }
}
