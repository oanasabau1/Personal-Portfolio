module Model exposing (..)

import Html exposing (b, div, p, text)
import Model.Date as Date
import Model.Event as Event exposing (Event)
import Model.Event.Category exposing (EventCategory(..), SelectedEventCategories, allSelected)
import Model.Interval as Interval
import Model.PersonalDetails exposing (DetailWithName, PersonalDetails)
import Model.Repo exposing (Repo)


type alias Model =
    { personalDetails : PersonalDetails
    , events : List Event
    , selectedEventCategories : SelectedEventCategories
    , repos : List Repo
    }


academicEvents : List Event
academicEvents =
    [ { title = "Attenting Technical University of Cluj-Napoca"
      , interval = Interval.withDurationYears (Date.onlyYear 2021) 4
      , description = p [] [ text "I will become ", b [] [ text "an engineer" ], text " in 2025." ]
      , category = Academic
      , url = Nothing
      , tags = []
      , important = True
      }
    , { title = "Finishing High School"
      , interval = Interval.withDurationYears (Date.onlyYear 2017) 4
      , description = div [] [text "I finished with very good grades and gained a lot of knowledge"]
      , category = Academic
      , url = Nothing
      , tags = []
      , important = False
      }
    ]


-- workEvents : List Event
-- workEvents =
--     [ { title = "Work event 1"
--       , interval = Interval.withDurationMonths 2019 Date.Jun 3
--       , description = text "Internship"
--       , category = Work
--       , url = Nothing
--       , tags = []
--       , important = False
--       }
--     , { title = "Work event 2"
--       , interval = Interval.open (Date.full 2020 Date.Sep)
--       , description = text "Junior position"
--       , category = Work
--       , url = Nothing
--       , tags = []
--       , important = False
--       }
--     ]


projectEvens : List Event
projectEvens =
    [ { title = "Order Management System"
      , interval = Interval.withDurationMonths 2023 Date.May 1
      , description = text "Application written in Java, connected to a MySQL database, implements CRUD operations"
      , category = Project
      , url = Just "https://github.com/oanasabau1/Order-Management-System"
      , tags = []
      , important = False
      }
    , { title = "MIPS 16 Single Cycle"
      , interval = Interval.withDurationMonths 2023 Date.Mar 2
      , description = text "Computes the Greatest Common Divisor (GCD) between two elements from an array with given indexes."
      , category = Project
      , url = Just "https://github.com/oanasabau1/MIPS-16-Single-Cycle"
      , tags = []
      , important = True
      }
    , { title = "Polynomial Calculator"
      , interval = Interval.oneYear 2023
      , description = text "Performant polynomial calculator written in Java"
      , category = Project
      , url = Just "https://github.com/oanasabau1/Polynomial-Calculator"
      , tags = []
      , important = True
      }
   , { title = "Flappy Bird"
      , interval = Interval.oneYear 2021
      , description = text "C++ implementation of Flappy Bird"
      , category = Project
      , url = Just "https://github.com/oanasabau1/Flappy-Bird"
      , tags = []
      , important = False
      }
    ]


personalDetails : PersonalDetails
personalDetails =
    { name = "Oana-Maria Sabău"
    , intro = "Passionate & Ambitious Computer Science Student"
    , contacts = [ DetailWithName "email" "oanasabau1@gmail.com" ]
    , socials = [ DetailWithName "github" "https://github.com/oanasabau1" , DetailWithName "linkedin" "https://www.linkedin.com/in/oana-sabau1/" ]
    }

initModel : Model
initModel =
    { personalDetails = personalDetails
    , events = Event.sortByInterval <| academicEvents ++ projectEvens 
    , selectedEventCategories = allSelected
    , repos = []
    }
