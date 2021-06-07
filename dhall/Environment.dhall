let Identifier = ./Identifier.dhall
let Map = https://prelude.dhall-lang.org/Map/Type

let Environment : Type =
  { packages : List Identifier
  , variables : Map Text Text
  }
in Environment
