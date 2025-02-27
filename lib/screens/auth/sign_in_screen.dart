import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:food_delivery_app/config/helper/image_helper.dart';
import 'package:food_delivery_app/config/themes/app_colors.dart';
import 'package:food_delivery_app/config/themes/app_text_styles.dart';
import 'package:food_delivery_app/screens/auth/home_screen.dart';
import 'package:food_delivery_app/screens/main_screen.dart';
import 'package:food_delivery_app/services/firebase_service.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../config/helper/dialog_helper.dart';
import '../../config/themes/app_button_style.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/sign_in_controller.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/responsive_widget.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);
  static String routerName = '/sign_in';
  final signUpController = Get.put(SignInController());
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var isDesktop = context.width > 1000;
    var condition = context.isLandscape ||
        isDesktop;
    var conditionMobile = context.isPhone;
    var conditionTablet = context.isTablet;
    double height = MediaQuery.of(context).size.height;
    var email;
    var password;
    return Scaffold(
      appBar: AppBarWidget().appBarMobile("", context),
      body: SafeArea(
        child: SizedBox.expand(
            child: condition == true
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ResponsiveWidget.isLargeScreen(context)
                          ? SizedBox()
                          : SignIn1(),
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: SizedBox.expand(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        child: FractionallySizedBox(
                                          widthFactor:
                                              conditionMobile ? 0.8 : 0.9,
                                          child: FormBuilder(
                                            key: _formKey,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "Let's ",
                                                        style: AppTextStyles.h1
                                                            .copyWith(
                                                                color: AppColors
                                                                    .blueDarkColor,
                                                                fontSize:
                                                                    conditionTablet
                                                                        ? 30
                                                                        : 26)),
                                                    TextSpan(
                                                        text: "Sign In ",
                                                        style: AppTextStyles.h1
                                                            .copyWith(
                                                                color: AppColors
                                                                    .primaryColor,
                                                                fontSize:
                                                                    conditionTablet
                                                                        ? 50
                                                                        : 40)),
                                                    TextSpan(
                                                        text: "👇",
                                                        style: AppTextStyles.h1
                                                            .copyWith(
                                                                color: AppColors
                                                                    .blueDarkColor,
                                                                fontSize:
                                                                    conditionTablet
                                                                        ? 30
                                                                        : 26)),
                                                  ])),
                                                ),
                                                SizedBox(
                                                    height: height * 0.005),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    'Hey, Enter your details to get sign in \nto your account.',
                                                    style: AppTextStyles.nomal
                                                        .copyWith(
                                                            fontSize:
                                                                conditionTablet
                                                                    ? 18
                                                                    : 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: AppColors
                                                                .blueDarkColor),
                                                  ),
                                                ),
                                                SizedBox(height: height * 0.03),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 16.0),
                                                    child: Text(
                                                      'User Name',
                                                      style: AppTextStyles.nomal
                                                          .copyWith(
                                                        fontSize:
                                                            conditionTablet
                                                                ? 18
                                                                : 14,
                                                        color: AppColors
                                                            .blueDarkColor,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: height * 0.02),
                                                FormBuilderTextField(
                                                  onSaved: (val) {
                                                    email = val;
                                                  },
                                                  name: 'email',
                                                  decoration: InputDecoration(
                                                      labelText: 'Email',
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 0),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 0),
                                                      ),
                                                      prefixIcon: Icon(
                                                          Icons.mail_outline),
                                                      filled: true,
                                                      fillColor:
                                                          AppColors.grayMain,
                                                      hintText: 'Enter Email',
                                                      hintStyle: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .blueDarkColor
                                                              .withOpacity(
                                                                  0.5))),
                                                  validator:
                                                      FormBuilderValidators
                                                          .compose([
                                                    FormBuilderValidators
                                                        .required(),
                                                    FormBuilderValidators
                                                        .email(),
                                                  ]),
                                                ),
                                                SizedBox(height: height * 0.03),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 16.0),
                                                    child: Text(
                                                      'Password',
                                                      style: AppTextStyles.nomal
                                                          .copyWith(
                                                        fontSize:
                                                            conditionTablet
                                                                ? 18
                                                                : 14,
                                                        color: AppColors
                                                            .blueDarkColor,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: height * 0.02),
                                                FormBuilderTextField(
                                                  name: 'password',
                                                  obscureText: true,
                                                  onSaved: (val) {
                                                    password = val;
                                                  },
                                                  decoration: InputDecoration(
                                                      labelText: 'Password',
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 0),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 0),
                                                      ),
                                                      prefixIcon: Icon(
                                                          Icons.lock_outline),
                                                      filled: true,
                                                      fillColor:
                                                          AppColors.grayMain,
                                                      hintText:
                                                          'Enter Password',
                                                      hintStyle: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .blueDarkColor
                                                              .withOpacity(
                                                                  0.5))),
                                                  validator:
                                                      FormBuilderValidators
                                                          .compose([
                                                    FormBuilderValidators
                                                        .required(),
                                                  ]),
                                                ),
                                                SizedBox(height: height * 0.01),
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: TextButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      'Forgot Password?',
                                                      style: AppTextStyles.nomal
                                                          .copyWith(
                                                        fontSize:
                                                            conditionTablet
                                                                ? 18
                                                                : 14,
                                                        color:
                                                            AppColors.blueMain,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: height * 0.06),
                                                ElevatedButton(
                                                    style: AppButtonStyle
                                                        .buttonPrimary,
                                                    onPressed: () async {
                                                      if (_formKey.currentState !=
                                                              null &&
                                                          _formKey.currentState!
                                                              .saveAndValidate()) {
                                                        OnSignInClicked(
                                                            email, password);
                                                      }
                                                    },
                                                    child: Text(
                                                      'Sign In',
                                                      style: AppTextStyles.h2
                                                          .copyWith(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 16),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: height * 0.06),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Divider(
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                          Text(
                                            ' Or Connect With ',
                                            style: AppTextStyles.nomal.copyWith(
                                                fontSize:
                                                    conditionTablet ? 18 : 14,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.blueDarkColor),
                                          ),
                                          Expanded(
                                            child: Divider(
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height * 0.04),
                                      Row(
                                        children: [
                                          Expanded(child: Container()),
                                          conditionTablet
                                              ? Expanded(child: Container())
                                              : SizedBox(),
                                          Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.5,
                                              child: FittedBox(
                                                fit: BoxFit.fill,
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: Image.asset(
                                                      ImageHelper.facebook_1),
                                                  style: AppButtonStyle
                                                      .iConButtonCircle,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.5,
                                              child: FittedBox(
                                                fit: BoxFit.fill,
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    await FirebaseService()
                                                        .signInWithGoogle(
                                                            context);
                                                  },
                                                  child: Image.asset(ImageHelper
                                                      .google_plus_1),
                                                  style: AppButtonStyle
                                                      .iConButtonCircle,
                                                ),
                                              ),
                                            ),
                                          ),
                                          conditionTablet
                                              ? Expanded(child: Container())
                                              : SizedBox(),
                                          Expanded(child: Container()),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                              ],
                            ),
                          ),
                          condition == true
                              ? Expanded(flex: 1, child: Container())
                              : SizedBox()
                        ],
                      ))
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: SizedBox.expand(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        child: FractionallySizedBox(
                                          widthFactor:
                                              conditionMobile ? 0.8 : 0.9,
                                          child: FormBuilder(
                                            key: _formKey,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "Let's ",
                                                        style: AppTextStyles.h1
                                                            .copyWith(
                                                                color: AppColors
                                                                    .blueDarkColor,
                                                                fontSize:
                                                                    conditionTablet
                                                                        ? 30
                                                                        : 26)),
                                                    TextSpan(
                                                        text: "Sign In ",
                                                        style: AppTextStyles.h1
                                                            .copyWith(
                                                                color: AppColors
                                                                    .primaryColor,
                                                                fontSize:
                                                                    conditionTablet
                                                                        ? 50
                                                                        : 40)),
                                                    TextSpan(
                                                        text: "👇",
                                                        style: AppTextStyles.h1
                                                            .copyWith(
                                                                color: AppColors
                                                                    .blueDarkColor,
                                                                fontSize:
                                                                    conditionTablet
                                                                        ? 30
                                                                        : 26)),
                                                  ])),
                                                ),
                                                SizedBox(
                                                    height: height * 0.005),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    'Hey, Enter your details to get sign in \nto your account.',
                                                    style: AppTextStyles.nomal
                                                        .copyWith(
                                                            fontSize:
                                                                conditionTablet
                                                                    ? 18
                                                                    : 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: AppColors
                                                                .blueDarkColor),
                                                  ),
                                                ),
                                                SizedBox(height: height * 0.03),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 16.0),
                                                    child: Text(
                                                      'User Name',
                                                      style: AppTextStyles.nomal
                                                          .copyWith(
                                                        fontSize:
                                                            conditionTablet
                                                                ? 18
                                                                : 14,
                                                        color: AppColors
                                                            .blueDarkColor,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: height * 0.02),
                                                FormBuilderTextField(
                                                  name: 'email',
                                                  onSaved: (val) {
                                                    email = val;
                                                  },
                                                  decoration: InputDecoration(
                                                      labelText: 'Email',
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 0),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 0),
                                                      ),
                                                      prefixIcon: Icon(
                                                          Icons.mail_outline),
                                                      filled: true,
                                                      fillColor:
                                                          AppColors.grayMain,
                                                      hintText: 'Enter Email',
                                                      hintStyle: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .blueDarkColor
                                                              .withOpacity(
                                                                  0.5))),
                                                  validator:
                                                      FormBuilderValidators
                                                          .compose([
                                                    FormBuilderValidators
                                                        .required(),
                                                    FormBuilderValidators
                                                        .email(),
                                                  ]),
                                                ),
                                                SizedBox(height: height * 0.03),
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 16.0),
                                                    child: Text(
                                                      'Password',
                                                      style: AppTextStyles.nomal
                                                          .copyWith(
                                                        fontSize:
                                                            conditionTablet
                                                                ? 18
                                                                : 14,
                                                        color: AppColors
                                                            .blueDarkColor,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: height * 0.02),
                                                FormBuilderTextField(
                                                  name: 'password',
                                                  obscureText: true,
                                                  onSaved: (val) {
                                                    password = val;
                                                  },
                                                  decoration: InputDecoration(
                                                      labelText: 'Password',
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 0),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 0),
                                                      ),
                                                      prefixIcon: Icon(
                                                          Icons.lock_outline),
                                                      filled: true,
                                                      fillColor:
                                                          AppColors.grayMain,
                                                      hintText:
                                                          'Enter Password',
                                                      hintStyle: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .blueDarkColor
                                                              .withOpacity(
                                                                  0.5))),
                                                  validator:
                                                      FormBuilderValidators
                                                          .compose([
                                                    FormBuilderValidators
                                                        .required(),
                                                  ]),
                                                ),
                                                SizedBox(height: height * 0.01),
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: TextButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      'Forgot Password?',
                                                      style: AppTextStyles.nomal
                                                          .copyWith(
                                                        fontSize:
                                                            conditionTablet
                                                                ? 18
                                                                : 14,
                                                        color:
                                                            AppColors.blueMain,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: height * 0.06),
                                                ElevatedButton(
                                                    style: AppButtonStyle
                                                        .buttonPrimary,
                                                    onPressed: () async {
                                                      if (_formKey.currentState !=
                                                              null &&
                                                          _formKey.currentState!
                                                              .saveAndValidate()) {
                                                        OnSignInClicked(
                                                            email, password);
                                                      }
                                                    },
                                                    child: Text(
                                                      'Sign In',
                                                      style: AppTextStyles.h2
                                                          .copyWith(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 16),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: height * 0.06),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Divider(
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                          Text(
                                            ' Or Connect With ',
                                            style: AppTextStyles.nomal.copyWith(
                                                fontSize:
                                                    conditionTablet ? 18 : 14,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.blueDarkColor),
                                          ),
                                          Expanded(
                                            child: Divider(
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height * 0.04),
                                      Row(
                                        children: [
                                          Expanded(child: Container()),
                                          conditionTablet
                                              ? Expanded(child: Container())
                                              : SizedBox(),
                                          Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.5,
                                              child: FittedBox(
                                                fit: BoxFit.fill,
                                                child: ElevatedButton(
                                                  onPressed: () async {},
                                                  child: Image.asset(
                                                      ImageHelper.facebook_1),
                                                  style: AppButtonStyle
                                                      .iConButtonCircle,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: FractionallySizedBox(
                                              widthFactor: 0.5,
                                              child: FittedBox(
                                                fit: BoxFit.fill,
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    await FirebaseService()
                                                        .signInWithGoogle(
                                                            context);
                                                  },
                                                  child: Image.asset(ImageHelper
                                                      .google_plus_1),
                                                  style: AppButtonStyle
                                                      .iConButtonCircle,
                                                ),
                                              ),
                                            ),
                                          ),
                                          conditionTablet
                                              ? Expanded(child: Container())
                                              : SizedBox(),
                                          Expanded(child: Container()),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                              ],
                            ),
                          ),
                          condition == true
                              ? Expanded(flex: 1, child: Container())
                              : SizedBox()
                        ],
                      ))
                    ],
                  )),
      ),
    );
  }
  void OnSignInClicked(String emailAddress, String password) async {
    DialogHelper.showLoading('Verifying');
    if (await FirebaseService()
            .signInWithEmailAndPassword(emailAddress, password, context) !=
        null) {
      Get.offAllNamed(MainScreen.routerName);
    } else {
      DialogHelper.hideLoading();
      DialogHelper.alertDialog('The account is incorrect or does not exist');
    }
  }
}

class SignIn1 extends StatelessWidget {
  const SignIn1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
                child: Text(
              'Welcome To Food App',
              style: AppTextStyles.h1.copyWith(fontSize: 40),
              textAlign: TextAlign.center,
            )),
          ),
        ),
      ),
    );
  }
}
