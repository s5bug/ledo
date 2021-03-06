lazy val core = project
  .in(file("core"))
  .settings(
    organization := "tf.bug",
    name := "ledo",
    version := "0.1.0",
    scalaVersion := "2.13.6",
    libraryDependencies ++= Seq(
      "org.typelevel" %% "cats-core" % "2.6.1",
      "org.typelevel" %% "cats-effect" % "3.1.1",
      "com.monovore" %% "decline" % "2.0.0",
      "com.monovore" %% "decline-effect" % "2.0.0",
      "org.dhallj" % "dhall-core" % "0.9.0-M2",
      "org.dhallj" %% "dhall-scala" % "0.9.0-M2",
      "org.dhallj" %% "dhall-imports" % "0.9.0-M2",
      "org.http4s" %% "http4s-jdk-http-client" % "0.5.0-RC1",
    ),
    Compile / mainClass := Some("tf.bug.ledo.Main"),
    nativeImageOptions := Seq(
      "--allow-incomplete-classpath",
      "--no-fallback",
      "--initialize-at-build-time=scala",
      "--enable-http",
      "--enable-https",
      "--enable-all-security-services",
      "-H:+ReportExceptionStackTraces",
    ),
  )
  .enablePlugins(NativeImagePlugin)
