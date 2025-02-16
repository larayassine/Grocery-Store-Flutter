import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String ItemName;
  final String ItemPrice;
  final String ImagePath;
  final color;
  void Function()? onpressed;

   GroceryItemTile(
      {super.key,
      required this.ItemName,
      required this.ItemPrice,
      required this.ImagePath,
      required this.color,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color[200],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              ImagePath,
              height: 64,
            ),
            Text(ItemName, style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold 
            
            )),    
            MaterialButton(
              onPressed: onpressed,
              color: color[800],
              child: Text(
                "\$ " + ItemPrice,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
