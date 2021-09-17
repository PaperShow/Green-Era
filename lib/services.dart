// // import 'package:rxdart/rxdart.dart';

// // class Services {
// //   String initialUrl = "";
// //   BehaviorSubject WallpaperUrl;

// //   Services({this.initialUrl}) {
// //     WallpaperUrl = new BehaviorSubject.seeded(this.initialUrl);
// //   }

// //   Stream get wallpaperJson => WallpaperUrl.stream;
// // }

// import 'dart:io';
// import 'dart:async';

// import 'package:http/http.dart' as http;
// import 'package:rxdart/rxdart.dart';
// // import 'package:permission_handler/permission_handler.dart';


// class Service{
//   String initialUrl = '';
//   BehaviorSubject WallpaperUrl;
//   BehaviorSubject Wallpapertourism;
//   BehaviorSubject Wallpaper4k;
//   BehaviorSubject Wallpaperhd;
//   BehaviorSubject Wallpapernature;
//   BehaviorSubject Wallpaperpeople;
//   BehaviorSubject Wallpaperlove;
//   BehaviorSubject Search;
//   Random random;

//   Service({this.initialUrl}){
//     Search = new BehaviorSubject.seeded(this.initialUrl);
//     WallpaperUrl = new BehaviorSubject.seeded(this.initialUrl);

//     Wallpapertourism = new BehaviorSubject.seeded(this.initialUrl);
//     Wallpaper4k = new BehaviorSubject.seeded(this.initialUrl);
//     Wallpaperhd = new BehaviorSubject.seeded(this.initialUrl);
//     Wallpapernature = new BehaviorSubject.seeded(this.initialUrl);
//     Wallpaperpeople = new BehaviorSubject.seeded(this.initialUrl);
//     Wallpaperlove= new BehaviorSubject.seeded(this.initialUrl);

//   }
//   Stream get wallpaperJson => WallpaperUrl.stream;
//   Stream get wallpapertourismJson => Wallpapertourism.stream;
//   Stream get wallpaper4kJson => Wallpaper4k.stream;
//   Stream get wallpaperhdJson => Wallpaperhd.stream;
//   Stream get wallpapernatureJson => Wallpapernature.stream;
//   Stream get wallpaperpeopleJson => Wallpaperpeople.stream;
//   Stream get wallpaperlovejson=> Wallpaperlove.stream;
//   Stream get searchJson=> Search.stream;

//  //Make HTTP get Request
 
//  Future  httpRequest(qury) async{

//   var YOUR_API_KEY='563492ad6f91700001000001b6df629d92e84ed783770548c6269db3';
//   var URL= Uri.parse('https://api.pexels.com/v1/search? query='+qury+'&per_page=80&page=2');
  
//   var response = await http.get(URL,headers: {HttpHeaders.authorizationHeader: YOUR_API_KEY},);

//     if (response.statusCode == 200){
//         return response.body;
//     } 
//     else {
//         print('Request failed status: ${response.statusCode}.');
//     }
// }

// void fetch() async {
 
//    httpReuest("tourism").then((value) {
//      Wallpapertourism.sink.add(value);

//     });

//     httpReuest("4k").then((value){
//       Wallpaper4k.sink.add(value);

//     });
//     httpReuest("HD").then((value){
//       Wallpaperhd.sink.add(value);

//     });
//     httpReuest("nature").then((value) {
//       Wallpapernature.sink.add(value);

//     });
//     httpReuest("people").then((value) {
//       Wallpaperpeople.sink.add(value);

//     });
//     httpReuest("love").then((value) {
//       Wallpaperlove.sink.add(value);

//     });

//  }

// void httpRequestSearch(qury) async{

//    var YOUR_API_KEY='';
//    var URL= Uri.parse("https://api.pexels.com/v1/search?query=${query}");
 
// var response = await http.get(URL,headers: {HttpHeaders.authorizationHeader: YOUR_API_KEY},);


//   if (response.statusCode == 200){
//        return response.body;
//   } 
//   else {
//        print('Request failed status: ${response.statusCode}.');
//   }  

// }
