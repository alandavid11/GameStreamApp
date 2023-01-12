# GameStreamApp
 GameStream App (First app)
 
 This was my very first iOS app.
 App that fetch game info from an API, it has multiple views like
 - Log in / Register
 - Home screen
 - Library
 - Full game info view
 - Favorites 
 - Profile
 
 * Log in and register view:
   * It displays diferent keyboards depending if you are typing an email, password, name or username
   * Have library images selector with PhotosUI
   * Password confirmation
   * It doesn't have authentication procedures, it stores info  locally 
 ![image](https://user-images.githubusercontent.com/102493628/211953960-5557094a-7fb9-457b-bcec-0627b606a8f5.png)
 ![image](https://user-images.githubusercontent.com/102493628/211954095-624778b1-2682-4c57-8058-a3370ccb12f1.png)

* Home screen
  * Searchbar that filter games depending on what you type
  * It shows a recommended game with video player ready
  * Have suggested categories
  * Suggested games
  * Suggested video trailers of random games
  * Each button takes you to a full game info view
  
![image](https://user-images.githubusercontent.com/102493628/211954487-79a50d31-c5b0-436f-862f-8d07480ac617.png)
 
 * Library
   * Screen with all the API games fetched in a list
   * Each item takes you to the full game info view
![image](https://user-images.githubusercontent.com/102493628/211954854-55736dfb-e941-4ce1-9dd4-eb48e2b38464.png)

* Full game info view
  * Shows the video trailer of the game with native video player
  * Shows all the game info(Title, company, rating, year, description, tags)
  * Image gallery in a horizontal scroll view
![image](https://user-images.githubusercontent.com/102493628/211954958-fc4c27eb-6dee-4ea3-95c4-f5fc59444f84.png)

* Favorites
  * Fetch buttons of your favorite games that when pressed takes you to the full game info view
  ![image](https://user-images.githubusercontent.com/102493628/211955212-96e52247-a0fa-45f1-8416-191abecd129b.png)

* Profile
  * Shows you some options you can select
  * Edit profile by changing photo, name, username or password, it stores all in local memory
![image](https://user-images.githubusercontent.com/102493628/211955374-5fe3d036-47b2-4bd6-be6f-def99fc3ea15.png)

