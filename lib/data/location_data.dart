// Model for your location data
class LocationData {
  final String imageUrl;
  final String locationTitle;
  final String distance;
  final String availableDates;
  final String price;

  const LocationData({
    required this.imageUrl,
    required this.locationTitle,
    required this.distance,
    required this.availableDates,
    required this.price,
  });
}
