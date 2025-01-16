# create ui for widget testing
    1     go to test folder and create test file called widget_test or anything you want 
    2     create main function and add this code in it
            testWidgets('Name of Test', (WidgetTester tester) async {
   
            });

    3 after creating your ui with parent widget as MaterialApp widget
        await tester.pumpWidget(const WidgetTest1()); pass your main widget which you want to test in this instead of WidgetTest1()
    
    4 now start analyzing code from widget_test.dart file in test folder