let Package = ./dhall/Package.dhall
let Identifier = ./dhall/Identifier.dhall
let Map = https://prelude.dhall-lang.org/Map/Type

let bar : Identifier =
  { organization = "tf.bug"
  , name = "bar"
  , version = "1.0.0"
  }

let baz : Identifier =
  { organization = "tf.bug"
  , name = "baz"
  , version = "1.0.0"
  }

let foo : Package =
  { identifier =
    { organization = "tf.bug"
    , name = "foo"
    , version = "1.0.0"
    }
  , resources = [] : List Text
  , setup = [] : List Text
  , build =
    { makeEnvironment =
      { packages = [bar, baz]
      , variables = [] : Map Text Text
      }
    , commands = [] : List Text
    }
  , useEnvironment =
    { packages = [bar]
    , variables = [] : Map Text Text
    }
  }
in foo
