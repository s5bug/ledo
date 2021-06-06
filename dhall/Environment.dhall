let Environment : Type =
  ∀(Package : Type) →
  ∀(Build : Type) →
  ∀(Environment : Type) →
  ∀(MakePackage : ./MakePackage.dhall Package Build Environment) →
  ∀(MakeBuild : ./MakeBuild.dhall Package Build Environment) →
  ∀(MakeEnvironment : ./MakeEnvironment.dhall Package Build Environment) →
    Environment
in Environment
