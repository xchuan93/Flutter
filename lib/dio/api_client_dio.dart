import 'package:dio/dio.dart';
import 'package:flutterlearning/cache/xc_cache.dart';
import 'package:flutterlearning/constans/constans.dart';

class ApiClientDio {
  late Dio _dio;
  static final ApiClientDio _instance = ApiClientDio._();
  static ApiClientDio get instance => _instance;

  final String _baseUrl; // 存储baseUrl

  // 使用一个标记来确定使用哪个baseUrl
  ApiClientDio._()
      : _baseUrl = _isDebugMode
            ? 'https://test-api.example.com'
            : 'https://api.example.com' {
    _dio = Dio(); // 创建Dio实例
    _setupInterceptors(); // 设置拦截器
    _setupOptions(); // 设置请求配置
  }

  // 判断是否为调试模式
  static const bool _isDebugMode = true;

  //token
  final String? _accessToken =
      XCCache.getInstance().getData(GlobalConfig.accessToken);

  void _setupInterceptors() {
    // 添加拦截器...
  }

  void _setupOptions() {
    // 设置请求头
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.headers['Authorization'] = 'Bearer your_access_token';

    // 设置请求超时时间
    _dio.options.connectTimeout =
        const Duration(milliseconds: 5000); // 连接超时时间为5秒
    _dio.options.receiveTimeout =
        const Duration(milliseconds: 5000); // 接收超时时间为5秒
  }

  Future<T> get<T>(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await _dio.get('$_baseUrl$path',
          queryParameters: queryParameters); // 使用baseUrl拼接完整路径
      return _handleResponse<T>(response); // 处理响应数据
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<T> post<T>(String path, {Map<String, dynamic>? data}) async {
    try {
      Response response =
          await _dio.post('$_baseUrl$path', data: data); // 使用baseUrl拼接完整路径
      return _handleResponse<T>(response); // 处理响应数据
    } catch (e) {
      throw _handleError(e);
    }
  }

  T _handleResponse<T>(Response response) {
    if (response.statusCode == 200) {
      // 根据泛型T解析响应数据
      return response.data as T;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Exception _handleError(dynamic error) {
    // 错误处理...
    throw Exception('Failed to load data');
  }
}
