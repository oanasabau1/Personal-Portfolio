module Model.Event exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, href)
import Model.Event.Category exposing (EventCategory(..))
import Model.Interval as Interval exposing (Interval)
import Model.Event.Category exposing (eventCategories)
import Model.Interval as Interval exposing (view)


type alias Event =
    { title : String
    , interval : Interval
    , description : Html Never
    , category : EventCategory
    , url : Maybe String
    , tags : List String
    , important : Bool
    }


categoryView : EventCategory -> Html Never
categoryView category =
    case category of
        Academic ->
            text "Academic"

        Work ->
            text "Work"

        Project ->
            text "Project"

        Award ->
            text "Award"


sortByInterval : List Event -> List Event
sortByInterval events =
    List.sortWith  (\eventA eventB -> Interval.compare eventA.interval eventB.interval) events
    --Debug.todo "Implement Event.sortByInterval"


view : Event -> Html Never
view event = 
    let
        eventClass=
            if event.important == True then "event event-important" else "event"
    in
 div [ class eventClass ]
 [
    h2 [ class "event-title" ] [ text event.title ]
    , div [ class "event-interval" ] [ Interval.view event.interval ]
    , div [ class "event-description" ] [ event.description ]
    , div [ class "event-category" ] [ categoryView event.category ]
    , div [ class "event-url" ][ a [ href  ( event.url |> Maybe.withDefault "" ) ] [] ]
    , div [] (List.map (\x -> text x) event.tags)
 ]
   -- Debug.todo "Implement the Model.Event.view function"

 