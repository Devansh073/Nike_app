import 'package:flutter/material.dart';
import 'package:nike_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Cart',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];

          return ListTile(
            leading: Image.asset(
              cartItem['imageUrl'] as String,
              width: 100,
              height: 150,
            ),
            // backgroundImage: AssetImage(cartItem['imageUrl'] as String),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Do you want to delete this item',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: const Text('Are you sure?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<CartProvider>().removeProduct(cartItem);
                            Navigator.of(context).pop(
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Item removed Sucessfully'),
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.redAccent,
              ),
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size : ${cartItem['size']}'),
          );
        },
      ),
    );
  }
}
