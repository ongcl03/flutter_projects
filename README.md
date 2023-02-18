# flutter_projects

A new collection of Flutter project.

## Project Preview



## Notes to take care about
The backend logic :
- All songs are stored in firebase cloud storage
- The songs are manually uploaded to the cloud storage and the song's url need to be manually added to the firestore 'songUrl' field
- The app then retrieves the songs by getting the data (songName, artist, songUrl, imageUrl) from firebase firestore