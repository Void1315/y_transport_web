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
  String _signIn = '$authPre/sign_in';

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
     else return response.data;     // 否则返回数据

    },
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
  
  
  Future<dynamic> signUpPhone({@required String phone}) async => API.dio.post(_signUpPhone,data:{"phone":phone});

  Future<dynamic> signUpCreate({@required String phone,@required String code,@required String password}) async  => API.dio.post(_signUpCreate,data:{"phone":phone,"code":code,"password":password});

  Future<dynamic> signIn({
    @required String phone,
    @required String password
  }) async => API.dio.post(_signIn,data:{
    "phone":phone,
    "password":password,
  });

}