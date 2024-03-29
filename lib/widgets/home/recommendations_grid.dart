import 'package:ecommerce_app_ui/models/recommendations_model.dart';
import 'package:flutter/material.dart';

class RecommendationsGrid extends StatefulWidget {
  const RecommendationsGrid({Key? key}) : super(key: key);

  @override
  State<RecommendationsGrid> createState() => _RecommendationsGridState();
}

class _RecommendationsGridState extends State<RecommendationsGrid> {
  final Set _favorite = {};
  void _tab(int index, bool isSaved) {
    setState(() {
      if (isSaved) {
        _favorite.remove(index);
      } else {
        _favorite.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double customHeight = (size.height - 24) / 2;
    final double customWidth = size.width / 2;

    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
            child: Text(
              'Best For You',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 50.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                childAspectRatio: (customWidth / customHeight),
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: recommendations.length,
              itemBuilder: (BuildContext context, int index) {
                var _isSaved = _favorite.contains(index);
                Recommendations recommendation = recommendations[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          '/item',
                          arguments: recommendation,
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          recommendation.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: size.height / 3.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${recommendation.price}'),
                        GestureDetector(
                          onTap: () => _tab(index, _isSaved),
                          child: Icon(
                            _isSaved
                                ? Icons.favorite
                                : Icons.favorite_border_rounded,
                            color: _isSaved ? Colors.red : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      recommendation.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      '${recommendation.color} color',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
