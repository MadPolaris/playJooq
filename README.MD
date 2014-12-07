Before Playing with this project, execute the following commands:

1. change directory into this project directory
2. execute sbt to start sbt console

```
localhost:playJooq barry$ sbt
[info] Loading global plugins from /Users/geek/.sbt/0.13/plugins
[info] Loading project definition from /Users/geek/Workspaces/imadz.net/JOOQ/playJooq/project
[info] Set current project to playJooq (in build file:/Users/geek/Workspaces/imadz.net/JOOQ/playJooq/)
[playJooq] $
```

3. inside sbt console, execute runMain DBEvolve to generate db tables under jdbc:mysql://localhost:3306/test, which was defined in build.sbt
```
[playJooq] $ runMain DBEvolve
[info] Running DBEvolve
[success] Total time: 2 s, completed Dec 7, 2014 5:13:54 PM
```

4. inside sbt console, execute jooq:codegen to generate JOOQ schema classes, record classes, pojo classes and dao classes as configured in build.sbt

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
[info]   target dir             : /Users/geek/Workspaces/imadz.net/JOOQ/playJooq/target/scala-2.11/src_managed/main/java
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
[info] Emptying                 : /Users/geek/Workspaces/imadz.net/JOOQ/playJooq/target/scala-2.11/src_managed/main/java/imadz/model/gen
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
[info] Generating table         : T1.java [input=t1, output=t1, pk=KEY_t1_PRIMARY]
[info] Generating table         : Tbl_16charPkUuid.java [input=tbl_16char_pk_uuid, output=tbl_16char_pk_uuid, pk=KEY_tbl_16char_pk_uuid_PRIMARY]
[info] Generating table         : Tbl_64charPkUuid.java [input=tbl_64char_pk_uuid, output=tbl_64char_pk_uuid, pk=KEY_tbl_64char_pk_uuid_PRIMARY]
[info] Generating table         : TblAutoPkUuid.java [input=tbl_auto_pk_uuid, output=tbl_auto_pk_uuid, pk=KEY_tbl_auto_pk_uuid_PRIMARY]
[info] Generating table         : TblBinaryPkUuid.java [input=tbl_binary_pk_uuid, output=tbl_binary_pk_uuid, pk=KEY_tbl_binary_pk_uuid_PRIMARY]
[info] Generating table         : TblComboPkUuid.java [input=tbl_combo_pk_uuid, output=tbl_combo_pk_uuid, pk=KEY_tbl_combo_pk_uuid_PRIMARY]
[info] Tables generated         : Total: 538.874ms
[info] Generating table POJOs
[info] Generating POJO          : Data.java
[info] Generating POJO          : PlayEvolutions.java
[info] Generating POJO          : T1.java
[info] Generating POJO          : Tbl_16charPkUuid.java
[info] Generating POJO          : Tbl_64charPkUuid.java
[info] Generating POJO          : TblAutoPkUuid.java
[info] Generating POJO          : TblBinaryPkUuid.java
[info] Generating POJO          : TblComboPkUuid.java
[info] Table POJOs generated    : Total: 655.573ms, +116.699ms
[info] Generating DAOs
[info] Generating DAO           : DataDao.java
[info] Generating DAO           : PlayEvolutionsDao.java
[info] Generating DAO           : T1Dao.java
[info] Generating DAO           : Tbl_16charPkUuidDao.java
[info] Generating DAO           : Tbl_64charPkUuidDao.java
[info] Generating DAO           : TblAutoPkUuidDao.java
[info] Generating DAO           : TblBinaryPkUuidDao.java
[info] Generating DAO           : TblComboPkUuidDao.java
[info] Table DAOs generated     : Total: 714.2ms, +58.627ms
[info] Generating table references
[info] Table refs generated     : Total: 716.681ms, +2.481ms
[info] Generating Keys
[info] Keys generated           : Total: 722.449ms, +5.768ms
[info] Generating table records
[info] Generating record        : DataRecord.java
[info] Generating record        : PlayEvolutionsRecord.java
[info] Generating record        : T1Record.java
[info] Generating record        : Tbl_16charPkUuidRecord.java
[info] Generating record        : Tbl_64charPkUuidRecord.java
[info] Generating record        : TblAutoPkUuidRecord.java
[info] Generating record        : TblBinaryPkUuidRecord.java
[info] Generating record        : TblComboPkUuidRecord.java
[info] Table records generated  : Total: 829.912ms, +107.463ms
[info] Routines fetched         : 0 (0 included, 0 excluded)
[info] Packages fetched         : 0 (0 included, 0 excluded)
[info] GENERATION FINISHED!     : Total: 850.554ms, +20.642ms
[success] Total time: 2 s, completed Dec 7, 2014 5:15:52 PM
[playJooq] $
[info]   daos                   : true
```

5. inside sbt console, execute run

```
[playJooq] $ run

--- (Running the application, auto-reloading is enabled) ---

[info] play - Listening for HTTP on /0:0:0:0:0:0:0:0:9000

(Server started, use Ctrl+D to stop and go back to the console...)

```

6. Open web browser, paste and go for http://localhost:9000

```
[info] Compiling 2 Scala sources and 1 Java source to /Users/geek/Workspaces/imadz.net/JOOQ/playJooq/target/scala-2.11/classes...
[info] Compiling 2 Scala sources and 1 Java source to /Users/geek/Workspaces/imadz.net/JOOQ/playJooq/target/scala-2.11/classes...
[info] play - database [default] connected at jdbc:mysql://localhost:3306/test
[info] play - Application started (Dev)
```