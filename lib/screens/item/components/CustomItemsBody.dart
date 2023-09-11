import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomItemsBody extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String paymentMethods;

  CustomItemsBody({
    this.title = 'Product',
    this.description = 'Product Description',
    this.price = '0.00',
    this.paymentMethods = '',
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.amber,
              height: 200,
              child: null, // Removing the Text widget from the container
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: 20,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Color(0xFFB7082F),
                          ),
                          onRatingUpdate: (index) {},
                          updateOnDrag: true,
                          unratedColor: Colors.grey[400],
                          glowColor: Color(0xFFB7082F),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Price: $price',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Payment Methods: $paymentMethods',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 335,
              height: 53,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Perform "Adicionar ao carrinho" action here
                },
                icon: Icon(Icons.shopping_cart),
                label: Text(
                  'Adicionar ao carrinho',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFB7082F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 335,
              height: 53,
              child: ElevatedButton(
                onPressed: () {
                  // Perform "Avaliação do produto" action here
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Descrição do produto',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 88, 88, 88),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Color(0xFFB7082F),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 335,
              height: 53,
              child: ElevatedButton(
                onPressed: () {
                  // Perform "Avaliação do produto" action here
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Avaliação do produto',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 88, 88, 88),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Color(0xFFB7082F),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}