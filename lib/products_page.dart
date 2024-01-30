import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '/products_model.dart';

Future<List<ProductsModel>> getProducts() async {
  Dio dio = Dio();
  List<ProductsModel> products = [];

  final result = await dio.get('https://fakestoreapi.com/products');

  if (result.statusCode == 200) {
    for (var product in result.data) {
      products.add(ProductsModel.fromJson(product));
    }
  }
  return products;
}

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  getProducts();
                },
                icon: Icon(
                  Icons.electric_car_outlined,
                  color: Colors.white,
                ))
          ],
          title: Text(
            'Products',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: FutureBuilder(
          future: getProducts(),
          builder: (context, products) {
            if (!products.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: products.data!.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Image.network(products.data![index].image ?? ''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 10,
                      ),
                      Text(
                        products.data![index].title ?? '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Container(
                        height: 10,
                      ),
                      Text(products.data![index].description ?? ''),
                      Container(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(products.data![index].category!.name),
                          Spacer(),
                          Text(
                            (products.data![index].price ?? 0).toString(),
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
            );
          },
        )

        // ListView (
        //   children: [
        //     Card(
        //       child: ListTile(
        //         title: Image.network(
        //             'https://cdn.pixabay.com/photo/2023/12/15/22/37/mountains-8451480_1280.jpg'),
        //         subtitle: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Container(
        //               height: 10,
        //             ),
        //             Text(
        //               'Product Name',
        //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        //             ),
        //             Container(
        //               height: 10,
        //             ),
        //             Text(
        //                 'Casjd hshjxbajshjajhabh adh dsjhvchjsdbchjbds jhc vasdhjv chjds  vcdjhv'),
        //             Container(
        //               height: 10,
        //             ),
        //             Row(
        //               children: [
        //                 Text('Category'),
        //                 Spacer(),
        //                 Text(
        //                   '110\$',
        //                   style: TextStyle(
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 24,
        //                       color: Colors.red),
        //                 ),
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //     Card(
        //       child: ListTile(
        //         title: Image.network(
        //             'https://cdn.pixabay.com/photo/2023/12/15/22/37/mountains-8451480_1280.jpg'),
        //         subtitle: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Container(
        //               height: 10,
        //             ),
        //             Text(
        //               'Product Name',
        //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        //             ),
        //             Container(
        //               height: 10,
        //             ),
        //             Text(
        //                 'Casjd hshjxbajshjajhabh adh dsjhvchjsdbchjbds jhc vasdhjv chjds  vcdjhv'),
        //             Container(
        //               height: 10,
        //             ),
        //             Row(
        //               children: [
        //                 Text('Category'),
        //                 Spacer(),
        //                 Text(
        //                   '110\$',
        //                   style: TextStyle(
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 24,
        //                       color: Colors.red),
        //                 ),
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        );
  }
}
