let Environment = ./Environment.dhall

let Build : Type =
  { makeEnvironment : Environment
  , commands : List Text
  }
in Build
