import 'package:flutter/material.dart';
import 'package:minmalecommerce/components/my_drawer.dart';
import 'package:minmalecommerce/components/my_product_tile.dart';
import 'package:minmalecommerce/models/shop_model.dart';
import 'package:minmalecommerce/pages/cart_page.dart';
import 'package:minmalecommerce/utils/scroller.dart';
import 'package:minmalecommerce/utils/utils.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  ShopPage({Key? key}) : super(key: key);

  final ScrollController controller = ScrollController();

  static String id = '/shop_page';

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, CartPage.id);
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Utils.getScreenHeight(context) * 0.025,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Utils.getScreenWidth(context) * 0.05,
              vertical: Utils.getScreenHeight(context) * 0.015,
            ),
            child: Text(
              "Pick from a selected list of premium products",
              style: TextStyle(
                color: Colors.white, // change color to white
              ),
            ),
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: MyCustomScrollBehavior(),
              child: ListView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(
                  horizontal: Utils.getScreenWidth(context) * 0.03,
                  vertical: Utils.getScreenWidth(context) * 0.005,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return MyProductTile(product: product);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
