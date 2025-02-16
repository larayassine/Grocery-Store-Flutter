import 'package:flutter/material.dart';
import 'package:grocery_app/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart ..."),
      ),
      body: Consumer<cartModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartItems.length,
                  padding: const EdgeInsets.all(12.0),

                  itemBuilder: (context, index) {
                 
                    return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child :Container(
                      decoration: BoxDecoration(
                     color:Colors.green[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                      
                        title: Text(value.cartItems[index][0]),
                        subtitle:Text('\$'+ value.cartItems[index][1]),
                        trailing:IconButton(onPressed: () => Provider.of<cartModel>(context,listen:false ).removeItemFromCart(index) , icon: Icon(Icons.remove),
                            ),
                          )
                    ),
                    );
                  },
                ),
              ),

                     //total + pay button

                 Padding(padding: const EdgeInsets.all(12.0),
                 child:  Container(
                      decoration: BoxDecoration(
                        color:Colors.green[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Text("Total Price",
  style: TextStyle(color: Colors.green),),
  Text( '\$'+ value.calculateTotal(), style: TextStyle(
    color:Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  ),
  ),
],
                         ),

                         Container(
                          decoration: BoxDecoration(
                           border: Border.all(
                            color:Colors.white
      
                           ),
                           borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(10),
                          child:Row(children: [
                             Text(
                            "Pay Now",
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),

                          Icon(Icons.arrow_forward_ios, size:16 ,color:Colors.green)
                          ],)
                          
                   
                         )
                        ],
                      ),
                     ),
                 ),

            ],


   
          );
        },
      ),
    );
  }
}
