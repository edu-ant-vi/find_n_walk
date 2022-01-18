import 'package:findnwalk/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../shared/colors.dart';

class MapApp extends StatefulWidget {
  const MapApp({Key? key}) : super(key: key);

  @override
  _MapAppState createState() => _MapAppState();

}

class _MapAppState extends State<MapApp> {

    final List<LatLng> _markerPositions = [
    LatLng(44.421, 10.404),
    LatLng(45.683, 10.839),
    LatLng(45.246, 5.783),
  ];

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LoginController.location,
        zoom: 16.0,
        maxZoom: 18,
        minZoom: 5,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 130.0,
              height: 130.0,
              // TODO make this better
              point: LoginController.location ?? LatLng(0, 0),
              builder: (ctx) => GestureDetector(
                onTap: (){
                  showModalBottomSheet(
                    context: context,
                    builder: (builder){
                      return Container(
                        height: MediaQuery.of(context).size.height/3,
                        color: AppColors.white,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  color: AppColors.orange,
                                  height: MediaQuery.of(context).size.height/12,
                                ),
                                Column(
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Nome do Local",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.white,
                                            fontSize: 26
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Endereço",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white,
                                          fontSize: 12
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Descrição",
                                  style: TextStyle(
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Image.asset('assets/images/cursor.png'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
