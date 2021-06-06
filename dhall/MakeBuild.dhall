let MakeBuild : Type =
  \(Package : Type) →
  \(Build : Type) →
  \(Environment : Type) →
    { makeDependencies : Environment
    , dependencies : Environment
    , build : List Text
    } → Build
in MakeBuild
