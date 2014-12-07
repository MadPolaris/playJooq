name := """playJooq"""

version := "1.0-SNAPSHOT"

lazy val root = (project in file(".")).enablePlugins(PlayScala)

scalaVersion := "2.11.1"

libraryDependencies ++= Seq(
  jdbc,
  anorm,
  cache,
  ws
)

seq(jooqSettings: _*)

libraryDependencies ++= Seq(
  jdbc,
  anorm,
  //cache,
  //ws,
  // WebJars pull in client-side web libraries
  "org.webjars" % "bootstrap" % "3.2.0",
  "org.webjars" % "flot" % "0.8.0",
  "mysql" % "mysql-connector-java" % "5.1.31",
  "org.jooq" % "jooq" % "3.4.0",
  "org.jooq" % "jooq-meta" % "3.4.0",
  "org.jooq" % "jooq-scala" % "3.4.0",
  "org.jooq" % "jooq-codegen" % "3.4.0",
  "javax.persistence" % "persistence-api" % "1.0.2",
  "javax.validation" % "validation-api" % "1.1.0.Final",
  "com.fasterxml.uuid" % "java-uuid-generator" % "3.1.3"
) //map {_.withSources().withJavadoc()}


jooqVersion := "3.4.0"

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

libraryDependencies += "mysql" % "mysql-connector-java" % "5.1.31" % "jooq"