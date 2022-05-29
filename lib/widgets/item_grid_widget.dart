import 'package:flutter/material.dart';
import 'package:flutter_codigo5_pockedex/widgets/item_type_widget.dart';

class ItemGridWidget extends StatelessWidget {
  String name, imageUrl;
  List<String> type;
  ItemGridWidget(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF4ACFB0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -14,
            right: -14,
            child: Image.asset(
              'assets/images/pokeball.png',
              height: 110,
              fit: BoxFit.cover,
              color: Colors.white.withOpacity(0.27),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.network(imageUrl, width: 100),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      "#001",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.2)),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: type
                      .map<Widget>((item) => ItemTypeWidget(type: item))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
