import 'package:ecommerce_app_ui/models/recommendations_model.dart';
import 'package:ecommerce_app_ui/widgets/item/bottom_sheet.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatefulWidget {
  final Recommendations recommendations;
  const ItemScreen({Key? key, required this.recommendations}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Background
          Image.asset(
            widget.recommendations.imageUrl,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          //Top Icon
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 45.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 25.0,
                      ),
                      Text(
                        'Back',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.shopping_cart_outlined,
                  size: 25.0,
                ),
              ],
            ),
          ),
          ItemSheet(rec: widget.recommendations),
        ],
      ),
    );
  }
}
