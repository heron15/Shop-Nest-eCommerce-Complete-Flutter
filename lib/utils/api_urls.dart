class ApiUrls {
  //base url
  static const String _baseUrl = "https://craftybay.teamrabbil.com/api";

  //all other api
  static const String productSlider = "$_baseUrl/ListProductSlider";
  static const String allCategory = "$_baseUrl/CategoryList";
  static const String popularProduct = "$_baseUrl/ListProductByRemark/popular";
  static const String specialProduct = "$_baseUrl/ListProductByRemark/special";
  static const String newProduct = "$_baseUrl/ListProductByRemark/new";

  static String productViewByCategory(int id) => "$_baseUrl/ListProductByCategory/$id";

  static String productDetailsById(String id) => "$_baseUrl/ProductDetailsById/$id";
}
