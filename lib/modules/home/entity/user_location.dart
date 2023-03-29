import 'dart:convert';

import 'package:weather_android_app/utility/entity_extensions.dart';

class UserLocation {
  String? by;
  bool? validKey;
  Results? results;
  double? executionTime;
  bool? fromCache;

  UserLocation({
    this.by,
    this.validKey,
    this.results,
    this.executionTime,
    this.fromCache,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'by': by,
      'validKey': validKey,
      'results': results?.toMap(),
      'executionTime': executionTime,
      'fromCache': fromCache,
    };
  }

  factory UserLocation.fromMap(Map<String, dynamic> map) {
    return UserLocation(
      by: map.verifyNull<String>('by'),
      validKey: map.verifyNull<bool>('validKey'),
      results: map.verifyNull<Map<String, dynamic>>('results') != null
          ? Results.fromMap(map.verifyNull<Map<String, dynamic>>('results')!)
          : null,
      executionTime: map.verifyNull<double>('executionTime'),
      fromCache: map.verifyNull<bool>('fromCache'),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLocation.fromJson(String source) =>
      UserLocation.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Results {
  int? temp;
  String? date;
  String? time;
  String? conditionCode;
  String? description;
  String? currently;
  String? cid;
  String? city;
  String? imgId;
  int? humidity;
  double? cloudiness;
  double? rain;
  String? windSpeedy;
  int? windDirection;
  String? sunrise;
  String? sunset;
  String? conditionSlug;
  String? cityName;
  List<Forecast>? forecast;
  String? cref;

  Results(
      {this.temp,
      this.date,
      this.time,
      this.conditionCode,
      this.description,
      this.currently,
      this.cid,
      this.city,
      this.imgId,
      this.humidity,
      this.cloudiness,
      this.rain,
      this.windSpeedy,
      this.windDirection,
      this.sunrise,
      this.sunset,
      this.conditionSlug,
      this.cityName,
      this.forecast,
      this.cref});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'date': date,
      'time': time,
      'conditionCode': conditionCode,
      'description': description,
      'currently': currently,
      'cid': cid,
      'city': city,
      'imgId': imgId,
      'humidity': humidity,
      'cloudiness': cloudiness,
      'rain': rain,
      'windSpeedy': windSpeedy,
      'windDirection': windDirection,
      'sunrise': sunrise,
      'sunset': sunset,
      'conditionSlug': conditionSlug,
      'cityName': cityName,
      'forecast': forecast?.map((x) => x.toMap()).toList(),
      'cref': cref,
    };
  }

  factory Results.fromMap(Map<String, dynamic> map) {
    return Results(
      temp: map.verifyNull<int>('temp'),
      date: map.verifyNull<String>('date'),
      time: map.verifyNull<String>('time'),
      conditionCode: map.verifyNull<String>('conditionCode'),
      description: map.verifyNull<String>('description'),
      currently: map.verifyNull<String>('currently'),
      cid: map.verifyNull<String>('cid'),
      city: map.verifyNull<String>('city'),
      imgId: map.verifyNull<String>('imgId'),
      humidity: map.verifyNull<int>('humidity'),
      cloudiness: map.verifyNull<double>('cloudiness'),
      rain: map.verifyNull<double>('rain'),
      windSpeedy: map.verifyNull<String>('windSpeedy'),
      windDirection: map.verifyNull<int>('windDirection'),
      sunrise: map.verifyNull<String>('sunrise'),
      sunset: map.verifyNull<String>('sunset'),
      conditionSlug: map.verifyNull<String>('conditionSlug'),
      cityName: map.verifyNull<String>('cityName'),
      forecast: map['forecast'] != null
          ? List<Forecast>.from(
              (map['forecast'] as List<dynamic>).map<Forecast?>(
                (x) => Forecast.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      cref: map.verifyNull<String>('cref'),
    );
  }

  String toJson() => json.encode(toMap());

  factory Results.fromJson(String source) =>
      Results.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Forecast {
  String? date;
  String? weekday;
  int? max;
  int? min;
  double? cloudiness;
  double? rain;
  int? rainProbability;
  String? windSpeedy;
  String? description;
  String? condition;

  Forecast(
      {this.date,
      this.weekday,
      this.max,
      this.min,
      this.cloudiness,
      this.rain,
      this.rainProbability,
      this.windSpeedy,
      this.description,
      this.condition});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'weekday': weekday,
      'max': max,
      'min': min,
      'cloudiness': cloudiness,
      'rain': rain,
      'rainProbability': rainProbability,
      'windSpeedy': windSpeedy,
      'description': description,
      'condition': condition,
    };
  }

  factory Forecast.fromMap(Map<String, dynamic> map) {
    return Forecast(
      date: map.verifyNull<String>('date'),
      weekday: map.verifyNull<String>('weekday'),
      max: map.verifyNull<int>('max'),
      min: map.verifyNull<int>('min'),
      cloudiness: map.verifyNull<double>('cloudiness'),
      rain: map.verifyNull<double>('rain'),
      rainProbability: map.verifyNull<int>('rainProbability'),
      windSpeedy: map.verifyNull<String>('windSpeedy'),
      description: map.verifyNull<String>('description'),
      condition: map.verifyNull<String>('condition'),
    );
  }

  String toJson() => json.encode(toMap());

  factory Forecast.fromJson(String source) =>
      Forecast.fromMap(json.decode(source) as Map<String, dynamic>);
}
