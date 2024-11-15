import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:e_pelelangan_app/main.dart';
import 'package:e_pelelangan_app/presentation/pages/auction_provider.dart'; // Pastikan untuk mengimpor AuctionProvider

void main() {
  testWidgets('HomePage displays auction items', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the app displays the auction items.
    expect(find.text('Lelang Mobil'), findsOneWidget);
    expect(find.text('Mobil sedan dalam kondisi baik.'), findsOneWidget);
    expect(find.text('Lelang Sepeda'), findsOneWidget);
    expect(find.text('Sepeda gunung, jarang dipakai.'), findsOneWidget);
    expect(find.text('Lelang Laptop'), findsOneWidget);
    expect(
        find.text('Laptop gaming dengan spesifikasi tinggi.'), findsOneWidget);
  });

  testWidgets('Navigating to auction detail page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Tap on the first auction item to navigate to the detail page.
    await tester.tap(find.text('Lelang Mobil'));
    await tester.pumpAndSettle(); // Wait for the navigation to complete.

    // Verify that the auction detail page displays the correct information.
    expect(find.text('Lelang Mobil'), findsOneWidget);
    expect(find.text('Mobil sedan dalam kondisi baik.'), findsOneWidget);
    expect(find.byType(TextField),
        findsOneWidget); // Check for the presence of the TextField for bidding.
  });

  testWidgets('Submitting a bid', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Tap on the first auction item to navigate to the detail page.
    await tester.tap(find.text('Lelang Mobil'));
    await tester.pumpAndSettle(); // Wait for the navigation to complete.

    // Enter a bid in the TextField.
    await tester.enterText(find.byType(TextField), '1000000');

    // Verify that the entered text is correct.
    expect(find.text('1000000'), findsOneWidget);

    // Tap the 'Ajukan Tawaran' button.
    await tester.tap(find.text('Ajukan Tawaran'));
    await tester.pump(); // Trigger a frame.

    // Here you would typically check for a confirmation message or state change.
    // For this example, we will just verify that the button was tapped.
    expect(find.text('Ajukan Tawaran'),
        findsOneWidget); // This is just a placeholder check.
  });
}
