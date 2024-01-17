
import 'package:flutter/material.dart';

 class FavouriteQuoteScreen extends StatelessWidget  {
 const FavouriteQuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return const Scaffold(
    body: Center(
     child: Text(
      "Favourites",
      style: TextStyle(
       fontSize: 25,
       color: Colors.black,
      ),
     ),
    )
   );
  }


}
