import 'package:flower_app/model/model_bottom_nav.dart';

class InitModel {

  final int themeColor;
  final String appType;
  final String appBaseUrl;
  final String splashImgUrl;
  final List<BottomNavModel> bottomNav;

	InitModel.fromJsonMap(Map<String, dynamic> map):
		themeColor = map["themeColor"],
		appType = map["appType"],
		appBaseUrl = map["appBaseUrl"],
		splashImgUrl = map["splashImgUrl"],
		bottomNav = List<BottomNavModel>.from(map["bottomNav"].map((it) => BottomNavModel.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['themeColor'] = themeColor;
		data['appType'] = appType;
		data['appBaseUrl'] = appBaseUrl;
		data['splashImgUrl'] = splashImgUrl;
		data['bottomNav'] = bottomNav != null ? 
			this.bottomNav.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
