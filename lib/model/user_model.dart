class User {
  String gender;
  Name name;
  Location location;
  String email;
  String username;
  String password;
  String salt;
  String md5;
  String sha1;
  String sha256;
  String registered;
  String dob;
  String phone;
  String cell;
  String sSN;
  String picture;

  User(
      {this.gender,
      this.name,
      this.location,
      this.email,
      this.username,
      this.password,
      this.salt,
      this.md5,
      this.sha1,
      this.sha256,
      this.registered,
      this.dob,
      this.phone,
      this.cell,
      this.sSN,
      this.picture});

  User.fromJson(Map<String, dynamic> json) {
    var results = json['results'];
    if (results != null) {
      var userData = results[0];
      var user = userData['user'];
      if (user != null) {
        gender = user['gender'];
        name = user['name'] != null ? new Name.fromJson(user['name']) : null;
        location = user['location'] != null
            ? new Location.fromJson(user['location'])
            : null;
        email = user['email'];
        username = user['username'];
        password = user['password'];
        salt = user['salt'];
        md5 = user['md5'];
        sha1 = user['sha1'];
        sha256 = user['sha256'];
        registered = user['registered'];
        dob = user['dob'];
        phone = user['phone'];
        cell = user['cell'];
        sSN = user['SSN'];
        picture = user['picture'];
      }
    }
  }

  User.fromLocalJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    picture = json['picture'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['email'] = this.email;
//    if (this.name != null) {
//      data['name'] = this.name.toJson();
//    }
//    data['picture'] = this.picture;
//    if (this.location != null) {
//      data['location'] = this.location.toJson();
//    }
//    data['gender'] = this.gender;
//
//    data['username'] = this.username;
//    data['password'] = this.password;
//    data['salt'] = this.salt;
//    data['md5'] = this.md5;
//    data['sha1'] = this.sha1;
//    data['sha256'] = this.sha256;
//    data['registered'] = this.registered;
//    data['dob'] = this.dob;
//    data['phone'] = this.phone;
//    data['cell'] = this.cell;
//    data['SSN'] = this.sSN;
//    return data;

    return {
      "email" : this.email ?? "",
      "name" : this.name ?? "",
      "picture" : this.picture ?? ""
    };
  }
}

class Name {
  String title;
  String first;
  String last;

  Name({this.title, this.first, this.last});

  Name.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    first = json['first'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['first'] = this.first;
    data['last'] = this.last;
    return data;
  }
}

class Location {
  String street;
  String city;
  String state;
  String zip;

  Location({this.street, this.city, this.state, this.zip});

  Location.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    return data;
  }
}
