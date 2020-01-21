import 'package:ece/models/notice.dart';
import 'package:ece/models/routine.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/subjects.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:async';

import '../models/user.dart';
import '../models/auth.dart';

class ConnectedProducts extends Model {
  User _authenticatedUser;
  bool _isLoading = false;
  List<Routine> _routine;
  List<Routine> _anyRoutine;
  List<Notice> _notices = [];

  List<Routine> get routine {
    return List.from(_routine);
  }

  List<Routine> get anyRoutine {
    return List.from(_anyRoutine);
  }

  List<Notice> get notices {
    return List.from(_notices);
  }

  Future<Null> addRoutine(String subject, String day, String time, String sem,
      String year, String userId) async {
    _isLoading = true;
    notifyListeners();

    Map<String, dynamic> _routineData = {
      "subject": subject,
      "year": year,
      "sem": sem
    };
    DateTime date = DateTime.now();
    String day1 = DateFormat('EEEE').format(date);
    http
        .put(
            'https://ecedept-ba3bc.firebaseio.com/routine/${userId}/${day}/${time}.json?auth=${_authenticatedUser.token}',
            body: json.encode(_routineData))
        .then((http.Response response) {
      print(response.body);
      fetchRoutine(day1);
      _isLoading = false;
    });
  }

  Future<Null> addNotice(String subject, String desc) async {
    _isLoading = true;
    notifyListeners();

    DateTime date = DateTime.now();
    String getDate = DateFormat("dd-MM-yyyy").format(date);
    String getTime = DateFormat("hh:mm:ss").format(date);

    Map<String, dynamic> noticeData = {
      "time": getTime,
      "subject": subject,
      "desc": desc,
      "name": _authenticatedUser.name
    };

    http
        .put(
            'https://ecedept-ba3bc.firebaseio.com/notices/${getDate}/${_authenticatedUser.userId}/${getTime}.json?auth=${_authenticatedUser.token}',
            body: json.encode(noticeData))
        .then((http.Response response) {
      print(response.body);
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<Null> fetchNotice(String day) {
    _isLoading = true;
    notifyListeners();

    List<Notice> fetchedNotices = [];
    DateTime date = DateTime.now();
    String getDate = DateFormat("dd-MM-yyyy").format(date);

    return http
        .get(
            'https://ecedept-ba3bc.firebaseio.com/notices/${getDate}.json?auth=${_authenticatedUser.token}')
        .then((http.Response response) {
      print(json.decode(response.body));

      final Map<String, dynamic> noticeListData = json.decode(response.body);
      if (noticeListData == null) {
        _isLoading = false;
        _notices = fetchedNotices;
        notifyListeners();
        return;
      }

      noticeListData.forEach((String key, dynamic noticeData) {
        String time = noticeData.keys.first;

        print("Time--- ${time}");

        final Notice notice = Notice(
            userId: key,
            time: time,
            subject: noticeData[time]['subject'],
            desc: noticeData[time]['desc'],
            name: noticeData[time]['name'],
            date: getDate);

        fetchedNotices.add(notice);
        print(notice.name);
      });

      _notices = fetchedNotices;
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<Null> fetchRoutine(String day) {
    _isLoading = true;
    notifyListeners();

    List<Routine> fetchedRoutines = [];
    return http
        .get(
            'https://ecedept-ba3bc.firebaseio.com/routine/${_authenticatedUser.userId}/${day}.json?auth=${_authenticatedUser.token}')
        .then<Null>((http.Response response) {
      print(json.decode(response.body));

      final Map<String, dynamic> routineListData = json.decode(response.body);

      print("RoutineListData ${routineListData}");

      if (routineListData == null) {
        _isLoading = false;
        _routine = fetchedRoutines;
        notifyListeners();
        return;
      }

      routineListData.forEach((String time, dynamic routineData) {
        final Routine routine = Routine(
            userId: _authenticatedUser.userId,
            day: day,
            time: time,
            year: routineData['year'],
            subject: routineData['subject'],
            sem: routineData['sem']);

        fetchedRoutines.add(routine);
        print(routine.subject);
      });

      _routine = fetchedRoutines;
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<Null> fetchAnyRoutine(String userId, String day) {
    _isLoading = true;
    notifyListeners();

    List<Routine> fetchedRoutines = [];
    return http
        .get(
            'https://ecedept-ba3bc.firebaseio.com/routine/${userId}/${day}.json?auth=${_authenticatedUser.token}')
        .then<Null>((http.Response response) {
      print(json.decode(response.body));

      final Map<String, dynamic> routineListData = json.decode(response.body);

      print("RoutineListData ${routineListData}");

      if (routineListData == null) {
        _isLoading = false;
        _anyRoutine = fetchedRoutines;
        notifyListeners();
        return;
      }

      routineListData.forEach((String time, dynamic routineData) {
        final Routine routine = Routine(
            userId: _authenticatedUser.userId,
            day: day,
            time: time,
            year: routineData['year'],
            subject: routineData['subject'],
            sem: routineData['sem']);

        fetchedRoutines.add(routine);
        print(routine.subject);
      });

      _anyRoutine = fetchedRoutines;
      _isLoading = false;
      notifyListeners();
    });
  }
}

class UserModel extends ConnectedProducts {
  Timer _authTimer;

  PublishSubject<bool> _userSubject = PublishSubject();

  PublishSubject<bool> get userSubject {
    return _userSubject;
  }

  User get user {
    return _authenticatedUser;
  }

  Future<Map<String, dynamic>> signUp(String email, String password,
      String name, String desgn, String mob) async {
    _isLoading = true;
    notifyListeners();

    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    http.Response response;
    response = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCUzUsJn4uoo_pAkizmOAn5iEsO3bpj3co',
        body: json.encode(authData),
        headers: {'Content-Type': 'application/json'});

    final Map<String, dynamic> responseData = json.decode(response.body);

    bool hasError = true;
    String message = "Something went wrong";

    print("Hey signup 1st stage");

    if (responseData.containsKey('idToken')) {
      hasError = false;
      message = "Authentication Succeded";
      _authenticatedUser = User(
          email: email,
          userId: responseData['localId'],
          token: responseData['idToken'],
          name: name,
          designation: desgn,
          mob: mob);

      notifyListeners();

      Map<String, String> _authenticatedUserMap = {
        "email": email,
        "userId": responseData['localId'],
        "name": name,
        "designation": desgn,
        "mob": mob
      };

      _userSubject.add(true);
      final DateTime now = DateTime.now();
      final DateTime expiryTime =
          now.add(Duration(seconds: int.parse(responseData['expiresIn'])));

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', responseData['idToken']);
      prefs.setString('userEmail', email);
      prefs.setString('userId', responseData['localId']);
      prefs.setString('expiryTime', expiryTime.toIso8601String());

      DateTime date = DateTime.now();
      String day = DateFormat('EEEE').format(date);

      await fetchRoutine(day);
      print("Routine:${_routine}");

      http
          .put(
              'https://ecedept-ba3bc.firebaseio.com/users/${_authenticatedUser.userId}.json?auth=${_authenticatedUser.token}',
              body: json.encode(_authenticatedUserMap))
          .then((http.Response response) {
        if (response.statusCode != 200 && response.statusCode != 201) {
          _isLoading = false;
          hasError = true;
          message = 'Something went wrong';
          notifyListeners();
        }
      });
    } else if (responseData['error']['message'] == 'EMAIL_EXISTS') {
      hasError = true;
      message = "Email Already registered";
    } else if (responseData['error']['message'] == 'EMAIL_NOT_FOUND') {
      hasError = true;
      message = "Email not found";
    } else if (responseData['error']['message'] == 'INVALID_PASSWORD') {
      hasError = true;
      message = "Password is invalid";
    }

    _isLoading = false;
    notifyListeners();
    return {'success': !hasError, 'message': message};
  }

  Future<Map<String, dynamic>> logIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    http.Response response;
    response = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=API_KEY',
        body: json.encode(authData),
        headers: {'Content-Type': 'application/json'});

    final Map<String, dynamic> responseData = json.decode(response.body);

    bool hasError = true;
    String message = "Something went wrong";

    if (responseData.containsKey('idToken')) {
      hasError = false;
      message = "Authentication Succeded";

      await fetchCurrUser(responseData['localId'], responseData['idToken']);

      DateTime date = DateTime.now();
      String day = DateFormat('EEEE').format(date);

      await fetchRoutine(day);

      print(responseData['localId']);

      _userSubject.add(true);
      final DateTime now = DateTime.now();
      final DateTime expiryTime =
          now.add(Duration(seconds: int.parse(responseData['expiresIn'])));

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', responseData['idToken']);
      prefs.setString('userEmail', email);
      prefs.setString('userId', responseData['localId']);
      prefs.setString('expiryTime', expiryTime.toIso8601String());
    } else if (responseData['error']['message'] == 'EMAIL_EXISTS') {
      hasError = true;
      message = "Email Already registered";
    } else if (responseData['error']['message'] == 'EMAIL_NOT_FOUND') {
      hasError = true;
      message = "Email not found";
    } else if (responseData['error']['message'] == 'INVALID_PASSWORD') {
      hasError = true;
      message = "Password is invalid";
    }

    _isLoading = false;
    notifyListeners();
    return {'success': !hasError, 'message': message};
  }

  Future<Null> fetchCurrUser(String userId, String authToken) async {
    _isLoading = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return http
        .get(
            'https://ecedept-ba3bc.firebaseio.com/users/${userId}.json?auth=${authToken}')
        .then<Null>((http.Response response) {
      print(json.decode(response.body));
      Map<String, dynamic> fetchedData = json.decode(response.body);
      _authenticatedUser = User(
          name: fetchedData['name'],
          email: fetchedData['email'],
          mob: fetchedData['mob'],
          userId: userId,
          token: authToken,
          designation: fetchedData['designation'],
          image: fetchedData['image']);

      prefs.setString('name', fetchedData['name']);
      prefs.setString('mob', fetchedData['mob']);
      prefs.setString('image', fetchedData['image']);
      prefs.setString('designation', fetchedData['designation']);

      //print(_authenticatedUser.designation);
    });
  }

  void autoAuth() async {
    final DateTime now = DateTime.now();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    final String expiryTimeString = prefs.getString('expiryTime');
    DateTime parseExpiryTime;
    if (token != null) {
      if (expiryTimeString != null) {
        parseExpiryTime = DateTime.parse(expiryTimeString);
        if (parseExpiryTime != null && parseExpiryTime.isBefore(now)) {
          _authenticatedUser = null;
          notifyListeners();
          return;
        }
      }

      String userEmail = prefs.getString("userEmail");
      String userId = prefs.getString("userId");
      String name = prefs.getString('name');
      String desgn = prefs.getString('designation');
      String image = prefs.getString('image');
      String mob = prefs.getString('mob');

      print(image);
      print(name);
      print(desgn);

      _authenticatedUser = await User(
          name: name,
          email: userEmail,
          mob: mob,
          userId: userId,
          token: token,
          designation: desgn,
          image: image);

      print(_authenticatedUser.image);

      if (parseExpiryTime != null) {
        final int tokenLifeSpan = parseExpiryTime.difference(now).inSeconds;
        _userSubject.add(true);
        setAuthTimeout(tokenLifeSpan);
      }

      notifyListeners();
    }
  }

  void setAuthTimeout(int time) {
    _authTimer = Timer(Duration(seconds: time), () {
      logout();
    });
  }

  void logout() async {
    _authenticatedUser = null;
    //_authTimer.cancel();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _userSubject.add(false);
    prefs.remove('token');
    prefs.remove('userEmail');
    prefs.remove('userId');
    prefs.remove('name');
    prefs.remove('designation');
    prefs.remove('image');
    prefs.remove('mob');
  }
}

class UtilityModel extends ConnectedProducts {
  bool get isLoading {
    return _isLoading;
  }
}
