import 'package:ecommerce_app_ui/models/recommendations_model.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  final Recommendations recommendations;
  const ItemScreen({Key? key, required this.recommendations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Background
          Image.asset(
            recommendations.imageUrl,
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
          _buildBottomSheet(),
        ],
      ),
    );
  }

  Widget _buildBottomSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.07,
      maxChildSize: 0.5,
      snap: true,
      builder: (
        BuildContext context,
        ScrollController scrollController,
      ) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
              )
            ],
          ),
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  height: 6.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  recommendations.name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
