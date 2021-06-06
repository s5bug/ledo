let MakeEnvironment : Type =
  \(Package : Type) →
  \(Build : Type) →
  \(Environment : Type) →
    { env : List Package
    } → Environment
in MakeEnvironment
