import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Products',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Image.network(
                  'https://cdn.pixabay.com/photo/2023/12/15/22/37/mountains-8451480_1280.jpg'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 10,
                  ),
                  Text(
                    'Product Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                      'Casjd hshjxbajshjajhabh adh dsjhvchjsdbchjbds jhc vasdhjv chjds  vcdjhv'),
                  Container(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Category'),
                      Spacer(),
                      Text(
                        '110\$',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.red),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Image.network(
                  'https://cdn.pixabay.com/photo/2023/12/15/22/37/mountains-8451480_1280.jpg'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 10,
                  ),
                  Text(
                    'Product Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                      'Casjd hshjxbajshjajhabh adh dsjhvchjsdbchjbds jhc vasdhjv chjds  vcdjhv'),
                  Container(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Category'),
                      Spacer(),
                      Text(
                        '110\$',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.red),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
