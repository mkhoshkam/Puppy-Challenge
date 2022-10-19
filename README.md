# Puppy-Challenge

Create an app that starts with a screen (Let's call it screen A) providing the following buttons:
1- Dog
2- Cat

After pressing each of the buttons, there will be another screen (screen B) appearing (it's up to you if it's a pop-up or a separate screen) to choose services for the selected pet.

Services can be:
Grooming: It's a check box.
Hotel: After selecting Hotel, there should be a pop-up (screen C) requesting the user to key in the number of nights the pet needs to stay in the hotel.

After using the services for pets, user will be redirected back to screen A, and will be able to press "Calculate Cost" button at the bottom of the screen.
Pressing this button will result in calling the following API, and showing the total cost.

API: https://assignment.shly.me
Method: Post
JSON Raw Body:
{
"dog": {
"services": {
"grooming": true,
"hotel": {
"nights": 2
}
}
},
"cat": {
"services": {
"grooming": false,
"hotel": {
"nights": 3
}
}
}
}

Please note that all keys must be present in the JSON request, otherwise the API will return an error.

Requirements:
1- It's not required to implement a fancy UI, however the app is expected to have an acceptable UX for the user to be able to select/unselect services, make changes, etc. before calculating the cost.
In addition you can spend some creativity and make your app more informative :-)
2- According to the current requirements, the cost will be calculated by the API.
However in the future, we need the app to be able to calculate the cost based on the local database as well.
The method to do so will have the following signature :
int calculateCost(bool isDogGroomingRequested, int numberOfDogHotelNights, bool isCatGroomingRequested, int numberOfCatHotelNights).
Although you DO NOT need to implement such a method, your app should require minimum changes to be able to comply and call the above method.


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
