import 'package:deliveristo_flutter_frontend_coding_challenge/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

Future<void> main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
      'Test HomePage widget when user select one image filter , australian breed and shepherd sub breed then press submit button then images slider should appear with one image after data succesfully fetched',
      (WidgetTester tester) async {
    app.main();

    await tester
        .pumpAndSettle(); // to wait until all asynce function finished and the app in stable state

    // click on image filter option
    const imageFilterKey = Key('oneImageFilter');
    final imageFilterKeyFinder = find.byKey(imageFilterKey);

    await tester.tap(
      imageFilterKeyFinder,
    ); // tab on subBreedDropDown and no warn if no subBreed for slected breeed
    await tester.pumpAndSettle();

    const breedsDropdownKey = Key('breedsDropDown');
    final breedsDropdownFinder =
        find.byKey(breedsDropdownKey); // fine the breedDropDown widget by key

    await tester.tap(breedsDropdownFinder); // tab on breedDropDown
    await tester.pumpAndSettle(); // await untill data for subBreed data fetched

// you can uncomment this to chose australian who has sub breed
    final australianOptionFinder = find.text('australian');

    await tester.tap(australianOptionFinder);
    await tester.pumpAndSettle();

    const subBreedsDropdownKey = Key('subBreedsDropDown');

    /// fine the subBreedDropDown widget by key
    final subBreedsDropdownFinder = find.byKey(subBreedsDropdownKey);

    await tester.tap(subBreedsDropdownFinder,
        warnIfMissed:
            false); // tab on subBreedDropDown and no warn if no subBreed for slected breeed
    await tester.pumpAndSettle();

    // chose shepherdOption
    final shepherdOptionFinder = find.textContaining('shepherd');

    await tester.tap(shepherdOptionFinder);
    await tester.pumpAndSettle();

    const submitButtonKey = Key('submitButton');
    final submitButtonFinder = find.byKey(
      submitButtonKey,
    ); // find submit button and tab it to trigger data fetching for dog images

    await tester.tap(submitButtonFinder);
    await tester.pumpAndSettle();

// wait 1 sec
    await tester.pump(const Duration(seconds: 1));

    await tester.pumpAndSettle();
    // Find the image slider widget
    const imageSliderKey = Key('imageSlider');
    final imageSliderFinder = find.byKey(imageSliderKey);

    // Check if the image slider is visible
    expect(imageSliderFinder, findsOneWidget);

    // Find images in the image slider
    final imageWidgetsFinder = find.descendant(
      of: imageSliderFinder,
      matching: find.byType(Image),
    );

    // Check if there is one image in the slider
    expect(imageWidgetsFinder, findsOneWidget);
  });
}
