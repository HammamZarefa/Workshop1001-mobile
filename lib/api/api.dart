// api config
import 'package:dio/dio.dart';

class Api {
  Api({
    this.dio,
  });
  Dio? dio = Dio();
  @override
  Dio clone(
      {BaseOptions? options,
      Interceptors? interceptors,
      HttpClientAdapter? httpClientAdapter,
      Transformer? transformer}) {
    // TODO: implement clone
    throw UnimplementedError();
  }

  @override
  void close({bool force = false}) {
    // TODO: implement close
  }

  @override
  Future<Response<T>> delete<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> deleteUri<T>(Uri uri,
      {Object? data, Options? options, CancelToken? cancelToken}) {
    // TODO: implement deleteUri
    throw UnimplementedError();
  }

  @override
  Future<Response> download(String urlPath, savePath,
      {ProgressCallback? onReceiveProgress,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      bool deleteOnError = true,
      FileAccessMode fileAccessMode = FileAccessMode.write,
      String lengthHeader = Headers.contentLengthHeader,
      Object? data,
      Options? options}) {
    // TODO: implement download
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> fetch<T>(RequestOptions requestOptions) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> get<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> getUri<T>(Uri uri,
      {Object? data,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) {
    // TODO: implement getUri
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> head<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) {
    // TODO: implement head
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> headUri<T>(Uri uri,
      {Object? data, Options? options, CancelToken? cancelToken}) {
    // TODO: implement headUri
    throw UnimplementedError();
  }

  @override
  // TODO: implement interceptors
  Interceptors get interceptors => throw UnimplementedError();

  @override
  Future<Response<T>> patch<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> patchUri<T>(Uri uri,
      {Object? data,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    // TODO: implement patchUri
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> post<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> postUri<T>(Uri uri,
      {Object? data,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    // TODO: implement postUri
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> put<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> putUri<T>(Uri uri,
      {Object? data,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    // TODO: implement putUri
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> request<T>(String url,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    // TODO: implement request
    throw UnimplementedError();
  }

  @override
  Future<Response<T>> requestUri<T>(Uri uri,
      {Object? data,
      CancelToken? cancelToken,
      Options? options,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    // TODO: implement requestUri
    throw UnimplementedError();
  }
}
