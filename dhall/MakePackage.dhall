let MakePackage : Type =
  \(Package : Type) →
  \(Build : Type) →
  \(Environment : Type) →
    { name : Text
    , resources : List Text
    , setup : List Text
    , build : Build
    } → Package
in MakePackage
