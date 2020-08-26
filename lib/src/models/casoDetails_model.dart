// To parse this JSON data, do
//
//     final casoDetailsCountry = casoDetailsCountryFromJson(jsonString);

import 'dart:convert';

CasoDetailsCountry casoDetailsCountryFromJson(String str) => CasoDetailsCountry.fromJson(json.decode(str));

String casoDetailsCountryToJson(CasoDetailsCountry data) => json.encode(data.toJson());

class Countries {
  List<CasoDetailsCountry> paises=new List();
  Countries();
  Countries.fromJSON_List(List<dynamic> jsonList){
    if(jsonList!=null){
      String country="";
      int cont=0;
      while(country!='Ecuador'){
        final ele=jsonList[cont];
        //print(ele);
        //print(ele.runtimeType);//Map<String,Dynamic>
        //final elemento=json.decode(jsonList[cont].toString());
        //CasoDetailsCountry casoDetailsCountry = casoDetailsCountryFromJson(ele.toString());
        final casoDetailsCountry =CasoDetailsCountry.fromJson(ele);
        country=casoDetailsCountry.countryRegion;
        paises.add(casoDetailsCountry);
        cont++;
      }
    }
  }
}


class CasoDetailsCountry {
    dynamic provinceState;
    String countryRegion;
    num lastUpdate;
    double lat;
    double long;
    int confirmed;
    int recovered;
    int deaths;
    int active;
    dynamic admin2;
    dynamic fips;
    String combinedKey;
    double incidentRate;
    dynamic peopleTested;
    dynamic peopleHospitalized;
    int uid;
    String iso3;
    String iso2;

    CasoDetailsCountry({
        this.provinceState,
        this.countryRegion,
        this.lastUpdate,
        this.lat,
        this.long,
        this.confirmed,
        this.recovered,
        this.deaths,
        this.active,
        this.admin2,
        this.fips,
        this.combinedKey,
        this.incidentRate,
        this.peopleTested,
        this.peopleHospitalized,
        this.uid,
        this.iso3,
        this.iso2,
    });

    factory CasoDetailsCountry.fromJson(Map<String, dynamic> json) => CasoDetailsCountry(
        provinceState: json["provinceState"],
        countryRegion: json["countryRegion"],
        lastUpdate: json["lastUpdate"],
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
        confirmed: json["confirmed"],
        recovered: json["recovered"],
        deaths: json["deaths"],
        active: json["active"],
        admin2: json["admin2"],
        fips: json["fips"],
        combinedKey: json["combinedKey"],
        incidentRate: json["incidentRate"].toDouble(),
        peopleTested: json["peopleTested"],
        peopleHospitalized: json["peopleHospitalized"],
        uid: json["uid"],
        iso3: json["iso3"],
        iso2: json["iso2"],
    );

    Map<String, dynamic> toJson() => {
        "provinceState": provinceState,
        "countryRegion": countryRegion,
        "lastUpdate": lastUpdate,
        "lat": lat,
        "long": long,
        "confirmed": confirmed,
        "recovered": recovered,
        "deaths": deaths,
        "active": active,
        "admin2": admin2,
        "fips": fips,
        "combinedKey": combinedKey,
        "incidentRate": incidentRate,
        "peopleTested": peopleTested,
        "peopleHospitalized": peopleHospitalized,
        "uid": uid,
        "iso3": iso3,
        "iso2": iso2,
    };
}