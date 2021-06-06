let Package = ./dhall/Package.dhall

let bar : Package =
  λ(Package : Type) →
  λ(Build : Type) →
  λ(Environment : Type) →
  λ(MakePackage : ./dhall/MakePackage.dhall Package Build Environment) →
  λ(MakeBuild : ./dhall/MakeBuild.dhall Package Build Environment) →
  λ(MakeEnvironment : ./dhall/MakeEnvironment.dhall Package Build Environment) →
    MakePackage
      { name = "bar"
      , resources = [] : List Text
      , setup = [] : List Text
      , build = MakeBuild
        { makeDependencies = MakeEnvironment { env = [] : List Package }
        , dependencies = MakeEnvironment { env = [] : List Package }
        , build = [] : List Text
        }
      }
in bar