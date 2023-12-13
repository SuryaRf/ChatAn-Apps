import 'package:chaten/common/extensions/customThemeExtensions.dart';
import 'package:chaten/common/helper/showAlertDialog.dart';
import 'package:chaten/common/utils/colors.dart';
import 'package:chaten/common/widgets/customElevatedButton.dart';
import 'package:chaten/common/widgets/customIconButton.dart';
import 'package:chaten/feature/welcome/pages/auth/controller/authController.dart';
import 'package:chaten/feature/welcome/pages/auth/widget/customTextField.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;

  sendCodeToPhone() {
    final phoneNumber = phoneNumberController.text;
    final countryName = countryNameController.text;
    final countryCode = countryCodeController.text;

    if (phoneNumber.isEmpty) {
      return showAlertDialog(
          context: context, massege: "Please enter your phone number");
    } else if (phoneNumber.length < 9) {
      return showAlertDialog(
        context: context,
        massege:
            "The phone number you entered is too short for the country: $countryName.\n\nInclude your area code if you haven't",
      );
    } else if (phoneNumber.length > 10) {
      return showAlertDialog(
        context: context,
        massege:
            "The phone number you entered is too long for the country $countryName",
      );
    }
    ref.read(authControllerProvider).sendSmsCode(
      context: context, 
      phoneNumber: '+$countryCode$phoneNumber, ',
      );
  }

  showCoutryCodePicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: ['ET'],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 600,
        backgroundColor: Theme.of(context).backgroundColor,
        flagSize: 22,
        borderRadius: BorderRadius.circular(20),
        textStyle: TextStyle(color: context.theme.greyColor),
        inputDecoration: InputDecoration(
          labelStyle: TextStyle(color: context.theme.greyColor),
          prefixIcon: const Icon(
            Icons.language,
            color: Coloors.lightBlue,
          ),
          hintText: 'Search country code or name',
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: context.theme.greyColor!.withOpacity(0.2),
          )),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Coloors.lightBlue,
            ),
          ),
        ),
      ),
      onSelect: (country) {
        countryNameController.text = country.name;
        countryCodeController.text = country.phoneCode;
      },
    );
    @override
    void initState() {
      countryNameController = TextEditingController(text: 'Ethiopia');
      countryCodeController = TextEditingController(text: '251');
      phoneNumberController = TextEditingController();
      super.initState();
    }

    @override
    void dispose() {
      countryNameController.dispose();
      countryCodeController.dispose();
      phoneNumberController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: Text(
            'Enter your phone number',
            style: TextStyle(
              color: context.theme.authAppbarTextColor,
            ),
          ),
          centerTitle: true,
          actions: [
            CustomIconButton(
              onTap: () {},
              icon: Icons.more_vert,
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: RichText(
                text: TextSpan(
                    text: 'ChatAn will need to verify your phone number',
                    style:
                        TextStyle(color: context.theme.greyColor, height: 1.5),
                    children: [
                      TextSpan(
                          text: "What's my number?",
                          style: TextStyle(color: context.theme.blueColor))
                    ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: CustomTextField(
                onTap: showCoutryCodePicker,
                controller: countryNameController,
                readOnly: true,
                suffixIcon: const Icon(
                  Icons.arrow_drop_down,
                  color: Coloors.lightBlue,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                    child: CustomTextField(
                      onTap: showCoutryCodePicker,
                      controller: countryCodeController,
                      prefixText: '+',
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: CustomTextField(
                      controller: phoneNumberController,
                      hintText: 'phone number',
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Carrier charges may apply',
              style: TextStyle(color: context.theme.greyColor),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomElevatedButton(
          onPressed: sendCodeToPhone,
          text: 'NEXT',
          buttonWidth: 90,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
