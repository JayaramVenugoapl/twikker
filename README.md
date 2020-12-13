# Twikker

Create a twitter clone application

Live URL: `https://twikker.herokuapp.com`

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

General requirements:

- Ruby 2.6.5
- Rails 6.0.2
- PG
- Puma Server
- ReactJS 16.14.0
- NPM
- Foreman

## Running the app

### Check out the repo

```
$ git clone git@github.com:JayaramVenugoapl/twikker.git
```

```
$ cd twikker
```

### Setup

1. Install pg
2. Install bundler: `gem install bundler`
3. Install gems: `bundle install`
4. Setup DB: `rails db:create db:migrate;`.
5. Setup React: `npm install`.

### Usage

1. Start rails && react server locally

```

$ rails start

```

# API

## Registration & Login

| resource      | description   |
| :------------ | :------------ |
| `/signup`     | Register User |
| `/auth/login` | Login User    |

## Feeds

| resource | description                                   |
| :------- | :-------------------------------------------- |
| `/feeds` | List tweets by current user and its followers |

## User

| resource           | description                                        |
| :----------------- | :------------------------------------------------- |
| `/users/:id`       | Update user with bio, DoB, Cover image, User Image |
| `/users/followers` | Get followers list                                 |
| `/users/following` | Get following list                                 |
| `/users/likes`     | Get favorite tweets list                           |

## Tweets

| resource                   | description              |
| :------------------------- | :----------------------- |
| `/tweets`                  | Create and Comment tweet |
| `/tweets/:id`              | Update, Delete, Edit     |
| `/tweets/:tweet_id/unlike` | dislike tweets           |
| `/tweets/:tweet_id/like`   | like tweets              |

## Relationships

| resource                    | description   |
| :-------------------------- | :------------ |
| `/api/v1/relationships`     | Follow user   |
| `/api/v1/relationships/:id` | Unfollow user |
