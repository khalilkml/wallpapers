import 'package:flutter/material.dart';

class MyWallContainer extends StatelessWidget {
  final String imageUrl;

  const MyWallContainer({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Customize the container's design as per your requirements
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover, // Set the fit property
              height: double.infinity, // Set a fixed height for the container
              width: double.infinity,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            
            child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {
                      // Handle favorite button press
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.download),
                    onPressed: () {
                      // Handle download button press
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
