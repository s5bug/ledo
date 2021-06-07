let Package = ./dhall/Package.dhall
let Identifier = ./dhall/Identifier.dhall
let Map = https://prelude.dhall-lang.org/Map/Type

let baz : Package =
  { identifier =
    { organization = "tf.bug"
    , name = "baz"
    , version = "1.0.0"
    }
  , resources = [] : List Text
  , setup = [] : List Text
  , build =
    { makeEnvironment =
      { packages = [] : List Identifier
      , variables = [] : Map Text Text
      }
    , commands = [] : List Text
    }
  , useEnvironment =
    { packages = [] : List Identifier
    , variables = [] : Map Text Text
    }
  }
in baz
