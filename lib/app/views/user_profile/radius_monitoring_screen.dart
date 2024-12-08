import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/hum_profile/be_safe_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/customTextformfield.dart';
import 'package:o_woman/utils/helper_widgets/switch.dart';

class RadiusMonitoringScreen extends StatefulWidget {
  const RadiusMonitoringScreen({Key? key}) : super(key: key);

  @override
  _RadiusMonitoringScreenState createState() => _RadiusMonitoringScreenState();
}

class _RadiusMonitoringScreenState extends State<RadiusMonitoringScreen> {
  final Completer<GoogleMapController> _controller = Completer();
// on below line we have specified camera position
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );

// on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.42796133580664, 75.885749655962),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
  ];

// created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR$error");
    });
    return await Geolocator.getCurrentPosition();
  }

  TextEditingController searchCenterPointController = TextEditingController();
  List<String> distance = <String>['  10 Km', '  20 Km', '  30 Km', '  40 Km'];
  BeSafeController beSafeController = Get.put(BeSafeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(12.0.sp),
                child: SvgPicture.asset(
                  ImagesUrl.backArrowIcon,
                  color: AppColors.blackColor.withOpacity(0.7),
                ),
              )),
          title: Text(
            "Radius Monitoring",
            style: w400_16Poppins(
              color: AppColors.blackColor.withOpacity(0.7),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.historyScreen);
              },
              child: Padding(
                padding: EdgeInsets.all(8.0.sp),
                child: Text(
                  "History",
                  style: w500_14Poppins(color: AppColors.textColor),
                ),
              ),
            )
          ],
        ),
        body: Container(
          child: SafeArea(
            // on below line creating google maps
            child: Stack(children: [
              GoogleMap(
                // on below line setting camera position
                initialCameraPosition: _kGoogle,
                // on below line we are setting markers on the map
                markers: Set<Marker>.of(_markers),
                // on below line specifying map type.
                mapType: MapType.normal,
                // on below line setting user location enabled.
                myLocationEnabled: true,
                // on below line setting compass enabled.
                compassEnabled: true,
                // on below line specifying controller on map complete.
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              Positioned(
                top: 10.h,
                right: 10.w,
                left: 10.w,
                child: CustomTextFormField(
                  hintText: "Search center point",
                  controller: searchCenterPointController,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10.0.sp),
                    child: SvgPicture.asset(
                      ImagesUrl.radiusSearchIcon,
                    ),
                  ),
                  hintStyle: w400_14Poppins(color: AppColors.colorGray),
                ),
              ),
              Positioned(
                  bottom: 0.h,
                  child: Obx(
                    () => Container(
                      color: AppColors.scaffoldBackgroundColor,
                      // height: MediaQuery.of(context).size.height * 0.068,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Column(
                          children: [
                            Center(
                              child: Container(
                                height: 6.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: const Color(0xffE7CFCF)),
                              ),
                            ),
                            height10,
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: EdgeInsets.all(8.0.sp),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Radius Monitoring",
                                          style: w400_14Poppins(),
                                        ),
                                        Text(
                                          "Lorum Ipsum lorum ipsum",
                                          style: w400_10Poppins(),
                                        )
                                      ],
                                    ),
                                    CustomSwitch(
                                      onChanged: (value) {
                                        beSafeController
                                                .radiusMonitoring.value =
                                            !beSafeController
                                                .radiusMonitoring.value;
                                      },
                                      initialValue: beSafeController
                                          .radiusMonitoring.value,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            beSafeController.radiusMonitoring.value
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      height10,
                                      Text(
                                        "Set Radius",
                                        style: w400_14Poppins(),
                                      ),
                                      Text(
                                        "Set a boundary on the map you travel regularly",
                                        style: w400_10Poppins(),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          color: AppColors.whiteColor,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.w),
                                              child: Text("Radius",
                                                  style: w400_14Poppins()),
                                            ),
                                            Center(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r),
                                                  border: Border.all(
                                                      color:
                                                          AppColors.colorGray),
                                                ),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.055,
                                                // width: MediaQuery.of(context).size.width * 0.1,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  child: DropdownMenu<String>(
                                                    initialSelection:
                                                        distance.first,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.33,
                                                    // menuHeight:
                                                    //     MediaQuery.of(context).size.height * 0.02,
                                                    trailingIcon:
                                                        SvgPicture.asset(
                                                            ImagesUrl
                                                                .dropdownIcon),

                                                    selectedTrailingIcon:
                                                        const Icon(
                                                            Icons.expand_less,
                                                            color: AppColors
                                                                .darkPinkColor),
                                                    inputDecorationTheme:
                                                        const InputDecorationTheme(
                                                            border: InputBorder
                                                                .none),
                                                    onSelected:
                                                        (String? value) {
                                                      // This is called when the user selects an item.
                                                      setState(() {
                                                        distance.first = value!;
                                                      });
                                                    },
                                                    dropdownMenuEntries:
                                                        distance.map<
                                                            DropdownMenuEntry<
                                                                String>>((String
                                                            value) {
                                                      return DropdownMenuEntry<
                                                              String>(
                                                          value: value,
                                                          label: value);
                                                    }).toList(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                      ),
                    ),
                  ))
            ]),
          ),
        ),
        // on pressing floating action button the camera will take to user current location
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     getUserCurrentLocation().then((value) async {
        //       print("${value.latitude} ${value.longitude}");

        //       // marker added for current users location
        //       _markers.add(Marker(
        //         markerId: const MarkerId("2"),
        //         position: LatLng(value.latitude, value.longitude),
        //         infoWindow: const InfoWindow(
        //           title: 'My Current Location',
        //         ),
        //       ));

        //       // specified current users location
        //       CameraPosition cameraPosition = CameraPosition(
        //         target: LatLng(value.latitude, value.longitude),
        //         zoom: 14,
        //       );

        //       final GoogleMapController controller = await _controller.future;
        //       controller
        //           .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
        //       setState(() {});
        //     });
        //   },
        //   child: const Icon(Icons.local_activity),
        // ),
      ),
    );
  }
}
