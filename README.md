# 👷‍♂️ Tech-About-It
An iOS/Web app that will help find right speakers for your events and vice versa.

### What do we do?

We have interfaces for speakers and organisers. 
- If you are a speaker:
Our app will help you build your portflio and suggest conferences and meetings based on the interests and expertise in topics.
- If you are an organiser:
Our app will help you post events for your organisation and display the speakers who have applied to each event. 

### App Overview: 

* Web:

![Alt text](https://user-images.githubusercontent.com/42820001/96284855-cf0ee580-0ffb-11eb-8b42-b44b8ade9a2e.png)


User Feed            |  User Profile
:-------------------------:|:-------------------------:
![](https://user-images.githubusercontent.com/42820001/96285304-66743880-0ffc-11eb-8c39-c95f17359bfd.png) |  ![](https://user-images.githubusercontent.com/42820001/96285665-e13d5380-0ffc-11eb-90ff-9264c621362e.png)




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

