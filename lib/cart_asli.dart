import 'package:figma/add_item.dart';
import 'package:flutter/material.dart';

class CardAsli extends StatefulWidget {
  const CardAsli({Key? key}) : super(key: key);

  @override
  _CardAsliState createState() => _CardAsliState();
}

class _CardAsliState extends State<CardAsli> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Spacer(),
            Text(
              'Cart',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
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
                onPressed: () {},
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    CartItem(
                      imageName: 'download',
                      namaItem: 'Burger King Medium',
                      hargaItem: 'Rp.50.000,00',
                      initialItemCount: 1,
                    ),
                    CartItem(
                      imageName: 'download',
                      namaItem: 'Teh Botol',
                      hargaItem: 'Rp.4.000,00',
                      initialItemCount: 2,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    decoration: BoxDecoration(),
                    child: ElevatedButton(
                     style: raisedButtonStyle,
                      onPressed: () {},
                      child: Text('Submit',
                      style: TextStyle(fontSize: 20),
                      selectionColor: Colors.white,
                      ),
                    )),
    );
  }
}

class CartItem extends StatefulWidget {
  final String imageName;
  final String namaItem;
  final String hargaItem;
  final int initialItemCount;

  const CartItem({
    required this.imageName,
    required this.namaItem,
    required this.hargaItem,
    required this.initialItemCount,
    Key? key,
  }) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int itemCount;

  @override
  void initState() {
    super.initState();
    itemCount = widget.initialItemCount;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20, top: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black45,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 90,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: AssetImage('assets/images/${widget.imageName}.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                widget.namaItem,
                textAlign: TextAlign.start,
              ),
              Text(
                widget.hargaItem,
                textAlign: TextAlign.start,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (itemCount > 1) {
                          itemCount--;
                        }
                      });
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      alignment: Alignment.center,
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
                      child: Icon(Icons.remove, size: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      itemCount.toString(),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        itemCount++;
                      });
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      alignment: Alignment.center,
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
                      child: Icon(Icons.add, size: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.restore_from_trash_rounded,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(CardAsli());
}
