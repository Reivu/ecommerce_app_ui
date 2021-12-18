import 'package:ecommerce_app_ui/models/recommendations_model.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatefulWidget {
  final Recommendations recommendations;
  const ItemScreen({Key? key, required this.recommendations}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  int _tabSize = 0;
  List size = [31, 32, 33, 34, 35];

  void _tab(int index) {
    setState(() {
      _tabSize = index;
      // print(_tabSize);
    });
  }

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
          _buildBottomSheet(),
        ],
      ),
    );
  }

  Widget _buildBottomSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.07,
      maxChildSize: 0.50,
      snap: true,
      builder: (
        BuildContext context,
        ScrollController scrollController,
      ) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
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
                  widget.recommendations.name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Faucibus a pellentesque sit amet porttitor eget dolor morbi.',
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Select Size',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: size.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // print(index);
                        _tab(index);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        width: 65.0,
                        decoration: BoxDecoration(
                          color:
                              _tabSize == index ? Colors.black87 : Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Text(
                            '${size[index]}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _tabSize == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: const [
                    Text(
                      'DELIVERING TO ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'YOGYAKARTA, IND',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40.0,
                    width: 80.0,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '\$${widget.recommendations.price}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Add To Cart',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 15.0,
                        ),
                        SizedBox(width: 10.0),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
