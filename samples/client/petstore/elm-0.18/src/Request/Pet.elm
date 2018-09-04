{-
   OpenAPI Petstore
   This is a sample server Petstore server. For this sample, you can use the api key `special-key` to test the authorization filters.

   OpenAPI spec version: 1.0.0

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git
   Do not edit this file manually.
-}


module Request.Pet exposing (addPet, deletePet, findPetsByStatus, findPetsByTags, getPetById, updatePet, updatePetWithForm, uploadFile)

import Data.Pet exposing (Pet, petDecoder, petEncoder)
import Data.ApiResponse exposing (ApiResponse, apiResponseDecoder)
import Dict
import Http
import Json.Decode as Decode


basePath : String
basePath =
    "http://petstore.swagger.io/v2"


addPet : Pet -> Http.Request ()
addPet model =
    { method = "POST"
    , url = basePath ++ "/pet"
    , headers = []
    , body = Http.jsonBody <| petEncoder model
    , expect = Http.expectStringResponse (\_ -> Ok ())
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


deletePet : Int -> Http.Request ()
deletePet petId =
    { method = "DELETE"
    , url = basePath ++ "/pet/" ++ toString petId
    , headers = []
    , body = Http.emptyBody
    , expect = Http.expectStringResponse (\_ -> Ok ())
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


{-| Multiple status values can be provided with comma separated strings
-}
findPetsByStatus : Http.Request (List Pet)
findPetsByStatus =
    { method = "GET"
    , url = basePath ++ "/pet/findByStatus"
    , headers = []
    , body = Http.emptyBody
    , expect = Http.expectJson (Decode.list petDecoder)
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


{-| Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.
-}
findPetsByTags : Http.Request (List Pet)
findPetsByTags =
    { method = "GET"
    , url = basePath ++ "/pet/findByTags"
    , headers = []
    , body = Http.emptyBody
    , expect = Http.expectJson (Decode.list petDecoder)
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


{-| Returns a single pet
-}
getPetById : Int -> Http.Request Pet
getPetById petId =
    { method = "GET"
    , url = basePath ++ "/pet/" ++ toString petId
    , headers = []
    , body = Http.emptyBody
    , expect = Http.expectJson petDecoder
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


updatePet : Pet -> Http.Request ()
updatePet model =
    { method = "PUT"
    , url = basePath ++ "/pet"
    , headers = []
    , body = Http.jsonBody <| petEncoder model
    , expect = Http.expectStringResponse (\_ -> Ok ())
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


updatePetWithForm : Int -> Http.Request ()
updatePetWithForm petId =
    { method = "POST"
    , url = basePath ++ "/pet/" ++ toString petId
    , headers = []
    , body = Http.emptyBody
    , expect = Http.expectStringResponse (\_ -> Ok ())
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


uploadFile : Int -> Http.Request ApiResponse
uploadFile petId =
    { method = "POST"
    , url = basePath ++ "/pet/" ++ toString petId ++ "/uploadImage"
    , headers = []
    , body = Http.emptyBody
    , expect = Http.expectJson apiResponseDecoder
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request