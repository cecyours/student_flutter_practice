# Flow

    commmands for updating golden images
        flutter test --update-goldens

    step 1 - add package
       use this command - flutter pub add golden_toolkit
    step 2 - create empty main function in test folder 
           - create testWidgets Function

    setUpAll(() {
        TestWidgetsFlutterBinding.ensureInitialized();
    });
    await loadAppFonts();

    testGoldens('My Widget Golden Test', (WidgetTester tester) async {
        
        

    });

    step - 3 pump your widget
    
        await tester.pumpWidget(
         MaterialApp(home: ResponsiveWidget()),
        );

        step - 4 expect the widget with image

            await expectLater(
                find.byType(Text),
                matchesGoldenFile('goldens/MSI_MA.jpg'),  // Reference image
            );
