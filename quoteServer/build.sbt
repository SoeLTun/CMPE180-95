name := """quoteServer"""

version := "1.0-SNAPSHOT"

libraryDependencies ++= Seq(
  javaCore,
  javaWs % "test",
  jdbc,
  anorm,
  javaEbean,
  javaJdbc,
  "org.webjars" %% "webjars-play" % "2.2.0",
  "org.webjars" % "bootstrap" % "2.3.1",
  "org.mindrot"  % "jbcrypt"   % "0.3m",
  "postgresql" % "postgresql" % "9.1-901-1.jdbc4",
  "com.h2database" % "h2" % "1.4.181",
  "org.springframework" % "spring-context" % "4.1.1.RELEASE",
  "org.springframework" % "spring-orm" % "4.1.1.RELEASE",
  "org.springframework" % "spring-jdbc" % "4.1.1.RELEASE",
  "org.springframework" % "spring-tx" % "4.1.1.RELEASE",
  "org.springframework" % "spring-expression" % "4.1.1.RELEASE",
  "org.springframework" % "spring-aop" % "4.1.1.RELEASE",
  "org.springframework" % "spring-test" % "4.1.1.RELEASE" % "test",
  "org.hibernate" % "hibernate-entitymanager" % "4.3.6.Final"
)

lazy val root = (project in file(".")).enablePlugins(PlayJava)
