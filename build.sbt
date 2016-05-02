import com.github.sbtliquibase.SbtLiquibase
import com.github.sbtliquibase.Import._
import com.typesafe.sbt.packager.docker.Dockerfile
import com.typesafe.sbt.packager.Keys.dist
import sbtdocker.Instructions._
import sbtdocker._
import java.io.File

name := """playJooq"""

version := "1.0-SNAPSHOT"

lazy val root = (project in file(".")).enablePlugins(PlayScala).enablePlugins(SbtLiquibase)

scalaVersion := "2.11.4"

libraryDependencies ++= Seq(
  jdbc,
  cache,
  ws
)

libraryDependencies ++= Seq(
  // WebJars pull in client-side web libraries
  "org.webjars" % "bootstrap" % "3.2.0",
  "org.webjars" % "flot" % "0.8.0",
  "mysql" % "mysql-connector-java" % "5.1.31",
  "org.jooq" % "jooq" % "3.7.2",
  "org.jooq" % "jooq-meta" % "3.7.2",
  "org.jooq" % "jooq-scala" % "3.7.2",
  "org.jooq" % "jooq-codegen" % "3.7.2",
  "javax.persistence" % "persistence-api" % "1.0.2",
  "javax.validation" % "validation-api" % "1.1.0.Final",
  "com.fasterxml.uuid" % "java-uuid-generator" % "3.1.3"
)

libraryDependencies += "mysql" % "mysql-connector-java" % "5.1.31" % "jooq"

seq(jooqSettings: _*)

jooqVersion := "3.7.2"

jooqOptions := Seq(
  "jdbc.driver" -> "com.mysql.jdbc.Driver",
  "jdbc.url" -> "jdbc:mysql://localhost:3306/test",
  "jdbc.user" -> "root",
  "jdbc.password" -> "1q2w3e4r5t",
  "generator.database.name" -> "org.jooq.util.mysql.MySQLDatabase",
  "generator.database.inputSchema" -> "test",
  "generator.target.packageName" -> "imadz.model.gen",
  "generator.generate.pojos" -> "true",
  "generator.generate.daos" -> "true",
  "generator.generate.jpaAnnotations" -> "true",
  "generator.generate.validationAnnotations" -> "true",
  "generator.generate.generatedAnnotation" -> "true"
)

liquibaseChangelog := "conf/migrations/changelog.xml"

liquibaseUsername := "root"

liquibasePassword := "1q2w3e4r5t"

liquibaseDriver   := "com.mysql.jdbc.Driver"

liquibaseUrl      := "jdbc:mysql://localhost:3306/test?createDatabaseIfNotExist=true"

enablePlugins(DockerPlugin)

dockerfile in docker := {
  val zipFile: File = dist.in(Compile, packageBin).value
  val unzipFolder = file(s"${zipFile.getParentFile.getAbsolutePath}/app")
  IO.unzip(zipFile, unzipFolder)
  val targetFolder = new File(unzipFolder, "playjooq-1.0-SNAPSHOT")
//  IO.gzip(unzipFolder, tarFile)
  new mutable.Dockerfile {
    // Base image
    from("java")
    // Add the JAR file
    add(targetFolder, "/app/")
    // On launch run Java with the classpath and the main class
    cmd("bash", s"/app/bin/playjooq")
  }
}
