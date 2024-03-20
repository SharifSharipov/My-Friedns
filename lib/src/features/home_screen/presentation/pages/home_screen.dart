import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:my_freends/src/features/home_screen/data/models/email_model/email_model.dart';
import 'package:my_freends/src/features/home_screen/domain/repositories/location_repositories/location_repositories.dart.dart';
import 'package:my_freends/src/features/home_screen/domain/service/dio/dio_setttings.dart';
import 'package:my_freends/src/features/home_screen/domain/service/map_service/yandex_map_service/yandex_map_service.dart';
import 'package:my_freends/src/features/home_screen/presentation/manager/blocs/location_bloc/location_bloc.dart';
import 'package:my_freends/src/features/home_screen/presentation/manager/blocs/order_bloc/order_bloc_bloc.dart';
import 'package:my_freends/src/features/home_screen/presentation/widgets/cammon_widgets/cammon_widgets.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  AnimationController? _animationController;
  Animation<double>? _animation;
  double opacity=0;
  @override
  void initState() {
    super.initState();
    _initPermission().ignore();
  }

  final mapControllerCompleter = Completer<YandexMapController>();
  final TextEditingController controller = TextEditingController();
  final PolylinePoints polylinePoints = PolylinePoints();
  int initialLabelIndex = 0;
  String currentLocations = "";
  List<MapObject> mapObjects = [];
  PlacemarkMapObject? currentLocationMarker; // Изменение здесь
  AppLatLong? defaultAppLatLong;
  @override
  Widget build(BuildContext context) {
    currentLocation(appLatLong: defaultAppLatLong ?? MoscowLocation());
    return BlocConsumer<LocationBloc, LocationState>(
      builder: (context, state) {
        return Scaffold(
            body: Stack(children: [
          YandexMap(
            mapObjects: mapObjects,
            onMapTap: (point) {
              BlocProvider.of<LocationBloc>(context).add(GetLocationEvent(
                  appLatLong:
                      AppLatLong(lat: point.latitude, long: point.longitude)));
              addMark(point: point, name: "jwqijk");
            },
            //nightModeEnabled: true,
            onMapCreated: (controller) {
              mapControllerCompleter.complete(controller);
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 150, bottom: 150),
                  child: MenuContainer(
                    controller: controller,
                    onSwitch: (index) {
                      initialLabelIndex = index ?? 0;
                      setState(() {});
                    },
                    intialLabelIndex: initialLabelIndex,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    onPressed: () {
                      BlocProvider.of<OrderBloc>(context).add(
                          SendOrderBlocEvent(
                              emailModel: EmailModel(
                                  toName: "asdasd",
                                  pickUp: currentLocations,
                                  date: DateTime.now().toString(),
                                  type: initialLabelIndex == 0
                                      ? "Transport"
                                      : "Delivery",
                                  dropOff: "asdasd")));
                      // List<String> streetAndHouse = controller.text.split("");
                      // BlocProvider.of<LocationBloc>(context).add(
                      //     GetLocationByAddressEvent(
                      //         street: streetAndHouse[1],
                      //         houseNumber: streetAndHouse[2]));
                    },
                  )),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
          const Spacer(),
        ]));
      },
      listener: (BuildContext context, LocationState state) {
        // if (state is LocationLoading) {
        //   showAdaptiveDialog(context: context, builder:(context)=>const AlertDialog(
        //     content: CircularProgressIndicator.adaptive(),
        //   ));
        // }
        if (state is LocationSuccess) {
          List<String> latLong = state.model.response?.geoObjectCollection
                  .featureMember?[0].geoObject?.point?.pos
                  ?.split("") ??
              [];
          addMark(
              name: "aswjwk",
              point: Point(
                  latitude: double.tryParse(latLong[0]) ?? 0.0,
                  longitude: double.tryParse(latLong[1]) ?? 0.0));
          controller.text = state
                  .model
                  .response
                  ?.geoObjectCollection
                  .featureMember?[0]
                  .geoObject
                  ?.metaDataProperty
                  ?.geocoderMetaData
                  ?.address
                  ?.formatted ??
              "";
          setState(() {});
        }
      },
    );
  }

  Future<void> _initPermission() async {
    if (!await LocationService().checkPeremesion()) {
      await LocationService().requestPeremesion();
    }
    await _fetchCurrentLocation();
    setState(() {});
  }

  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    final defLocation = MoscowLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    defaultAppLatLong = location;
    currentLocation(appLatLong: location);
    currentLocations = await LocationRepositories(dio: DioSettings().dio)
        .getLocation(appLatLong: location)
        .then((value) =>
            value.response?.geoObjectCollection.featureMember?[0].geoObject
                ?.metaDataProperty?.geocoderMetaData?.address?.formatted ??
            "");
    _moveToCurrentLocation(location);
    setState(() {});
  }

  Future<void> _moveToCurrentLocation(
    AppLatLong appLatLong,
  ) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.smooth, duration: 5),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 1,
          tilt: 0,
          //bearing: 0,
        ),
      ),
    );
    setState(() {});
  }

  void currentLocation({required AppLatLong appLatLong}) async {
    // Удаляем предыдущий маркер текущего местоположения, если он существует
    if (currentLocationMarker != null) {
      mapObjects.remove(currentLocationMarker!);
    }

    // Добавляем новый маркер текущего местоположения
    currentLocationMarker = PlacemarkMapObject(
      opacity: 1,
      mapId: const MapObjectId("currentLocationMarker"),
      point: Point(latitude: appLatLong.lat, longitude: appLatLong.long),
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          scale: 1.5,
          image: BitmapDescriptor.fromAssetImage("assets/images/mark.png"),
          rotationType: RotationType.rotate,
        ),
      ),
    );

    mapObjects.add(currentLocationMarker!);
    setState(() {});
  }

  void addMark({required Point point, required String name}) {
    final secondLocation = PlacemarkMapObject(
      opacity: 1,
      mapId: MapObjectId(name),
      point: point,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          scale: 1.5,
          image: BitmapDescriptor.fromAssetImage("assets/images/mark.png"),
          rotationType: RotationType.rotate,
        ),
      ),
    );
    print(" poxuy ---->${point.latitude}");
    print(point.longitude);
    mapObjects.add(secondLocation);
    setState(() {});
  }
  void animation()async{
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController!)
      ..addListener(() {
        setState(() {
          opacity = _animation!.value;
        });
      });
    _animationController!.repeat(reverse: true);
  }

  }

