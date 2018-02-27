# README

## Team It

This application is the backend for the Team It front end application hosted here [Team It!](https://marshallhouston.github.io/team-it/)

Team It is an app for youth sport coaches to quickly communicate with families using React on the front end, Twilio for messaging, and Rails as the backend.

It was built from scratch over a 2 week period by Marshall Houston as a personal project at the [Turing School of Software & Design](https://www.turing.io/)

## Setup
This application uses Ruby 2.4.1.

Clone the repo.

    $ git clone https://github.com/marshallhouston/team-it-api.git

Change into the directory and install gem dependencies

    $ cd match-up
    $ bundle install

Next, initialize the database, run the migrations, and seed the database.

    $ rake db:create
    $ rake db:migrate
    $ rake create_teams

To run the app on a local server,

    $ rails s

This will run the app on port 3000 'http://localhost:3000'.

## Endpoints

The following endpoints are available. To view this information locally, make sure to run the server locally. The `fast_jsonapi` gem was used as a serializer for these responses.

  `GET /api/v1/teams` and it returns all the teams in the application with additional information for id, type, and attributes (name and team_code). It also returns meta information about the total number of teams in the application.

  Example Response
  ```
  {
    "data": [
      {
        "id": "1",
        "type": "team",
        "attributes": {
          "name": "Westwood Girls Basketball",
          "team_code": 133
        }
      },
      {
        "id": "3",
        "type": "team",
        "attributes": {
          "name": "Littleton Thunder",
          "team_code": 543
        }
      }
    ],
    "meta": {
      "total_teams": 2
    }
  }
  ```

  `POST /api/v1/teams` will create a new team when passed in with a header of `CONTENT_TYPE: application/json` and a body of `{"team": {"name": "YOUR-TEAM-NAME"} }` This endpoint returns the newly created team object.

  Example Response
  ```
  {
    "data": {
        "id": "6",
        "type": "team",
        "attributes": {
            "name": "Borussia Dortmund Juniors",
            "team_code": 171
        },
        "relationships": {
            "users": {
                "data": []
            }
          }
        }
  }
  ```


  `GET /api/v1/teams/:team_id` returns information about each team and includes information about the relationships (followers) for each team. Initially, each team does not have any followers. If a team does have followers, these followers and their information will be returned.

  Example response
  ```
  {
    "data": {
        "id": "4",
        "type": "team",
        "attributes": {
            "name": "Golden Rockets Softball",
            "team_code": 483
        },
        "relationships": {
            "users": {
                "data": [
                    {
                        "id": "4",
                        "type": "user"
                    }
                ]
            }
        }
    },
    "included": [
        {
            "id": "4",
            "type": "user",
            "attributes": {
                "name": "Anthony Majors",
                "phone": "+15555555555",
                "email": "aj@gmail.com"
            }
        }
    ]
  }
  ```

  `POST /api/v1/teams/:team_id/followers` with a header of `CONTENT_TYPE: application/json` and a body `{"follower": {"name": "First_Name Last_Name", "phone": "xxx-xxx-xxxx", "email": "email@email.com"} }`. This endpoint will create a new follower for the team, and this allows folks to receive text messages from this team's message feed.

  This includes a message in the "meta" key that confirms the user was added to the team.

  Example Response
  ```
  {
  "data": {
      "id": "6",
      "type": "team",
      "attributes": {
          "name": "Borussia Dortmund Juniors",
          "team_code": 171
      },
      "relationships": {
          "users": {
              "data": [
                  {
                      "id": "4",
                      "type": "user"
                  }
              ]
          }
      }
  },
  "meta": {
      "message": "Borussia Dortmund Juniors added a new follower - Anthony Majors"
  },
  "included": [
      {
          "id": "4",
          "type": "user",
          "attributes": {
              "name": "Anthony Majors",
              "phone": "+15555555555",
              "email": "aj@gmail.com"
          }
      }
    ]
  }
  ```

## Testing

Team It is tested in RSpec, the contents of which can be found in the /spec directory folder.

To prepare the database for testing, run

    $ rake db:test:prepare

To run the test suite,

    $ rspec
