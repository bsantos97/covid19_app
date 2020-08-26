class Respuesta {
  Caso confirmed;
  Caso recovered;
  Caso deaths;
  String dailySummary;
  OtraRuta dailyTimeSeries;
  String image;
  String source;
  String countries;
  OtraRuta countryDetail;
  String lastUpdate;

  Respuesta({
    this.confirmed,
    this.recovered,
    this.deaths,
    this.dailySummary,
    this.dailyTimeSeries,
    this.image,
    this.source,
    this.countries,
    this.countryDetail,
    this.lastUpdate,
  });

  Respuesta.fromJSON_Map(Map<String, dynamic> json) {
    this.confirmed = Caso.fromJSON_Map(json['confirmed']);
    this.recovered = Caso.fromJSON_Map(json['recovered']);
    this.deaths = Caso.fromJSON_Map(json['deaths']);
    this.dailySummary = json['dailySummary'];
    this.dailyTimeSeries = OtraRuta.fromJSON_Map(json['dailyTimeSeries']);
    this.image = json['image'];
    this.source = json['source'];
    this.countries = json['countries'];
    this.countryDetail = OtraRuta.fromJSON_Map(json['countryDetail']);
    this.lastUpdate = json['lastUpdate'];
  }
}

class Caso {
  int value;
  String detail;

  Caso({
    this.value,
    this.detail,
  });

  Caso.fromJSON_Map(Map<String, dynamic> json) {
    this.value = json['value'];
    this.detail = json['detail'];
  }
}

class OtraRuta {
  String pattern;
  String example;

  OtraRuta({
    this.pattern,
    this.example,
  });

  OtraRuta.fromJSON_Map(Map<String, dynamic> json) {
    this.pattern = json['pattern'];
    this.example = json['example'];
  }
}
