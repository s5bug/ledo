let Package = ./dhall/Package.dhall

let foo : Package =
  λ(Package : Type) →
  λ(Build : Type) →
  λ(Environment : Type) →
  λ(MakePackage : ./dhall/MakePackage.dhall Package Build Environment) →
  λ(MakeBuild : ./dhall/MakeBuild.dhall Package Build Environment) →
  λ(MakeEnvironment : ./dhall/MakeEnvironment.dhall Package Build Environment) →
    MakePackage
      { name = "foo"
      , resources = [] : List Text
      , setup = [] : List Text
      , build = MakeBuild
        { makeDependencies = MakeEnvironment { env = [ ./bar.dhall Package Build Environment MakePackage MakeBuild MakeEnvironment, ./baz.dhall Package Build Environment MakePackage MakeBuild MakeEnvironment ] }
        , dependencies = MakeEnvironment { env = [ ./bar.dhall Package Build Environment MakePackage MakeBuild MakeEnvironment ] }
        , build = [] : List Text
        }
      }
in foo
