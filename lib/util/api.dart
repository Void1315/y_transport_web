/*
 * @Author: asahi 
 * @Date: 2020-03-24 17:58:26 
 * @Last Modified by: asahi
 * @Last Modified time: 2020-03-24 19:32:14
 */
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ytransportweb/config/config.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

class API {
    // 工厂模式
  factory API() =>_getInstance();
  static API get instance => _getInstance();
  static API _instance;
  static Dio dio;

  static String authPre = '/auth';
  static String signUpPre = '$authPre/sign_up';

  String _test = '/ping';
  String _signUpPhone = '$signUpPre/phone';
  String _signUpCreate = '$signUpPre/create';

  API._internal() {
    // 初始化
    var cookieJar=CookieJar();
    dio = new Dio(BaseOptions(baseUrl: Config.apiHost));
    dio.interceptors.add(CookieManager(cookieJar));
    _initDio();
  }
  _initDio(){
    API.dio.interceptors.add(InterceptorsWrapper(
    onResponse:(Response response) async {
     // 如果状态码不对，则返回错误信息
     if(response.data["code"]!= 200) return dio.reject(response.data["msg"]);
     else return response.data;
     // 否则返回数据
    },
    onError: (DioError e) async {
      // 当请求失败时做一些预处理
     return e;//continue
    }
));
  }
  static API _getInstance() {
    if (_instance == null) {
      _instance = new API._internal();
    }
    return _instance;
  }
  Future<Object> test() async {
    var result;
    try{
      result = await API.dio.get(_test);
    }catch(err){
      return err;
    }
    return result;
  }
  Future<dynamic> signUpPhone({@required String phone}) async {
     var result;
     try{
       result = await API.dio.post(_signUpPhone,data:{"phone":phone});
     }catch(err){
       return err.message;
     }
    return result;
  }

  Future<dynamic> signUpCreate({@required String phone,@required String code,@required String password}) async  {
    var result;
    try{
      result = await API.dio.post(_signUpCreate,data:{"phone":phone,"code":code,"password":password});
    }catch(err){
      return err.message;
    }
    return result;
  }

}