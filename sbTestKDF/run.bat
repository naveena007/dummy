set projectLocation=C:\jenkins\workspace\working\sb\sbTestKDF
cd %projectLocation%
set classpath=%projectLocation%\lib*;%projectLocation%\bin;
java org.testng.TestNG %projectLocation%\testng1.xml
pause

