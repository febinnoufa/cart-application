
import 'package:counterappp/const/constends.dart';
import 'package:counterappp/counter/counter_bloc.dart';
import 'package:counterappp/screens.dart/Added_cartes.dart';
import 'package:counterappp/screens.dart/details_page.dart';
import 'package:counterappp/servises.dart/prodects.dart';
import 'package:counterappp/widget/badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenHome extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ScreenHome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Center(
            child: Text(
          "Products",
          style: TextStyle(color: Colors.black),
        )),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: getprodects(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (snapshot.data == null || snapshot.data.isEmpty) {
                return const Center(
                  child: Text("Data is Empty"),
                );
              } else {
                return GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.6,
                      //crossAxisSpacing: 1,
                      //   mainAxisSpacing: 0,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailsPage(data: snapshot.data[index]),
                              ));
                        },
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      snapshot.data[index]['rating']['count']
                                          .toString(),
                                      style:
                                          const TextStyle(color: Colors.green),
                                    )),
                                // const SizedBox(
                                //   height: 15,
                                // ),
                                Image.network(
                                  snapshot.data[index]['image'],
                                  width: 100,
                                  height: 100,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  snapshot.data[index]['title'],
                                  maxLines: 2,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "\$ ${snapshot.data[index]['price'].toString()}"),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.favorite_border))
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {
                                     
                                      cartItems.add(snapshot.data[index]);
                                      context
                                          .read<CounterBloc>()
                                          .add(Incerment());
                                    },
                                    child: const Text("ADD CART")),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            } else {
              return Center(
                child: Text('Connection State: ${snapshot.connectionState}'),
              );
            }
          },
        ),
      ),
      floatingActionButton: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return FloatingActionButton(
              onPressed: () {},
              child: BadgeClas(
                value: state.count.toString(),
                color: Colors.red,
                textColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        //CartItemsList()
                            AddedCartedScreen(cartItems: cartItems),
                      ),
                    );
                  },
                ),
              ));
        },
      ),
    );
  }
}
