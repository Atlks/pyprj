import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

Map<String, Response Function(Request request)>  funsMap4restapi={};

void runHttpApiStart(int port) async {
  // 创建一个处理请求的处理函数
  final handler = const Pipeline()

      .addHandler(_handleRequest);
  final server = await io.serve(handler, 'localhost', port);
  print('Serving at http://${server.address.host}:${server.port}');

}


// 处理请求的函数

Response _handleRequest(Request request) {
  var path2 = request.requestedUri.path;
  var method = request.method;
  //if 请求  /reg   那么 将请求转发到  regGET函数去

  var  functionName=path2+method;
  functionName=functionName.substring(1);

  // , [List<dynamic>? args]
  var func = funsMap4restapi[functionName];
  if (func != null) {
    // 动态调用函数，并传递请求作为参数
    return Function.apply(func, [request]) as Response;
    //  return result;
  } else {
    print('Function $functionName not found.');
    return Response.notFound('Function $functionName not found.');
  }


}