// import 'package:counterappp/cartLogics/cart/cart_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// //import 'cart_bloc.dart'; // Assuming your CartBloc is in a separate file

// class CartItemsList extends StatelessWidget {
//   const CartItemsList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CartBloc, CartState>(
//       builder: (context, state) {
//         if (state is CartLoadedState) {
//           return ListView.builder(
//             itemCount: state.cartItems.length,
//             itemBuilder: (context, index) {
//               final cartItem = state.cartItems[index];
//               return ListTile(
//                 title: Text(cartItem['title']),
//                 subtitle: Text('\$${cartItem['price']}'),
//                 // Add any other details you want to display
//               );
//             },
//           );
//         } else {
//           return const Center(child: Text('No items in cart'));
//         }
//       },
//     );
//   }
// }
