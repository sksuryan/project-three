# 👷‍♂️ Tech-About-It
An iOS/Web app that will help find right speakers for your events and vice versa.

### What do we do?

We have interfaces for speakers and organisers. 
- If you are a speaker:
Our app will help you build your portflio and suggest conferences and meetings based on the interests and expertise in topics.
- If you are an organiser:
Our app will help you post events for your organisation and display the speakers who have applied to each event. 

### App Overview: 

* Web Interface:

![Alt text](https://user-images.githubusercontent.com/42820001/96284855-cf0ee580-0ffb-11eb-8b42-b44b8ade9a2e.png)


User Feed            |  User Profile
:-------------------------:|:-------------------------:
![](https://user-images.githubusercontent.com/42820001/96285304-66743880-0ffc-11eb-8c39-c95f17359bfd.png) |  ![](https://user-images.githubusercontent.com/42820001/96285665-e13d5380-0ffc-11eb-90ff-9264c621362e.png)


* iOS Interface:

![](https://user-images.githubusercontent.com/42820001/96287897-32027b80-1000-11eb-9e2a-ed73f2b003f5.png) |  ![](https://user-images.githubusercontent.com/42820001/96288017-62e2b080-1000-11eb-8bdd-20bd9e4880d6.png) |  ![](https://user-images.githubusercontent.com/42820001/96287965-4e9eb380-1000-11eb-8293-28f4ff5f4944.png)

User Login/Register            |  User Portfolio
:-------------------------:|:-------------------------:
![](https://user-images.githubusercontent.com/42820001/96288076-7b52cb00-1000-11eb-80a6-b9ce92cf5276.png) |  ![](https://user-images.githubusercontent.com/42820001/96288129-8dcd0480-1000-11eb-97e9-ffad74177f3c.png)


### Tech Stack used:

- For web:
  - Backend: Using Flask + Mongo Atlas
  - Frontend: React + Material UI

- For iOS:
  - Backend: Using Flask + Mongo Atlas
  - Frontend: Swift
 
 
### Basic workflow:

Our app lets the users register using Email, Name, Password as a Speaker or an Organiser. The user is redirected to a `/feed` page where the speaker is suggested events matching the topics of his interest. The Speaker can apply to events of his choice from the feed and each application shows up on the organiser's dashboard for selecting users for the speeches.

![](https://user-images.githubusercontent.com/42820001/96285988-53ae3380-0ffd-11eb-84d9-dfd543b82eb7.png)

#### For speakers:

`SignUp` -> `Login` -> `Feed` -> `Apply` -> Attend!

#### For organisers:

`SignUp` -> `Login` -> `Post Events` -> `View Applications` -> Choose attendees!

