module Model.Repo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Json.Decode as De


type alias Repo =
    { name : String
    , description : Maybe String
    , url : String
    , pushedAt : String
    , stars : Int
    }


view : Repo -> Html msg
view repo =
     div [class "repo" ]
    [
       h2 [ class "repo-name" ] [ text repo.name ]
       , div [ class "repo-description" ] [ text ( repo.description |> Maybe.withDefault "" ) ] 
       , div [ class "repo-url" ] [ a [ href repo.url ] [ text repo.name ] ] 
       , div [ class "repo-stars" ][ text ( "Stars: " ++ String.fromInt repo.stars ) ]
    ]
   -- Debug.todo "Implement Model.Repo.view"



sortByStars : List Repo -> List Repo
sortByStars repos =
     List.reverse <| List.sortWith (\repo1 repo2 -> compare repo1.stars repo2.stars) repos 
    --Debug.todo "Implement Model.Repo.sortByStars"

{-| Deserializes a JSON object to a `Repo`.
Field mapping (JSON -> Elm):

  - name -> name
  - description -> description
  - html\_url -> url
  - pushed\_at -> pushedAt
  - stargazers\_count -> stars

-}
decodeRepo : De.Decoder Repo
decodeRepo =
     De.map5 Repo
        (De.field "name" De.string)
        (De.maybe (De.field "description" De.string))
        (De.field "html_url" De.string)
        (De.field "pushed_at" De.string)
        (De.field "stargazers_count" De.int)
    --Debug.todo "Implement Model.Repo.decodeRepo"
