module Model.PersonalDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, id, href)


type alias DetailWithName =
    { name : String
    , detail : String
    }


type alias PersonalDetails =
    { name : String
    , contacts : List DetailWithName
    , intro : String
    , socials : List DetailWithName
    }


view : PersonalDetails -> Html msg
view details =
     div [] 
        [
         h1 [ id "name" ] [ text details.name ] 
         , em [ id "intro" ] [ text details.intro ]
         , div [] (List.map (\x -> div [ class "contact-detail" ] [ text x.detail ]) details.contacts)
         , div [] (List.map (\x -> a [ class "social-link", href x.detail  ] [ text (x.name ++ " ") ]) details.socials)
         -- the additional space is for multiple social links
        ]
    --Debug.todo "Implement the Model.PersonalDetails.view function"
