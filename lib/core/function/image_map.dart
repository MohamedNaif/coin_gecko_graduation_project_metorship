String getMapImageUrl({
  String width = "278",
  String height = "148",
  required num latitude,
  required num longitude,
}) {
  return "https://maps.googleapis.com/maps/api/staticmap?"
      "center=$latitude,$longitude"
      "&zoom=16"
      "&size=${width}x$height"
      "&markers=color:red%7Clabel:%7C$latitude,$longitude"
      "&key=AIzaSyARJKYuZLAoUWO0M68tJLDrbUjAz57FaGA";
}
