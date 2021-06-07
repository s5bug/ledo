let Identifier : Type = ./Identifier.dhall
let Build : Type = ./Build.dhall
let Environment : Type = ./Environment.dhall

let Package : Type =
  { identifier : Identifier
  , resources : List Text
  , setup : List Text
  , build : Build
  , useEnvironment : Environment
  }
in Package
