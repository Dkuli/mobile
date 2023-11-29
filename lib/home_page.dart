import 'package:figma/cart.dart';
import 'package:figma/cart_asli.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedContainer = -1;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 49,
              height: 49,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF9F9F9),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  // Handle Hamburger Icon Press
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
            ),
            Container(
              width: 49,
              height: 49,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF9F9F9),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.person, color: Colors.black),
                onPressed: () {
                  // Handle Person Icon Press
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
 
      body: Column(
        children: [
          // Baris pertama (Menu Hamburger dan Person Icon)

          // Baris kedua (Kontainer gambar untuk kategori)
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageContainer(0, 'All'),
                _buildImageContainer(1, 'Makanan'),
                _buildImageContainer(2, 'Minuman'),
              ],
            ),
          ),

          // Baris ketiga (Judul kategori)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: Text(
                  'all food',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),

          // Scrollable List of Containers
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    _buildCard('Food Item ${index * 2}'),
                    SizedBox(width: 10),
                    _buildCard('Food Item ${index * 2 + 1}'),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => _buildPage(index),
      ));
          });
        },
      ),
    );
  }
   Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return CardAsli();
      case 2:
        return cartWidget();
      default:
        return Text('');
    }
  }

Widget _buildImageContainer(int containerIndex, String title) {
  String imagePath;

  // Assign different images based on the category
  switch (containerIndex) { 
    case 0:
      imagePath = 'assets/images/download.jpg'; // Change this to the image path for 'All'
      break;
    case 1:
      imagePath = 'assets/images/download.jpg'; // Change this to the image path for 'Makanan'
      break;
    case 2:
      imagePath = 'assets/images/coca.jpg'; // Change this to the image path for 'Minuman'
      break;
    default:
      imagePath = 'assets/default_image.jpg'; // Provide a default image path
  }

  return Column(
    children: [
      GestureDetector(
        onTap: () {
          setState(() {
            selectedContainer = containerIndex;
          });
        },
        child: Container(
          width: 80,
          height: 80,
          decoration: ShapeDecoration(
            color: selectedContainer == containerIndex
                ? Color(0xFF2440D3)
                : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: 12),
      Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    ],
  );
}

 Widget _buildCard(String foodItem) {
  String imagePath;

  // Assign different images based on the specific food item
  if (foodItem == 'Food Item 3') {
    imagePath = 'assets/images/coca.jpg'; // Change this to the image path for the fourth food item
  } else {
    imagePath = 'assets/images/download.jpg'; // Default image path for other food items
  }

  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    width: 170,
    height: 250,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              foodItem,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              '\$9.99',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 24,
              height: 24,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.zero,
                  primary: Colors.white,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}
