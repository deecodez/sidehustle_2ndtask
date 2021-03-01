import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
  // _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var pressure;
  var sunRise;
  var visibility;
  var degree;
  var city;

  Future getWeather() async {
    http.Response response = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=Lagos&units=imperial&appid=182e0ab596c0390dd48deaf29e4704c2");
    var results = jsonDecode(response.body);
    setState(() {
      this.city = results['name'];
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.visibility = results['visibility'];
      this.pressure = results['main']['pressure'];
      this.windSpeed = results['wind']['speed'];
      this.degree = results['wind']['deg'];
      this.sunRise = results['sys']['sunrise'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    print(sunRise);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/weather_bg.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(
            children: [
              Text(
                city != null ? "Currently in $city" : 'Waiting',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                temp != null ? temp.toString() + "2\u00B0" : "loading",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                currently != null ? currently.toString() : "loading",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 150.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(9.0),
                      height: 90.0,
                      width: 95.0,
                      child: Column(
                        children: [
                          FaIcon(FontAwesomeIcons.clock),
                          SizedBox(height: 5.0),
                          Text(
                            pressure != null ? pressure.toString() : "loading",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15.0),
                          ),
                          SizedBox(height: 5.0),
                          Text('Pressure'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(9.0),
                      height: 90.0,
                      width: 95.0,
                      child: Column(
                        children: [
                          FaIcon(FontAwesomeIcons.wind),
                          SizedBox(height: 5.0),
                          Text(
                            windSpeed != null
                                ? windSpeed.toString()
                                : "loading",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15.0),
                          ),
                          SizedBox(height: 5.0),
                          Text('Wind'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(9.0),
                      height: 90.0,
                      width: 95.0,
                      child: Column(
                        children: [
                          FaIcon(FontAwesomeIcons.thermometerHalf),
                          SizedBox(height: 5.0),
                          Text(
                            temp != null
                                ? temp.toString() + "2\u00B0"
                                : "loading",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15.0),
                          ),
                          SizedBox(height: 5.0),
                          Text("Temp"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(9.0),
                      height: 90.0,
                      width: 95.0,
                      child: Column(
                        children: [
                          FaIcon(FontAwesomeIcons.cloud),
                          SizedBox(height: 5.0),
                          Text(
                            humidity != null ? humidity.toString() : "loading",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15.0),
                          ),
                          SizedBox(height: 5.0),
                          Text('Humidity'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(9.0),
                      height: 90.0,
                      width: 95.0,
                      child: Column(
                        children: [
                          FaIcon(FontAwesomeIcons.lowVision),
                          SizedBox(height: 5.0),
                          Text(
                            visibility != null
                                ? visibility.toString()
                                : "loading",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15.0),
                          ),
                          SizedBox(height: 5.0),
                          Text('Visibility'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(9.0),
                      height: 90.0,
                      width: 95.0,
                      child: Column(
                        children: [
                          FaIcon(FontAwesomeIcons.cloud),
                          SizedBox(height: 5.0),
                          Text(
                            degree != null ? degree.toString() : "loading",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15.0),
                          ),
                          SizedBox(height: 5.0),
                          Text('Degree'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
