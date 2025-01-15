class Urls {
  static const String _baseUrl ='https://ecommerch-api.codesilicon.com/api';
  static  String verifyEmailUrl (String email)=>'$_baseUrl/UserLogin/$email';


}