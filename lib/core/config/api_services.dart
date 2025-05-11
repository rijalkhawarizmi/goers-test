
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServices extends Interceptor {
  static final Dio _dio = Dio(BaseOptions(baseUrl:"https://swapi-node.vercel.app/api"));

  static final ApiServices _instance = ApiServices._internal();

  factory ApiServices() {
    return _instance;
  }

  ApiServices._internal() {

    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 300));
    _dio.interceptors.add(this);
  }

  
  Future<Response> getRequest(
      {String? path, Map<String, dynamic>? rawJson, FormData? formData}) async {
    try {
      Response response = await _dio.get(path ?? "", data: rawJson ?? formData);
      return response;
    } catch (e) {
      rethrow;
    }
  }

 
 

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
   
    // printCurlCommand(options);
    options.headers.addAll({
      "Content-Type": "application/json",
     
    });

   
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Check if the user is unauthorized.
   

  
  
   try {
        handler.resolve(await _retry(err.requestOptions));
      } on DioException catch (e) {
        // If the request fails again, pass the error to the next interceptor in the chain.
        handler.next(e);
      }

    // Pass the error to the next interceptor in the chain.
    handler.next(err);

  }

  

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    
    // Create a new `RequestOptions` object with the same method, path, data, and query parameters as the original request.
    final options = Options(
      method: requestOptions.method,
     
    );

    // Retry the request with the new `RequestOptions` object.
    return _dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
