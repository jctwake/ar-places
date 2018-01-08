# hack-a-thing-1-98-and-me
hack-a-thing-1-98-and-me created by GitHub Classroom

Contributor(s): Josh Thomas

*Tutorial Used* 
Jean-Pierre Distler
https://www.raywenderlich.com/146436/augmented-reality-ios-tutorial-location-based-2



Project Description:

This is a location-based iOS application that collects Places of Interest (POIs) and displays them over a camera view via augmented reality. This application consists of three views: a mapView with annotated POIs, a camera view that displays the annotations in augmented reality form, and a StreetView to view the POI up close. 

The Google Places API is used to determine the places of interest and collect information such as websites and phone numbers. This information is displayed in the camera view to allow users to look up information about a place just by pointing the camera towards it and tapping on the annotation. The user can also view a POI via Google StreetView, which is controlled via gyroscope to maintain the augmented reality feel.



What I learned:

This was my first complex iOS application progammed using the Swift language, so I was exposed to a lot of nuances of the language regarding view handling and data flow. 
This was also my first Xcode-only AR application -- it was exciting to use a library that didn't require developing in another IDE and then porting to Xcode. This library, HDAugmentedReality (https://github.com/DanijelHuis/HDAugmentedReality), offers POI tracking functionality that Apple's ARKit framework does not have. Looking around this library gives a good sense of how augmented reality works.
I also learned how to integrate the Google Maps SDK and use the Google Places API.



What didn't work:

Apple's ARKit framework might be able to be used although it adds a great deal of complexity to the application. Also, the HDAugmentedReality library is able to place the annotations on the camera without the use of feature points, making it ideal for this application.  
