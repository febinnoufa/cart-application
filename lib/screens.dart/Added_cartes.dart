// ignore: file_names
import 'package:flutter/material.dart';


class AddedCartedScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const AddedCartedScreen({Key? key, required this.cartItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
     //final mapBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Cart Details',
            style: TextStyle(color: Colors.black),
          )),
      body: Center(
        child: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
         
            final item = cartItems[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 200,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      item['image'].toString(),
                      height: 150,
                      width: 120,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      
                                     const SizedBox(height: 20,),         
                        SizedBox(
                          //width: 250,
                          child: Text(
                            item['title'].toString(),
                            maxLines: 2,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$ ${item['price'].toString()}',
                              style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                              Text("in stock ${item['rating']['count'].toString()}",style: const TextStyle(color: Colors.blue),),

                          ],
                        ),
                         const SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          
                         Container(
      margin: const EdgeInsets.all(20.0),
      height: 35,
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), 
        borderRadius: BorderRadius.circular(10.0), 
        color: Colors.black,
      ),
      child: TextButton(
        onPressed: () {
    
        },
        child: const Text(
          "Remove",
          style: TextStyle(color: Colors.red),
        ),
      ),
    )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
   
    );
  }
}
