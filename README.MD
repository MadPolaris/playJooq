Before Playing with this project, execute the following commands:

[1]. find a directory to download and publish sbt-liquibase-plugin locally
```
localhost:3rd-parties barry$ git clone https://github.com/zhongdj/sbt-liquibase-plugin.git
Cloning into 'sbt-liquibase-plugin'...
remote: Counting objects: 36, done.
remote: Total 36 (delta 0), reused 0 (delta 0)
Unpacking objects: 100% (36/36), done.
Checking connectivity... done
Barrys-MacBook-Pro:3rd-parties geek$ ls
sbt-liquibase-plugin
```

and then build and publish it.

```
localhost:3rd-parties barry$ cd sbt-liquibase-plugin/
localhost:sbt-liquibase-plugin barry$ sbt publishLocal
[info] Loading global plugins from /Users/barry/.sbt/0.13/plugins
[info] Loading project definition from /Users/barry/Workspaces/3rd-parties/sbt-liquibase-plugin/project
[info] Updating {file:/Users/barry/Workspaces/3rd-parties/sbt-liquibase-plugin/project/}sbt-liquibase-plugin-build...
[info] Resolving org.fusesource.jansi#jansi;1.4 ...
[info] Done updating.
[info] Set current project to sbt-liquibase-plugin (in build file:/Users/barry/Workspaces/3rd-parties/sbt-liquibase-plugin/)
[info] Updating {file:/Users/barry/Workspaces/3rd-parties/sbt-liquibase-plugin/}sbt-liquibase-plugin...
[info] Packaging /Users/barry/Workspaces/3rd-parties/sbt-liquibase-plugin/target/scala-2.10/sbt-0.13/sbt-liquibase-plugin-0.1.0-SNAPSHOT-sources.jar ...
[info] Done packaging.
[info] Wrote /Users/barry/Workspaces/3rd-parties/sbt-liquibase-plugin/target/scala-2.10/sbt-0.13/sbt-liquibase-plugin-0.1.0-SNAPSHOT.pom
[info] Resolving org.scala-sbt#sbt-launch;0.13.7 ...
[info] Done updating.
[info] :: delivering :: com.github.sbtliquibase#sbt-liquibase-plugin;0.1.0-SNAPSHOT :: 0.1.0-SNAPSHOT :: integration :: Thu Jan 01 19:17:39 CST 2015
[info] 	delivering ivy file to /Users/barry/Workspaces/3rd-parties/sbt-liquibase-plugin/target/scala-2.10/sbt-0.13/ivy-0.1.0-SNAPSHOT.xml
[info] Compiling 1 Scala source to /Users/barry/Workspaces/3rd-parties/sbt-liquibase-plugin/target/scala-2.10/sbt-0.13/classes...
[info] Main Scala API documentation to /Users/barry/Workspaces/3rd-parties/sbt-liquibase-plugin/target/scala-2.10/sbt-0.13/api...
[warn] there were 2 feature warning(s); re-run with -feature for details
model contains 8 documentable templates
[warn] one warning found
[info] Main Scala API documentation successful.
[info] Packaging /Users/barry/Workspaces/3rd-parties/sbt-liquibase-plugin/target/scala-2.10/sbt-0.13/sbt-liquibase-plugin-0.1.0-SNAPSHOT-javadoc.jar ...
[info] Done packaging.
[warn] there were 2 feature warning(s); re-run with -feature for details
[warn] one warning found
[warn] No main class detected
[info] Packaging /Users/barry/Workspaces/3rd-parties/sbt-liquibase-plugin/target/scala-2.10/sbt-0.13/sbt-liquibase-plugin-0.1.0-SNAPSHOT.jar ...
[info] Done packaging.
[info] 	published sbt-liquibase-plugin to /Users/barry/.ivy2/local/com.github.sbtliquibase/sbt-liquibase-plugin/scala_2.10/sbt_0.13/0.1.0-SNAPSHOT/poms/sbt-liquibase-plugin.pom
[info] 	published sbt-liquibase-plugin to /Users/barry/.ivy2/local/com.github.sbtliquibase/sbt-liquibase-plugin/scala_2.10/sbt_0.13/0.1.0-SNAPSHOT/jars/sbt-liquibase-plugin.jar
[info] 	published sbt-liquibase-plugin to /Users/barry/.ivy2/local/com.github.sbtliquibase/sbt-liquibase-plugin/scala_2.10/sbt_0.13/0.1.0-SNAPSHOT/srcs/sbt-liquibase-plugin-sources.jar
[info] 	published sbt-liquibase-plugin to /Users/barry/.ivy2/local/com.github.sbtliquibase/sbt-liquibase-plugin/scala_2.10/sbt_0.13/0.1.0-SNAPSHOT/docs/sbt-liquibase-plugin-javadoc.jar
[info] 	published ivy to /Users/barry/.ivy2/local/com.github.sbtliquibase/sbt-liquibase-plugin/scala_2.10/sbt_0.13/0.1.0-SNAPSHOT/ivys/ivy.xml
[success] Total time: 6 s, completed Jan 1, 2015 7:17:44 PM
```

[2]. change directory into playJooq project directory, execute sbt to start sbt console

```
localhost:playJooq barry$ sbt
[info] Loading global plugins from /Users/barry/.sbt/0.13/plugins
[info] Loading project definition from /Users/barry/Workspaces/imadz.net/JOOQ/playJooq/project
[info] Set current project to playJooq (in build file:/Users/barry/Workspaces/imadz.net/JOOQ/playJooq/)
[playJooq] $
```

[3]. inside sbt console, execute liquibaseUpdate to generate db tables under jdbc:mysql://localhost:3306/test, which was defined in build.sbt
```
[playJooq] $ liquibaseUpdate
INFO 1/1/15 6:44 PM: liquibase: Successfully acquired change log lock
INFO 1/1/15 6:44 PM: liquibase: Creating database history table with name: DATABASECHANGELOG
INFO 1/1/15 6:44 PM: liquibase: Reading from DATABASECHANGELOG
INFO 1/1/15 6:44 PM: liquibase: conf/migrations/changelog.xml: conf/migrations/baseline.xml::create wide type table::Barry: Custom SQL executed
INFO 1/1/15 6:44 PM: liquibase: conf/migrations/changelog.xml: conf/migrations/baseline.xml::create wide type table::Barry: Custom SQL executed
INFO 1/1/15 6:44 PM: liquibase: conf/migrations/changelog.xml: conf/migrations/baseline.xml::create wide type table::Barry: ChangeSet conf/migrations/baseline.xml::create wide type table::Barry ran successfully in 17ms
INFO 1/1/15 6:44 PM: liquibase: Successfully released change log lock
[success] Total time: 0 s, completed Jan 1, 2015 6:44:34 PM
```

[4]. inside sbt console, execute jooq:codegen to generate JOOQ schema classes, record classes, pojo classes and dao classes as configured in build.sbt

```
[playJooq] $ jooq:codegen
[info] Initialising properties  : /jooq-config4976483448924451004.xml
[info] License parameters
[info] ----------------------------------------------------------
[info]   Thank you for using jOOQ and jOOQ's code generator
[info]
[info] Database parameters
[info] ----------------------------------------------------------
[info]   dialect                : MYSQL
[info]   URL                    : jdbc:mysql://localhost:3306/test
[info]   target dir             : /Users/barry/Workspaces/imadz.net/JOOQ/playJooq/target/scala-2.11/src_managed/main/java
[info]   target package         : imadz.model.gen
[info]   includes               : [.*]
[info]   excludes               : []
[info]   includeExcludeColumns  : false
[info] ----------------------------------------------------------
[info]
[info] DefaultGenerator parameters
[info] ----------------------------------------------------------
[info]   strategy               : class org.jooq.util.DefaultGeneratorStrategy
[info]   deprecated             : true
[info]   generated annotation   : true
[info]   JPA annotations        : true
[info]   validation annotations : true
[info]   instance fields        : true
[info]   records                : true
[info]   pojos                  : true
[info]   immutable pojos        : false
[info]   interfaces             : false
[info]   daos                   : true
[info]   relations              : true
[info]   global references      : true
[info] ----------------------------------------------------------
[info]
[info] Generation remarks
[info] ----------------------------------------------------------
[info]   none
[info]
[info] ----------------------------------------------------------
[info] Emptying                 : /Users/barry/Workspaces/imadz.net/JOOQ/playJooq/target/scala-2.11/src_managed/main/java/imadz/model/gen
[info] Generating schemata      : Total: 1
[info] Generating schema        : Test.java
[info] ----------------------------------------------------------
[info] Sequences fetched        : 0 (0 included, 0 excluded)
[info] Tables fetched           : 8 (8 included, 0 excluded)
[info] UDTs fetched             : 0 (0 included, 0 excluded)
[info] Generating tables
[info] Synthetic primary keys   : 0 (0 included, 0 excluded)
[info] Overriding primary keys  : 8 (0 included, 8 excluded)
[info] Generating table         : Data.java [input=data, output=data, pk=KEY_data_PRIMARY]
[info] ARRAYs fetched           : 0 (0 included, 0 excluded)
[info] Enums fetched            : 0 (0 included, 0 excluded)
[info] Generating table         : PlayEvolutions.java [input=play_evolutions, output=play_evolutions, pk=KEY_play_evolutions_PRIMARY]
[info] Tables generated         : Total: 538.874ms
[info] Generating table POJOs
[info] Generating POJO          : Data.java
[info] Generating POJO          : PlayEvolutions.java
[info] Table POJOs generated    : Total: 655.573ms, +116.699ms
[info] Generating DAOs
[info] Generating DAO           : DataDao.java
[info] Generating DAO           : PlayEvolutionsDao.java
[info] Table DAOs generated     : Total: 714.2ms, +58.627ms
[info] Generating table references
[info] Table refs generated     : Total: 716.681ms, +2.481ms
[info] Generating Keys
[info] Keys generated           : Total: 722.449ms, +5.768ms
[info] Generating table records
[info] Generating record        : DataRecord.java
[info] Generating record        : PlayEvolutionsRecord.java
[info] Table records generated  : Total: 829.912ms, +107.463ms
[info] Routines fetched         : 0 (0 included, 0 excluded)
[info] Packages fetched         : 0 (0 included, 0 excluded)
[info] GENERATION FINISHED!     : Total: 850.554ms, +20.642ms
[success] Total time: 2 s, completed Dec 7, 2014 5:15:52 PM
[playJooq] $
[info]   daos                   : true
```

[5]. inside sbt console, execute run

```
[playJooq] $ run
---(Running the application, auto-reloading is enabled)---
[info] play - Listening for HTTP on /0:0:0:0:0:0:0:0:9000
(Server started, use Ctrl+D to stop and go back to the console)
```

[6]. Open web browser, paste and go for http://localhost:9000

```
[info] Compiling 2 Scala sources and 1 Java source to /Users/barry/Workspaces/imadz.net/JOOQ/playJooq/target/scala-2.11/classes...
[info] Compiling 2 Scala sources and 1 Java source to /Users/barry/Workspaces/imadz.net/JOOQ/playJooq/target/scala-2.11/classes...
[info] play - database [default] connected at jdbc:mysql://localhost:3306/test
[info] play - Application started (Dev)
```