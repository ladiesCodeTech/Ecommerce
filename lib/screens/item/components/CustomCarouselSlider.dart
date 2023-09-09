// import 'package:flutter/material.dart';
// import 'package:ladiescode/models/ProductsList.dart';
// import 'package:ladiescode/size_config.dart';

// class CustomCarouselSlider extends StatefulWidget {
//   @override
//   State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
// }

// class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
//   int currentImage = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.white,
//         padding:
//             EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
//         child: Column(
//           // children: [
//           //   Image.asset(
//           //     allProducts[0].images[0],
//           //     height: getProportionateScreenHeight(200),
//           //     fit: BoxFit.contain,
//           //   ),
//           //   Row(
//           //     mainAxisAlignment: MainAxisAlignment.center,
//           //     children: List.generate(allProducts[0].images.length,
//           //         (index) => dotBuilder(index: index)),
//           //   )
//           // ],
//         ));
//   }

//   Container dotBuilder({required int index}) {
//     return Container(
//       margin: EdgeInsets.only(right: 5),
//       height: 8,
//       width: 8,
//       decoration: BoxDecoration(
//           color: currentImage == index ? Color(0xFF606060) : Color(0xFFBFBFBF),
//           borderRadius: BorderRadius.circular(5)),
//     );
//   }
// }

// // 'images/smartTvs/1.png'
// // 'images/cellphones/1.webp',
