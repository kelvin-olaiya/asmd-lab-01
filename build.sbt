import java.io.File
import Dependecies.*

ThisBuild / scalaVersion := "3.5.2"
ThisBuild / organization := "io.github.kelvindev15"

enablePlugins(CucumberPlugin)
CucumberPlugin.glues := List(
  "calculator",
  "example.scenarios"
)
scalafmtDetailedError := true
/*
 * Wartremover
 */
addCompilerPlugin(
  "org.wartremover" %% "wartremover" % "3.2.3" cross CrossVersion.full
)
// see: https://www.wartremover.org/doc/warts.html
scalacOptions ++= Seq("Null").map(wart =>
  s"-P:wartremover:traverser:org.wartremover.warts.${wart}"
)

Compile / doc / target := baseDirectory.value / "api"

lazy val asmdLab1 = (project in file("."))
  .settings(
    name := "ASMD Lab 1",
    scalaVersion := "3.5.2",
    libraryDependencies ++= scalaTestBundle,
    libraryDependencies ++= cucumberBundle,
    libraryDependencies ++= mockitoBundle,
    libraryDependencies += scalaCheck,
    libraryDependencies ++= Seq(
      "net.aichler" % "jupiter-interface" % JupiterKeys.jupiterVersion.value % Test,
      "io.cucumber" % "cucumber-java" % "6.11.0" % Test
    )
  )
