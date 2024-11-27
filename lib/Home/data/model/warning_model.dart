class Warnings {
  String? weatherEmoji;
  String? rainPercentage;
  String? expectedTime;
  String? warningTitle;

  Warnings(
      {this.weatherEmoji,
      this.rainPercentage,
      this.expectedTime,
      this.warningTitle});

  Warnings.fromJson(Map<String, dynamic> json) {
    weatherEmoji = json['weather_emoji'];
    rainPercentage = json['rain_percentage'];
    expectedTime = json['expected_time'];
    warningTitle = json['warning_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['weather_emoji'] = weatherEmoji;
    data['rain_percentage'] = rainPercentage;
    data['expected_time'] = expectedTime;
    data['warning_title'] = warningTitle;
    return data;
  }
}
