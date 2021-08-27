
##### Tags: `ios` `yelp` `clone` `teach-ios` `Parse` `Back4App` `MongoDB` `CodePath`

# Yelpy

Developed from scratch a simple clone of Yelp app that we use to teach CodePath's iOS Curriculum utilized by more than 600+ students every year. This is an iOS (Swift) that integrates Yelp Fusion API, custom MongoDB + Parse backend server hosted on Back4App. This project is to demonstrate what it takes to make a simple clone of Yelp in the course of 6 weeks. 

## Table of Contents

- [Yelpy](#yelpy)
  - [Table of Contents](#table-of-contents)
  - [Setup/Installation 🏗](#setupinstallation-)
  - [Yelp API](#yelp-api)
    - [Network](#network)
  - [Database](#database)
    - [Schema](#schema)
  - [Project Demo Features](#project-demo-features)
    - [API Data Presentation + Animations](#api-data-presentation--animations)
    - [User Auth + Group Chat](#user-auth--group-chat)
    - [MapKit + Image Upload](#mapkit--image-upload)
  - [Built With](#built-with)
  - [Authors](#authors)

## Setup/Installation 🏗


1. MacOS (for running Xcode)
1. Download and install [Xcode](https://developer.apple.com/xcode/)
1. Open `Yelpy.xcworkspace` and run it

## Yelp API

We used [**Parse**](https://parseplatform.org/) (hosted on [**Back4app**](https://www.back4app.com/)) as our backend to handle login/register from the iOS app and also the group chat capabilities between users.

[**Yelp's Fusion API**](https://www.yelp.com/fusion) was used to gather data from businesses.


### Network

- `POST` /search – retrieve businesses from a given search query in SF



## Database

We used [**mongoDB**](https://www.mongodb.com/) and [**Parse server**](https://parseplatform.org/), hosted on [**Back4App**](https://www.back4app.com/) to manage our data for the application. This helps students focus more on how iOS works connecting to a database and not get distracted or overloaded with learning backend development. 

### Schema

Below is the database schema for our simple MongoDB (managed by parse and hosted by Heroku and Back4app).

**User**

| Name       | Type   | Descrpition                          |
| ---------- | ------ | ------------------------------------ |
| username   | string | n/a                                  |
| password   | string | user password (hashed)               |
| created_at | date   | when the user was created            |
| updated_at | date   | when the user was *recently* updated |

**Message**

| Name       | Type           | Descrpition                             |
| ---------- | -------------- | --------------------------------------- |
| text       | string         | content of message                      |
| user       | user (pointer) | user object reference                   |
| created_at | date           | when the message was first sent         |
| updated_at | date           | when the message was *recently* updated |

## Project Demo Features

Below are the following features that are capable for the app:


### API Data Presentation + Animations

- Load data from Yelp API + Search Bar
	- <img src="https://i.imgur.com/SEyigmC.gif" height=400>

- Animations using [Lottie](https://airbnb.io/lottie/#/) and [SkeletonView](https://github.com/Juanpe/SkeletonView)
	- <img src="https://imgur.com/EJGYjhl.gif" height=400>

### User Auth + Group Chat

- Login/Logout
- Messaging/Chatting capabilities
- Save messages using [Parse Server](https://parseplatform.org/)
	- <img src="https://imgur.com/vhH5dkG.gif" height=400>

### MapKit + Image Upload

- Show business in Map
- Upload image to Map Pin
	- <img src="https://imgur.com/Npz2m1A.gif" height=400>


## Built With

- [Yelp Fusion API](https://www.yelp.com/fusion)
- [Lottie](https://airbnb.io/lottie/#/)
- [SkeletonView](https://github.com/Juanpe/SkeletonView)
- [Parse Server](https://parseplatform.org/)
- [Heroku (hosting of Parse Server)](https://heroku.com)
- Apple MapKit


## Authors

- **Guillermo Sanchez** - [membriux](https://github.com/membriux)
  - Project Lead
  - Initial design/planning
  - MVC Architecture design + implementation
  - Yelp API Integration
  - Parse + MongoDB Integration
  - Messaging/Chat feature
  - Search capabilities
- **German Flores** - [Germantv](https://github.com/Germantv)
  - MapKit Integration
  - Image Upload capability
- **Mark Falcone** - [markFalcone](https://github.com/markFalcone)
  - AutoLayout
  - Lottie Animation Integration
  - SkeletonView Integration
  - Messaging/Chat feature
