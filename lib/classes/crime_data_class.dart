class CrimeDataClass {
  String? pcd;
  num ? populationTotal;
  num ? crimeCount;
  num ? previousCrimeCount;
  num ? delta;
  List<CrimeAgrTable>? crimeAgrTable;
  List<CrimeGeoTable>? crimeGeoTable;
  ShortPcdRanking? shortPcdRanking;
  PcdDistrictRanking? pcdDistrictRanking;
  PcdNationalRanking? pcdNationalRanking;

  CrimeDataClass(
      {this.pcd,
      this.populationTotal,
      this.crimeCount,
      this.previousCrimeCount,
      this.delta,
      this.crimeAgrTable,
      this.crimeGeoTable,
      this.shortPcdRanking,
      this.pcdDistrictRanking,
      this.pcdNationalRanking});

  CrimeDataClass.fromJson(Map<String, dynamic> json) {
    pcd = json['pcd'];
    populationTotal = json['populationTotal'];
    crimeCount = json['crimeCount'];
    previousCrimeCount = json['previousCrimeCount'];
    delta = json['delta'];
    if (json['crimeAgrTable'] != null) {
      crimeAgrTable = <CrimeAgrTable>[];
      json['crimeAgrTable'].forEach((v) {
        crimeAgrTable!.add(CrimeAgrTable.fromJson(v));
      });
    }
    if (json['crimeGeoTable'] != null) {
      crimeGeoTable = <CrimeGeoTable>[];
      json['crimeGeoTable'].forEach((v) {
        crimeGeoTable!.add(CrimeGeoTable.fromJson(v));
      });
    }
    shortPcdRanking = json['shortPcdRanking'] != null
        ? ShortPcdRanking.fromJson(json['shortPcdRanking'])
        : null;
    pcdDistrictRanking = json['pcdDistrictRanking'] != null
        ? PcdDistrictRanking.fromJson(json['pcdDistrictRanking'])
        : null;
    pcdNationalRanking = json['pcdNationalRanking'] != null
        ? PcdNationalRanking.fromJson(json['pcdNationalRanking'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pcd'] = pcd;
    data['populationTotal'] = populationTotal;
    data['crimeCount'] = crimeCount;
    data['previousCrimeCount'] = previousCrimeCount;
    data['delta'] = delta;
    if (crimeAgrTable != null) {
      data['crimeAgrTable'] =
          crimeAgrTable!.map((v) => v.toJson()).toList();
    }
    if (crimeGeoTable != null) {
      data['crimeGeoTable'] =
          crimeGeoTable!.map((v) => v.toJson()).toList();
    }
    if (shortPcdRanking != null) {
      data['shortPcdRanking'] = shortPcdRanking!.toJson();
    }
    if (pcdDistrictRanking != null) {
      data['pcdDistrictRanking'] = pcdDistrictRanking!.toJson();
    }
    if (pcdNationalRanking != null) {
      data['pcdNationalRanking'] = pcdNationalRanking!.toJson();
    }
    return data;
  }
}

class CrimeAgrTable {
  String? crimeType;
  num? crimeCount;
  num? delta;

  CrimeAgrTable({this.crimeType, this.crimeCount, this.delta});

  CrimeAgrTable.fromJson(Map<String, dynamic> json) {
    crimeType = json['crimeType'];
    crimeCount = json['crimeCount'];
    delta = json['delta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['crimeType'] = crimeType;
    data['crimeCount'] = crimeCount;
    data['delta'] = delta;
    return data;
  }
}

class CrimeGeoTable {
  String? month;
  String? crimeType;
  double? latitude;
  double? longitude;

  CrimeGeoTable({this.month, this.crimeType, this.latitude, this.longitude});

  CrimeGeoTable.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    crimeType = json['crimeType'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['month'] = month;
    data['crimeType'] = crimeType;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class ShortPcdRanking {
  num? ranking;
  num? total;
  num? rankingDelta;
  List<ShortPcdRankingTable>? shortPcdRankingTable;

  ShortPcdRanking(
      {this.ranking, this.total, this.rankingDelta, this.shortPcdRankingTable});

  ShortPcdRanking.fromJson(Map<String, dynamic> json) {
    ranking = json['ranking'];
    total = json['total'];
    rankingDelta = json['rankingDelta'];
    if (json['shortPcdRankingTable'] != null) {
      shortPcdRankingTable = <ShortPcdRankingTable>[];
      json['shortPcdRankingTable'].forEach((v) {
        shortPcdRankingTable!.add(ShortPcdRankingTable.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ranking'] = ranking;
    data['total'] = total;
    data['rankingDelta'] = rankingDelta;
    if (shortPcdRankingTable != null) {
      data['shortPcdRankingTable'] =
          shortPcdRankingTable!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShortPcdRankingTable {
  num? ranking;
  String? pcd;
  num? latestSix;
  num? rankingDelta;
  num? delta;

  ShortPcdRankingTable(
      {this.ranking, this.pcd, this.latestSix, this.rankingDelta, this.delta});

  ShortPcdRankingTable.fromJson(Map<String, dynamic> json) {
    ranking = json['ranking'];
    pcd = json['pcd'];
    latestSix = json['latestSix'];
    rankingDelta = json['rankingDelta'];
    delta = json['delta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ranking'] = ranking;
    data['pcd'] = pcd;
    data['latestSix'] = latestSix;
    data['rankingDelta'] = rankingDelta;
    data['delta'] = delta;
    return data;
  }
}

class PcdDistrictRanking {
  num? ranking;
  num? total;
  num? rankingDelta;
  List<PcdDistrictRankingTable>? pcdDistrictRankingTable;

  PcdDistrictRanking(
      {this.ranking,
      this.total,
      this.rankingDelta,
      this.pcdDistrictRankingTable});

  PcdDistrictRanking.fromJson(Map<String, dynamic> json) {
    ranking = json['ranking'];
    total = json['total'];
    rankingDelta = json['rankingDelta'];
    if (json['pcdDistrictRankingTable'] != null) {
      pcdDistrictRankingTable = <PcdDistrictRankingTable>[];
      json['pcdDistrictRankingTable'].forEach((v) {
        pcdDistrictRankingTable!.add(PcdDistrictRankingTable.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ranking'] = ranking;
    data['total'] = total;
    data['rankingDelta'] = rankingDelta;
    if (pcdDistrictRankingTable != null) {
      data['pcdDistrictRankingTable'] =
          pcdDistrictRankingTable!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PcdDistrictRankingTable {
  num? ranking;
  String? pcdDistrict;
  double? crimeRateLatest;
  num? rankingDelta;
  double? delta;

  PcdDistrictRankingTable(
      {this.ranking,
      this.pcdDistrict,
      this.crimeRateLatest,
      this.rankingDelta,
      this.delta});

  PcdDistrictRankingTable.fromJson(Map<String, dynamic> json) {
    ranking = json['ranking'];
    pcdDistrict = json['pcdDistrict'];
    crimeRateLatest = json['crimeRateLatest'];
    rankingDelta = json['rankingDelta'];
    delta = json['delta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ranking'] = ranking;
    data['pcdDistrict'] = pcdDistrict;
    data['crimeRateLatest'] = crimeRateLatest;
    data['rankingDelta'] = rankingDelta;
    data['delta'] = delta;
    return data;
  }
}

class PcdNationalRanking {
  num? ranking;
  num? total;
  num? rankingDelta;
  List<PcdNationalRankingTable>? pcdNationalRankingTable;

  PcdNationalRanking(
      {this.ranking,
      this.total,
      this.rankingDelta,
      this.pcdNationalRankingTable});

  PcdNationalRanking.fromJson(Map<String, dynamic> json) {
    ranking = json['ranking'];
    total = json['total'];
    rankingDelta = json['rankingDelta'];
    if (json['pcdNationalRankingTable'] != null) {
      pcdNationalRankingTable = <PcdNationalRankingTable>[];
      json['pcdNationalRankingTable'].forEach((v) {
        pcdNationalRankingTable!.add(PcdNationalRankingTable.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ranking'] = ranking;
    data['total'] = total;
    data['rankingDelta'] = rankingDelta;
    if (pcdNationalRankingTable != null) {
      data['pcdNationalRankingTable'] =
          pcdNationalRankingTable!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PcdNationalRankingTable {
  num? ranking;
  String? pcdDistrict;
  String? placeName;
  String? county;
  String? area;
  double? crimeRateLatest;
  num ? rankingDelta;
  double? delta;

  PcdNationalRankingTable(
      {this.ranking,
      this.pcdDistrict,
      this.placeName,
      this.county,
      this.area,
      this.crimeRateLatest,
      this.rankingDelta,
      this.delta});

  PcdNationalRankingTable.fromJson(Map<String, dynamic> json) {
    ranking = json['ranking'];
    pcdDistrict = json['pcdDistrict'];
    placeName = json['placeName'];
    county = json['county'];
    area = json['area'];
    crimeRateLatest = json['crimeRateLatest'];
    rankingDelta = json['rankingDelta'];
    // delta = json['delta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ranking'] = ranking;
    data['pcdDistrict'] = pcdDistrict;
    data['placeName'] = placeName;
    data['county'] = county;
    data['area'] = area;
    data['crimeRateLatest'] = crimeRateLatest;
    data['rankingDelta'] = rankingDelta;
    data['delta'] = delta;
    return data;
  }
  
}