import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Layout for larger screen (e.g., tablet) vs smaller screen (e.g., phone)
    return Scaffold(
      body: Center(
        child: screenWidth > 600  // Adjust the threshold as needed
            ? Row(  // Use a row for larger screen (side-by-side layout)
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, size: 50),
            SizedBox(width: 10),
            Text(
              'Hello, Golden Tes!',
              style: TextStyle(fontSize: 30),
            ),
          ],
        )
            : Column(  // Use a column for smaller screen (stacked layout)
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, size: 50),
            SizedBox(height: 10),
            Text(
              'Hello, Golden Tes!',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
