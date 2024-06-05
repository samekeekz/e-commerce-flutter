// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:minmalecommerce/models/product_model.dart';
import 'package:minmalecommerce/models/shop_model.dart';
import 'package:minmalecommerce/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:universal_platform/universal_platform.dart';

class MyProductTile extends StatelessWidget {
  const MyProductTile({super.key, required this.product});
  final Product product;

  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Add this item to cart ?"),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              context.read<Shop>().addToCart(item: product);
            },
            child: const Text("Yes"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(Utils.getScreenHeight(context));
    double aspectRatio;
    if (UniversalPlatform.isWindows || UniversalPlatform.isWeb) {
      if ((Utils.getScreenHeight(context) > 630)) {
        aspectRatio = 1;
      } else if (Utils.getScreenHeight(context) > 540 &&
          Utils.getScreenHeight(context) <= 630) {
        aspectRatio = 1.25;
      } else {
        aspectRatio = 1.4;
        print("2");
      }
    } else {
      aspectRatio = 1;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.pink[400], // change this line to your desired color
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Utils.getScreenWidth(context) * 0.020,
        vertical: 10, // Adjust the vertical spacing as needed
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Utils.getScreenWidth(context) * 0.050,
        vertical: Utils.getScreenHeight(context) * 0.025,
      ),
      width: Utils.getScreenWidth(context) * 0.75 > 300
          ? 300
          : Utils.getScreenWidth(context) * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: aspectRatio,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(
                    Utils.getScreenWidth(context) * 0.0095,
                  ),
                  width: double.infinity,
                  child: Image.asset(
                    fit: BoxFit.fitWidth,
                    product.imagePath,
                  ),
                ),
              ),
              SizedBox(
                height: Utils.getScreenHeight(context) * 0.020,
              ),
              Text(
                product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Utils.getScreenWidth(context) * 0.052 > 28
                      ? Utils.getScreenWidth(context) * 0.025
                      : Utils.getScreenWidth(context) * 0.052,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              SizedBox(
                height: 5, // Adjust the vertical spacing as needed
              ),
              Text(
                product.description,
                style: TextStyle(
                  overflow: (UniversalPlatform.isWindows ||
                              UniversalPlatform.isWeb) &&
                          Utils.getScreenHeight(context) <= 500
                      ? TextOverflow.ellipsis
                      : null,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    onPressed: () {
                      addToCart(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
