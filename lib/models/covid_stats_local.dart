class SouthAfricaStats {
  final National national;
  final GP gp;
  final WC wc;
  final KZN kzn;
  final EC ec;
  final FS fs;
  final MP mp;
  final LP lp;
  final NW nw;
  final NC nc;
  final NA na;

  SouthAfricaStats({
    this.national,
    this.gp,
    this.wc,
    this.kzn,
    this.ec,
    this.fs,
    this.mp,
    this.lp,
    this.nw,
    this.nc,
    this.na,
  });

  factory SouthAfricaStats.fromJson(Map data) {
    Map rsaStats = data["RSA"];
    return SouthAfricaStats(
      national: National.fromJson(rsaStats["National"]),
      gp: GP.fromJson(rsaStats["GP"]),
      wc: WC.fromJson(rsaStats["WC"]),
      ec: EC.fromJson(rsaStats["EC"]),
      fs: FS.fromJson(rsaStats["FS"]),
      mp: MP.fromJson(rsaStats["MP"]),
      lp: LP.fromJson(rsaStats["LP"]),
      nw: NW.fromJson(rsaStats["NW"]),
      nc: NC.fromJson(rsaStats["NC"]),
      na: NA.fromJson(rsaStats["NA"]),
      kzn: KZN.fromJson(rsaStats["KZN"]),
    );
  }
}

class National {
  final List<String> cases;
  final List<String> tests;
  final List<String> deaths;
  final List<String> recoveries;
  final List<String> linearRecoveries;

  National({
    this.cases,
    this.deaths,
    this.linearRecoveries,
    this.recoveries,
    this.tests,
  });

  factory National.fromJson(Map data) {
    return National(
      cases: data["Cases"],
      tests: data["Tests"],
      deaths: data["Deaths"],
      recoveries: data["Recoveries"],
      linearRecoveries: data["Linearized Recoveries"],
    );
  }
}

abstract class Province {
  final List<String> icu;
  final List<String> cases;
  final List<String> tests;
  final List<String> deaths;
  final List<String> hospital;
  final List<String> recoveries;
  final List<String> linearRecoveries;

  Province({
    this.icu,
    this.tests,
    this.cases,
    this.deaths,
    this.hospital,
    this.recoveries,
    this.linearRecoveries,
  });
}

class GP extends Province {
  final List<String> icu;
  final List<String> tests;
  final List<String> cases;
  final List<String> deaths;
  final List<String> hospital;
  final List<String> recoveries;
  final List<String> linearRecoveries;

  GP({
    this.icu,
    this.cases,
    this.tests,
    this.deaths,
    this.hospital,
    this.recoveries,
    this.linearRecoveries,
  });

  factory GP.fromJson(Map data) => GP(
        icu: data["ICU"],
        cases: data["Cases"],
        tests: data["Tests"],
        deaths: data["Deaths"],
        hospital: data["Hospital"],
        recoveries: data["Recoveries"],
        linearRecoveries: data["Recoveries Lin"],
      );
}

class WC extends Province {
  final List<String> icu;
  final List<String> cases;
  final List<String> tests;
  final List<String> deaths;
  final List<String> hospital;
  final List<String> recoveries;
  final List<String> linearRecoveries;

  WC({
    this.icu,
    this.cases,
    this.tests,
    this.deaths,
    this.hospital,
    this.recoveries,
    this.linearRecoveries,
  });

  factory WC.fromJson(Map data) => WC(
        icu: data["ICU"],
        cases: data["Cases"],
        tests: data["Tests"],
        deaths: data["Deaths"],
        hospital: data["Hospital"],
        recoveries: data["Recoveries"],
        linearRecoveries: data["Recoveries Lin"],
      );
}

class KZN extends Province {
  final List<String> icu;
  final List<String> hospital;
  final List<String> cases;
  final List<String> tests;
  final List<String> deaths;
  final List<String> recoveries;
  final List<String> linearRecoveries;

  KZN({
    this.icu,
    this.cases,
    this.tests,
    this.deaths,
    this.hospital,
    this.recoveries,
    this.linearRecoveries,
  });

  factory KZN.fromJson(Map data) => KZN(
        icu: data["ICU"],
        cases: data["Cases"],
        tests: data["Tests"],
        deaths: data["Deaths"],
        hospital: data["Hospital"],
        recoveries: data["Recoveries"],
        linearRecoveries: data["Recoveries Lin"],
      );
}

class EC {
  final List<String> icu;
  final List<String> hospital;
  final List<String> cases;
  final List<String> tests;
  final List<String> deaths;
  final List<String> recoveries;
  final List<String> linearRecoveries;

  EC({
    this.cases,
    this.tests,
    this.hospital,
    this.icu,
    this.deaths,
    this.recoveries,
    this.linearRecoveries,
  });

  factory EC.fromJson(Map data) => EC(
        icu: data["ICU"],
        cases: data["Cases"],
        tests: data["Tests"],
        deaths: data["Deaths"],
        hospital: data["Hospital"],
        recoveries: data["Recoveries"],
        linearRecoveries: data["Recoveries Lin"],
      );
}

class FS {
  final List<String> icu;
  final List<String> hospital;
  final List<String> cases;
  final List<String> tests;
  final List<String> deaths;
  final List<String> recoveries;
  final List<String> linearRecoveries;

  FS({
    this.hospital,
    this.icu,
    this.cases,
    this.tests,
    this.deaths,
    this.recoveries,
    this.linearRecoveries,
  });

  factory FS.fromJson(Map data) => FS(
        icu: data["ICU"],
        cases: data["Cases"],
        tests: data["Tests"],
        deaths: data["Deaths"],
        hospital: data["Hospital"],
        recoveries: data["Recoveries"],
        linearRecoveries: data["Recoveries Lin"],
      );
}

class MP {
  final List<String> icu;
  final List<String> hospital;
  final List<String> cases;
  final List<String> tests;
  final List<String> deaths;
  final List<String> recoveries;
  final List<String> linearRecoveries;

  MP({
    this.hospital,
    this.icu,
    this.cases,
    this.tests,
    this.deaths,
    this.recoveries,
    this.linearRecoveries,
  });

  factory MP.fromJson(Map data) => MP(
        icu: data["ICU"],
        cases: data["Cases"],
        tests: data["Tests"],
        deaths: data["Deaths"],
        hospital: data["Hospital"],
        recoveries: data["Recoveries"],
        linearRecoveries: data["Recoveries Lin"],
      );
}

class LP {
  final List<String> icu;
  final List<String> hospital;
  final List<String> cases;
  final List<String> tests;
  final List<String> deaths;
  final List<String> recoveries;
  final List<String> linearRecoveries;

  LP({
    this.hospital,
    this.icu,
    this.cases,
    this.tests,
    this.deaths,
    this.recoveries,
    this.linearRecoveries,
  });

  factory LP.fromJson(Map data) => LP(
        icu: data["ICU"],
        cases: data["Cases"],
        tests: data["Tests"],
        deaths: data["Deaths"],
        hospital: data["Hospital"],
        recoveries: data["Recoveries"],
        linearRecoveries: data["Recoveries Lin"],
      );
}

class NW {
  final List<String> icu;
  final List<String> hospital;
  final List<String> cases;
  final List<String> tests;
  final List<String> deaths;
  final List<String> recoveries;
  final List<String> linearRecoveries;

  NW({
    this.icu,
    this.hospital,
    this.cases,
    this.tests,
    this.deaths,
    this.recoveries,
    this.linearRecoveries,
  });

  factory NW.fromJson(Map data) => NW(
        icu: data["ICU"],
        cases: data["Cases"],
        tests: data["Tests"],
        deaths: data["Deaths"],
        hospital: data["Hospital"],
        recoveries: data["Recoveries"],
        linearRecoveries: data["Recoveries Lin"],
      );
}

class NC {
  final List<String> icu;
  final List<String> hospital;
  final List<String> cases;
  final List<String> tests;
  final List<String> deaths;
  final List<String> recoveries;
  final List<String> linearRecoveries;

  NC({
    this.hospital,
    this.icu,
    this.cases,
    this.tests,
    this.deaths,
    this.recoveries,
    this.linearRecoveries,
  });

  factory NC.fromJson(Map data) => NC(
        icu: data["ICU"],
        cases: data["Cases"],
        tests: data["Tests"],
        deaths: data["Deaths"],
        hospital: data["Hospital"],
        recoveries: data["Recoveries"],
        linearRecoveries: data["Recoveries Lin"],
      );
}

class NA {
  final List<String> icu;
  final List<String> hospital;
  final List<String> cases;
  final List<String> tests;
  final List<String> deaths;
  final List<String> recoveries;
  final List<String> linearRecoveries;

  NA({
    this.hospital,
    this.icu,
    this.cases,
    this.tests,
    this.deaths,
    this.recoveries,
    this.linearRecoveries,
  });

  factory NA.fromJson(Map data) => NA(
        icu: data["ICU"],
        cases: data["Cases"],
        tests: data["Tests"],
        deaths: data["Deaths"],
        hospital: data["Hospital"],
        recoveries: data["Recoveries"],
        linearRecoveries: data["Recoveries Lin"],
      );
}
