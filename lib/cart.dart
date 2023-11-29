import 'package:figma/add_item.dart';
import 'package:flutter/material.dart';

class cartWidget extends StatefulWidget {
  const cartWidget({super.key});

  @override
  State<cartWidget> createState() => _cartWidgetState();
}

class _cartWidgetState extends State<cartWidget> {
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
                icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
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
  
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 30,
          ),
         Container(
  width: 120,
  height: 30,
  alignment: Alignment.center,
  decoration: BoxDecoration(
    color: Color(0xFF2440D3),
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Color(0x3F000000),
        blurRadius: 4,
        offset: Offset(0, 4),
        spreadRadius: 0,
      ),
    ],
  ),
  child: GestureDetector(
    onTap: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context)=>Input()),
     );
      
    },
    child: Text(
      'Add Data +',
      style: TextStyle(color: Colors.white, fontSize: 14),
    ),
  ),
),

          SizedBox(
            height: 25,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.black45,
            ))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Foto'),
                Text('Nama Produk'),
                Text('Harga'),
                Text('Aksi')
              ],
            ),
          ),
          Container(
            height: 500,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    _cartItem('download', 'Burger King Medium', 'Rp.50.000,00'),
                    _cartItem('download', 'Teh Botol', 'Rp.4.000,00')

                  ],
                );
              },
            ),
          )
        ]),
      ),
    );
  }

  Widget _cartItem(String imageName, String namaItem, String hargaItem) {
    return Container(
      padding: EdgeInsets.only(bottom: 20, top: 20),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.black45,
      ))),
      child: Row(
        //Cross untuk vertikal
        crossAxisAlignment: CrossAxisAlignment.start,
        //Main untuk vertikal
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 90,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: AssetImage('assets/images/${imageName}.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(namaItem, textAlign: TextAlign.start,),
          Text(hargaItem, textAlign: TextAlign.start,),
          Icon(
            Icons.restore_from_trash_rounded,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
