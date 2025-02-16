import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/components/grocery_item_tile.dart';
import 'package:grocery_app/model/cart_model.dart';
import 'package:grocery_app/pages/cart_page.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return CartPage();
          }),
        ),
        backgroundColor: Colors.black,
        child: Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //good morning
          const SizedBox(height: 40), // for spacing we could add a sizedbox
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "WELCOME BACK ",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 101, 82, 101)),
            ),
          ),
          const SizedBox(height: 10),
          //lets oder fresh tiems for u
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Let's Order Fresh Items For You ",
              style: GoogleFonts.notoSerif(
                  fontSize: 35, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //divider
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Divider(),
          ),
          // grid
          const SizedBox(
            height: 25,
          ),

          Expanded(child: Consumer<cartModel>(builder: (context, value, child) {
            return GridView.builder(
                itemCount: value.shopItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return GroceryItemTile(
                    ItemName: value.shopItems[index][0],
                    ItemPrice: value.shopItems[index][1],
                    ImagePath: value.shopItems[index][2],
                    color: value.shopItems[index][3],
                    onpressed: () {
                      Provider.of<cartModel>(context, listen: false).addItemToCart(index);
                    },
                  );
                });
          })),
        ],
      )),
    );
  }
}
