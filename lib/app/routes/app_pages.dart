import 'package:get/get.dart';

import '../modules/Drawer_AboutUs/bindings/drawer_about_us_binding.dart';
import '../modules/Drawer_AboutUs/views/drawer_about_us_view.dart';
import '../modules/Drawer_Faq/bindings/drawer_faq_binding.dart';
import '../modules/Drawer_Faq/views/drawer_faq_view.dart';
import '../modules/Drawer_Profile/bindings/drawer_profile_binding.dart';
import '../modules/Drawer_Profile/views/drawer_profile_view.dart';
import '../modules/Drawer_TermsOfUse/bindings/drawer_terms_of_use_binding.dart';
import '../modules/Drawer_TermsOfUse/views/drawer_terms_of_use_view.dart';
import '../modules/MunicipalRental_AddToll/bindings/municipal_rental_add_toll_binding.dart';
import '../modules/MunicipalRental_AddToll/views/municipal_rental_add_toll_view.dart';
import '../modules/MunicipalRental_PayTollRent/bindings/municipal_rental_pay_toll_rent_binding.dart';
import '../modules/MunicipalRental_PayTollRent/views/municipalRentalPay(main)_view.dart';
import '../modules/MunicipalRental_TollDailyReport/bindings/municipal_rental_toll_daily_report_binding.dart';
import '../modules/MunicipalRental_TollDailyReport/views/municipal_rental_toll_daily_report_view.dart';
import '../modules/Property_AddCluster/bindings/property_add_cluster_binding.dart';
import '../modules/Property_AddCluster/views/property_add_cluster_view.dart';
import '../modules/Property_Cluster/bindings/property_cluster_binding.dart';
import '../modules/Property_Cluster/views/property_cluster_view.dart';
import '../modules/Property_GbSafApply/bindings/property_gb_saf_apply_binding.dart';
import '../modules/Property_GbSafApply/views/property_gb_saf_apply_view.dart';
import '../modules/Property_GbSafVerification/bindings/property_gb_saf_verification_binding.dart';
import '../modules/Property_GbSafVerification/views/property_gb_saf_verification_view.dart';
import '../modules/Property_MissingGeotagging/bindings/property_missing_geotagging_binding.dart';
import '../modules/Property_MissingGeotagging/views/property_missing_geotagging_view.dart';
import '../modules/Property_Report/bindings/property_report_binding.dart';
import '../modules/Property_Report/views/property_Report_view(Main).dart';
import '../modules/Property_SearchAssessmentDetail/bindings/property_search_assessment_detail_binding.dart';
import '../modules/Property_SearchAssessmentDetail/views/SearchAssessment_(main)_view.dart';
import '../modules/Property_SearchProperty/bindings/property_pay_property_tax_binding.dart';
import '../modules/Property_SearchProperty/views/SearchHolding(main)_view.dart';
import '../modules/Property_WaterHarvestingFieldVerify/bindings/property_water_harvesting_field_verify_binding.dart';
import '../modules/Property_WaterHarvestingFieldVerify/views/property_water_harvesting_field_verify_view.dart';
import '../modules/SplashScreen/bindings/splash_screen_binding.dart';
import '../modules/SplashScreen/views/splash_screen_view.dart';
import '../modules/Water_DailyCollectionReport/bindings/water_daily_collection_report_binding.dart';
import '../modules/Water_DailyCollectionReport/views/water_DailyCollection(MainPage)_view.dart';
import '../modules/fieldVerification_pending_list/bindings/field_verification_pending_list_binding.dart';
import '../modules/fieldVerification_pending_list/views/field_verification_pending_list_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_screen/bindings/login_screen_binding.dart';
import '../modules/login_screen/views/login_screen_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/property_ApplyFormHomeScreen/bindings/property_apply_form_home_screen_binding.dart';
import '../modules/property_ApplyFormHomeScreen/views/property_apply_form_home_screen_view.dart';
import '../modules/property_ApplyHarvesting/bindings/property_apply_harvesting_binding.dart';
import '../modules/property_ApplyHarvesting/views/property_apply_harvesting_view.dart';
import '../modules/property_Consession/bindings/property_consession_binding.dart';
import '../modules/property_Consession/views/property_consession_view.dart';
import '../modules/property_DailyTcReport/bindings/property_DailyTcReport_binding.dart';
import '../modules/property_DailyTcReport/views/property_DailySearchTcReport(Main).dart';
import '../modules/property_HomeScreen/bindings/property_home_screen_binding.dart';
import '../modules/property_HomeScreen/views/property_home_screen_view.dart';
import '../modules/property_NewAssessment/bindings/property_new_assessment_binding.dart';
import '../modules/property_NewAssessment/views/property_NA_BasicDetail.dart';
import '../modules/trade_Amendment/bindings/trade_amendment_binding.dart';
import '../modules/trade_Amendment/views/trade_amendment_view.dart';
import '../modules/trade_HomeScreen/bindings/trade_home_screen_binding.dart';
import '../modules/trade_HomeScreen/views/trade_home_screen_view.dart';
import '../modules/trade_NewApplication/bindings/trade_new_application_binding.dart';
import '../modules/trade_NewApplication/views/trade_NA_BasicDetails_view.dart';
import '../modules/trade_Renewal/bindings/trade_renewal_binding.dart';
import '../modules/trade_Renewal/views/trade_renewal_view.dart';
import '../modules/trade_Surrender/bindings/trade_surrender_binding.dart';
import '../modules/trade_Surrender/views/trade_surrender_view.dart';
import '../modules/trade_TrackLicense/bindings/trade_track_license_binding.dart';
import '../modules/trade_TrackLicense/views/trade_TrackLicense(Main)_view.dart';
import '../modules/water_ApplicationSearch/bindings/water_application_search_binding.dart';
import '../modules/water_ApplicationSearch/views/water_ApplicationSearch(main)_view.dart';
import '../modules/water_ApplyConnectionForm/bindings/water_apply_connection_binding.dart';
import '../modules/water_ApplyConnectionForm/views/water_apply_connection_view.dart';
import '../modules/water_ConsumerSearch/bindings/water_consumer_search_binding.dart';
import '../modules/water_ConsumerSearch/views/water_ConsumerSearch(main)_view.dart';
import '../modules/water_HomeScreen/bindings/water_home_screen_binding.dart';
import '../modules/water_HomeScreen/views/water_home_screen_view.dart';
import '../modules/water_SiteVerification/bindings/water_site_verification_binding.dart';
import '../modules/water_SiteVerification/views/water_SiteVerification(main)_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => const LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WATER_HOME_SCREEN,
      page: () => const WaterHomeScreenView(),
      binding: WaterHomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.TRADE_HOME_SCREEN,
      page: () => const TradeHomeScreenView(),
      binding: TradeHomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.FIELD_VERIFICATION_PENDING_LIST,
      page: () => const FieldVerificationPendingListView(),
      binding: FieldVerificationPendingListBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_HOME_SCREEN,
      page: () => const PropertyHomeScreenView(),
      binding: PropertyHomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_NEW_ASSESSMENT,
      page: () => PropertyNewAssessmentView(),
      binding: PropertyNewAssessmentBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_CONSESSION,
      page: () => const PropertyConsessionView(),
      binding: PropertyConsessionBinding(),
    ),
    GetPage(
      name: _Paths.WATER_APPLY_CONNECTION,
      page: () => const WaterApplyConnectionView(),
      binding: WaterApplyConnectionBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_MISSING_GEOTAGGING,
      page: () => const PropertyMissingGeotaggingView(),
      binding: PropertyMissingGeotaggingBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_WATER_HARVESTING_FIELD_VERIFY,
      page: () => const PropertyWaterHarvestingFieldVerifyView(),
      binding: PropertyWaterHarvestingFieldVerifyBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_PAY_PROPERTY_TAX,
      page: () => PropertyPayPropertyTaxView(),
      binding: PropertyPayPropertyTaxBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_SEARCH_ASSESSMENT_DETAIL,
      page: () => const SearchAssessmentDetailView(),
      binding: PropertySearchAssessmentDetailBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_REPORT,
      page: () => const PropertyReportView(),
      binding: PropertyReportBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_GB_SAF_APPLY,
      page: () => const PropertyGbSafApplyView(),
      binding: PropertyGbSafApplyBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_CLUSTER,
      page: () => const PropertyClusterView(),
      binding: PropertyClusterBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_GB_SAF_VERIFICATION,
      page: () => const PropertyGbSafVerificationView(),
      binding: PropertyGbSafVerificationBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_ADD_CLUSTER,
      page: () => const PropertyAddClusterView(),
      binding: PropertyAddClusterBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_APPLY_HARVESTING,
      page: () => const PropertyApplyHarvestingView(),
      binding: PropertyApplyHarvestingBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_APPLY_FORM_HOME_SCREEN,
      page: () => const PropertyApplyFormHomeScreenView(),
      binding: PropertyApplyFormHomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.WATER_APPLICATION_SEARCH,
      page: () => const WaterApplicationSearchView(),
      binding: WaterApplicationSearchBinding(),
    ),
    GetPage(
      name: _Paths.WATER_CONSUMER_SEARCH,
      page: () => const WaterConsumerSearchView(),
      binding: WaterConsumerSearchBinding(),
    ),
    GetPage(
      name: _Paths.TRADE_NEW_APPLICATION,
      page: () => const TradeNABasicDetail(),
      binding: TradeNewApplicationBinding(),
    ),
    GetPage(
      name: _Paths.TRADE_RENEWAL,
      page: () => const TradeRenewalView(),
      binding: TradeRenewalBinding(),
    ),
    GetPage(
      name: _Paths.TRADE_SURRENDER,
      page: () => const TradeSurrenderView(),
      binding: TradeSurrenderBinding(),
    ),
    GetPage(
      name: _Paths.TRADE_AMENDMENT,
      page: () => const TradeAmendmentView(),
      binding: TradeAmendmentBinding(),
    ),
    GetPage(
      name: _Paths.TRADE_TRACK_LICENSE,
      page: () => const TradeTrackLicenseView(),
      binding: TradeTrackLicenseBinding(),
    ),
    GetPage(
      name: _Paths.WATER_SITE_VERIFICATION,
      page: () => const WaterSiteVerificationView(),
      binding: WaterSiteVerificationBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_DAILY_TC_REPORT,
      page: () => const PropertyDailyTcReportView(),
      binding: PropertyDailyTcReportBinding(),
    ),
    GetPage(
      name: _Paths.DRAWER_ABOUT_US,
      page: () => const DrawerAboutUsView(),
      binding: DrawerAboutUsBinding(),
    ),
    GetPage(
      name: _Paths.DRAWER_TERMS_OF_USE,
      page: () => const DrawerTermsOfUseView(),
      binding: DrawerTermsOfUseBinding(),
    ),
    GetPage(
      name: _Paths.DRAWER_FAQ,
      page: () => const DrawerFaqView(),
      binding: DrawerFaqBinding(),
    ),
    GetPage(
      name: _Paths.DRAWER_PROFILE,
      page: () => const DrawerProfileView(),
      binding: DrawerProfileBinding(),
    ),
    GetPage(
      name: _Paths.MUNICIPAL_RENTAL_ADD_TOLL,
      page: () => const MunicipalRentalAddTollView(),
      binding: MunicipalRentalAddTollBinding(),
    ),
    GetPage(
      name: _Paths.MUNICIPAL_RENTAL_PAY_TOLL_RENT,
      page: () => const MunicipalRentalPayTollRentView(),
      binding: MunicipalRentalPayTollRentBinding(),
    ),
    GetPage(
      name: _Paths.MUNICIPAL_RENTAL_TOLL_DAILY_REPORT,
      page: () => const MunicipalRentalTollDailyReportView(),
      binding: MunicipalRentalTollDailyReportBinding(),
    ),
    GetPage(
      name: _Paths.WATER_DAILY_COLLECTION_REPORT,
      page: () => const WaterDailyCollectionReportView(),
      binding: WaterDailyCollectionReportBinding(),
    ),
  ];
}
