import 'package:dio/dio.dart';
import 'package:flux_store/src/packages/resources/app_constants.dart';

import '../utils/logger.dart';

class DioInterceptors extends Interceptor {
  Dio dio = Dio();

  DioInterceptors() {
    _initializationDio();
  }

  void _initializationDio() async {
    dio = Dio(BaseOptions(baseUrl: AppConstants.productListApi));

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          Log.debug('Request[${options.method}] => PATH: ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          Log.success('Response[${response.statusCode}] => DATA: ${response.data}');
          //ApiStatusCode.successFulStatus(response);
          return handler.next(response);
        },
        onError: (error, handler) {
          Log.error('Error[${error.response?.statusCode}] => MESSAGE: ${error.message}');
          //ApiStatusCode.errorHandler(error);
          return handler.next(error);
        },
      ),
    );
  }

  Dio get instance => dio;

  Future<Response> getProductListApi() async {
    try {
      return await dio.get(ApiEndPoints.getProductList);
    } on DioException catch (e) {
      Log.debug(e);
      throw Exception("Failed to call API :- $e");
    }
  }
}
