// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:covid_sa/ui/widgets/image_card.dart';

// void main() {
//   String title = "Title";
//   String subtitle = "Subtitle";
//   String urlToImage = "https://flutter.dev/images/flutter-logo-sharing.png";

//   MaterialApp app = MaterialApp(
//     home: Scaffold(
//       body: ImageCard(
//         urlToImage: urlToImage,
//         onTap: () {},
//         title: title,
//         subtitle: subtitle,
//       ),
//     ),
//   );

//   testWidgets("ImageCard UI test", (WidgetTester tester) async {
//     await tester.pumpWidget(app);

//     expect(find.text(title), findsOneWidget);
//     expect(find.text(subtitle), findsOneWidget);

//       /*
      
//         flutter tester overrides http client to always respond with status code 400.
//         The image_test_utils package at this time depends on an older version of mockito that bloc test does not support
//         I've chosen to therefore skip the Image.Network test for the time being.
      
//         expect(find.byWidget(Image.network(urlToImage)), findsOneWidget); 

//       */
//   });
// }
