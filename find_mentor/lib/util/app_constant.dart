import 'package:flutter/material.dart';
import 'package:find_mentor/util/app_localizations.dart';

class AppConstant {
  // Colors
  static final Color colorPrimary = Color(0xFF71BFBC); // Color(0xFFE11E3C);
  static final Color colorPageBg = Color(0xFFF8F8F8);
  static final Color colorHeading = Color(0xFF0A151F);
  static final Color colorParagraph = Color(0xFF4B5866);
  static final Color colorParagraph2 = Color(0xFF758291);
  static final Color colorVowelBg = Color(0xFFF0F0F0);
  static final Color colorUnifiedWordBg = Color(0xFFE8F0F1);
  static final Color colorUnifiedWordSearch = Color(0xFF73A5AA);
  static final Color colorUnifiedWordText = Color(0xFF2E494C);
  static final Color colorProverbsIdiomsBg = Color(0xFFF9F5F1);
  static final Color colorProverbsIdiomsSearch = Color(0xFFBB8E62);
  static final Color colorProverbsIdiomsText = Color(0xFF4F3822);
  static final Color colorVersionText = Color(0xFFF3A5B1);
  static final Color colorDrawerButton = Color(0xFFE8EAED);
  static final Color colorPullDown1 = Color(0xFFB41830);
  static final Color colorPullDown2 = Color(0xFFDEE3E3);
  static final Color colorBackButton = Color(0xFF48515B);
  static final Color colorAppDescription = Color(0xFF33414C);
  static final Color colorBottomSheetItemHeader = Color(0xFF183148);
  static final Color colorBottomSheetDivider = Color(0xFFEEF0F2);
  static final Color colorDarkBlue = Color(0xff0047CC);
  static final Color colorDarkGrey = Color(0xFF7B8BB2);
  static const Color colortextBlueDark = Color(0xFF2D4379);
  static const Color colorlightBlueGrey = Color(0xFFDEE7FF);
  static const Color colortextDark = Color(0xFF0D253C);

  // Gradient
  static final Shader primaryTextGradientColor = LinearGradient(
    colors: <Color>[Color(0xFF216383), Color(0xFF71BFBC)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  static final primaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF216383), Color(0xFF71BFBC)],
  );


  // Fonts
  static const double fontSizeCaption = 12;
  static const double fontSizeBody2 = 14;
  static const double fontSizeBody = 16;
  static const double fontSizeTitle = 22;
  static const double fontSizeHeadline = 24;
  static const double fontSizeDisplay = 32;
  static const double fontSizeIdiomCardTitle = 18;
  static const double fontSizeIdiomCardContent = 12;


  // Strings
  static final String appVersion = "v.1.0";
  static final String appName = 'Find Mentor';
  static final String appDescription = 'Change Your Career';
  static final String appLongDescription ='';
  static final String appLongRichDescription = "How To Be A 🌟GREAT🌟 Mentee?";
  static final String phoneNumber = 'We Don\'t Know Yet';
  static final String eposta = 'yunus192alpu@gmail.com';
 
  static final String jobsText = AppLocalizations.getString('Jobs');
  static final String eventsText = AppLocalizations.getString('Events');
  static final String mentorshipsText = AppLocalizations.getString('Mentorships');
  static final String mentorsText = AppLocalizations.getString('Mentors');
  static final String menteesText = AppLocalizations.getString('Mentees');
  static final String sendText = AppLocalizations.getString('Send');
  static final String cancelText = AppLocalizations.getString('Cancel');
  static final String socialText = AppLocalizations.getString("Social");
  static final String feedbackText = AppLocalizations.getString('Feedback'); // Contribution & Suggestions
  static final String joinUsText = AppLocalizations.getString('Join Us');
  static final String joinUsNowText = AppLocalizations.getString('Join Us Now');
  static final String followUsText = AppLocalizations.getString('Follow Us');
  static final String contactUsText = AppLocalizations.getString("Contact Us");
  static final String howItWorksText = AppLocalizations.getString("How It Works?");
  static final String searchText = AppLocalizations.getString('Search in network');
  static final String searchHistoryText = AppLocalizations.getString('Search History');
  static final String contactDetailsText = AppLocalizations.getString('Contact Details');
  static final String websiteBtnText = AppLocalizations.getString('Find Mentor Network');
  static final String contributionsText = AppLocalizations.getString('Feel free to contribute!');
  static final String suggestionsDetails = 'Every night & every deploy, the spreadsheet will be parsed by GitHub actions, then generate this beauty.\n\n\nIf you have any queries or issues for which you need your assistance: Feel free to mail us.';

  // Links
  static final String websiteLink = 'https://findmentor.network/';
  static final String discordLink = 'https://discord.gg/EDwkj6Z7W2';
  static final String twitterLink = 'https://twitter.com/findmentorapp';
  static final String githubLink = 'https://github.com/findmentor-network/find-mentor';
  static final String googleFormLink = 'https://github.com/findmentor-network/find-mentor';
  static final String linkedinLink = 'https://www.linkedin.com/company/find-mentor-network';
  static final String youtubeLink = 'https://www.youtube.com/channel/UCx7Q-6Qqrf9TU5gY-i9xovA';
  
  // Splash Screen
  static final String splashAnimatedText1 = 'Find & Match';
  static final String splashAnimatedText2 = 'Meet, Ask, Listen, Learn';
  static final String splashAnimatedText3 = 'Change Your Career';

  // Error Messages
  static final String callErrorText = 'Call failed';
  static final String mailErrorText = 'E-Mail not delivered';
  static final String websiteErrorText = 'Couldn\'t open website!';

  // Pages
  static final String pageSplash = "/";
  static final String pageHome = "/home";

  // Assets
  static final String svgJoin = "assets/icons/Join.svg";
  static final String svgGitHub = "assets/icons/Github.svg";
  static final String svgDiscord = "assets/icons/Discord.svg";
  static final String svgYoutube = "assets/icons/Youtube.svg";
  static final String svgTwitter = "assets/icons/Twitter1.svg";
  static final String svgLinkedin = "assets/icons/Linkedin.svg";
  static final String pngBackgroundImage = "assets/images/bg.png";
  static final String svgBackgroundImage = "assets/images/bg.svg";
  static final String svgLogo = "assets/images/find_mentor_logo.svg";
  static final String svgMessage1 = "assets/icons/icon_message1.svg"; 
  static final String svgMessage2 = "assets/icons/icon_message2.svg"; 
  static final String svgMessage3 = "assets/icons/icon_message3.svg"; 
  static final String svgMessage4 = "assets/icons/icon_message4.svg"; 
}
