import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  const DetailsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 350,
            width: 500,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 3,
              ),
            ),
            child: Center(
                child: Image.network(
              data['image'],
              height: 300,
            )),
          ),
          Container(
            height: 424,
            width: double.maxFinite,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data['title'],
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    //overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("\$ ${data['price']} ",style: const TextStyle(color: Color.fromARGB(255, 249, 224, 2)),),
                  )),
                const SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Rating :  ${data['rating']['rate']} / 5",style: const TextStyle(color:Colors.green,fontSize: 15),),
                  )),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    data['description'],
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
