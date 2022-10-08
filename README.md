# Countries App



This is an application where we can view various countries, access their details and save the country we want.

   * I developed the application with Swift language and MVC architecture.
   * I used Storyboard and UIKit for design.
   * I used [RapidAPI GeoDB Cities](https://rapidapi.com/wirefreethought/api/geodb-cities/) for data.



## Home screen

![Simulator Screen Shot - iPhone8 - 2022-10-07 at 22 02 59](https://user-images.githubusercontent.com/81181802/194649377-023bb2ee-5c67-4397-aef8-57466b3abda5.png)

  * After parsing the data with JSONDecoder, I placed it in Collection View.
  * At the bottom of the page is the Tab Bar Controller, where we can switch between the home screen and the saved screen.

On the home screen, we can see the names and codes of the first 10 countries in the API I used.
We can also save or delete countries by clicking the "star" button on the right of the cells.
By clicking on the desired country, we can access its details.



## Saved screen

![Simulator Screen Shot - iPhone8 - 2022-10-07 at 22 03 07](https://user-images.githubusercontent.com/81181802/194649398-a2054b1a-bdbc-40d2-a01f-486c6cbddc8a.png)

  * I used UserDefaults to save the countries and not to lose the ones we save when we close the application.

We can perform all the operations that we can do on the home screen, also on the saved screen.



## Details screen

![Simulator Screen Shot - iPhone8 - 2022-10-07 at 22 03 32](https://user-images.githubusercontent.com/81181802/194649440-cb78af1c-589d-42c8-99ab-6a6bdab4e9e5.png)
![Simulator Screen Shot - iPhone8 - 2022-10-07 at 22 03 53](https://user-images.githubusercontent.com/81181802/194649451-c0b705d1-5d68-4c8d-bba6-fccbadcaaf43.png)

  * I used the Navigation Controller to switch to the detail page.
  * I sent a request to the API again with the "code" of the country we clicked on and I have accessed its details.
 
On this page, we see the name of the country we clicked on in the title, its flag and country code below it.
In the same way, we can save or delete countries clicking the "star" button in the upper right corner.

  * When the "for more information" button is clicked, I used the country's "wikiDataId" to be redirected to the wikidata page via Safari.

![Simulator Screen Shot - iPhone8 - 2022-10-07 at 22 04 58](https://user-images.githubusercontent.com/81181802/194649476-8e791c7c-6317-4de0-ae88-703c0477a9ae.png)
