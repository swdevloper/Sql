USE [master]
GO

/* Test */
CREATE DATABASE [SimpleSteps2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SimpleSteps2_dat', FILENAME = N'C:\SwDeveloper_Database\SimpleSteps\SimpleSteps2_dat.mdf' , SIZE = 102400KB , MAXSIZE = 1024000KB , FILEGROWTH = 102400KB )
 LOG ON 
( NAME = N'SimpleSteps2_log', FILENAME = N'C:\SwDeveloper_Database\SimpleSteps\SimpleSteps2_log.ldf' , SIZE = 102400KB , MAXSIZE = 1024000KB , FILEGROWTH = 102400KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO

