import 'package:flutter/material.dart'; 
import 'package:shop_app/products_cards.dart';
import 'package:shop_app/products_detail_page.dart';
import 'package:shop_app/global_variable.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  final List<String> filters = const['All','Adidas','Nike','Jordon'];

  late String selectedFilter;
  
   @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
       const border = OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(148, 144, 144, 1),
                  ),
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(50),
                  ),
                );
    return  SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:  Text('Shoes\nCollection',
                   style: Theme.of(context).textTheme.titleLarge,
                  ),
                 ),
             const Expanded( 
             child: TextField(
               decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: border,
                enabled: true,
                focusedBorder: border,
               ),
             ),
           ),
          ],
         ), 
        SizedBox(
            height: 80,
             child: ListView.builder(
              itemCount: filters.length,
              scrollDirection: Axis.horizontal,
              itemBuilder:( context, index) {
                final filter =filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap:() {
                      setState(() {
                        selectedFilter= filter;
                      });
                      
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == filter ? Theme.of(context).colorScheme.primary:
                       const Color.fromRGBO(247, 248, 249, 1),
                      side: BorderSide(
                        color: Color.fromRGBO(245, 247, 249, 1),
                      ),
                      label: Text(filter),
                      labelStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16, 
                        vertical: 14
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(30),
                      ),
                    ),
                  ),
                );
               }
              ),
             ),  
             Expanded(
               child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                        builder: (context) {
                          return ProductsDetailPage(product: product);
                        }
                        ),
                        );
                    },
                    child: ProductsCards(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] as Sting,
                      backgroundColor: index.isEven ?
                     const Color.fromRGBO(216, 240, 253, 1): 
                     const Color.fromRGBO(245, 247, 249, 1),
                      ),
                  );
                  },
                ),
              ),
            ],
           ),
          );
  }
} 