#####################################################################################################################################################
##### ###Test Clip Config
#### Config for W1 - Clip section test cases#####
##### Author: Brian Tsang
##### Last updated: 21/07/2015
#####################################################################################################################################################

#Testrail Reporting variable
####### DO NOT PUT SPACE AFTER COMMAS FOR TEST CASEIDS ###############
$projectID = "151"
$suiteID = "4100"
$caseids = ""
$versionId = "2.9.0.7787"
$description = "BigTed ActiveX, Release candidate 2.9.0"
#User ENPS config (Specific to the machine/user login)
$userfolder = "userfolder.png"


=begin


## Site varaibles ###
$siteAsel = "BigTedW1.png"
$siteBsel = "BigTedMillbank.png"
$siteCsel = "PlymouthBigTed.png"
$siteDsel = "BigTedATVPTV.png"

$siteAlogo = "West1.png"
$siteBlogo = "Millbank.png"
$siteClogo = "Plymouth.png"
$siteDlogo = "ATVPTV.png"
=end

##################################### Clip Section #################################################


#####Clips from W1#####
#### You can change the clips here, but make sure you also change the images ############

###Clip 1####
$clipA = 'OBIT/CHARLESCONTROV/1311/3/6'
$cliptitleimageA = "clip1.png"
$startframeA = "1stframeclip1.png"
$clipAinenps = "clip1inenps.png"
$clipAinenpsHL = "clip1inenpsHL.png"

###Clip 2####
$clipB = 'SYRIAMEDIA/ALK/0500/28/2'
$cliptitleimageB = "clip2.png"
$startframeB = "1stframeclip2.png"
$clipBinenps = "clip2inenps.png"

###Clip 3####
$clipC = 'LOCKERBIE/CAMPBELL/1200/23/8'
$cliptitleimageC = "clip3.png"
$startframeC = "1stframeclip3.png"
$clipCinenps = "clip3inenps.png"

###Clip 4####
$clipD = 'SUMMER/SHUKMAN/2200/29/7'
$cliptitleimageD = "clip4.png"
$startframeD = "1stframeclip4.png"
$clipDinenps = "clip4inenps.png"

####aIRsPEED###
$clipA_Airspeed = 'ZZ_QA_TEST_NOT_RECORDING'
$cliptitleimageA_Airspeed = "clip1_Airspeed.png"
#$startframeA_Airspeed = "1stframeclip1_Airspeed.png"
$clipAinenps_Airspeed = "clip1inenps_Airspeed.png"
$clipAinenpsHL_Airspeed = "clip1inenpsHL_Airspeed.png"

###Clip 2####
$clipB_Airspeed = 'ZZ_QA_TEST_RECORDING'
$cliptitleimageB_Airspeed = "clip2_Airspeed.png"
#$startframeB_Airspeed = "1stframeclip2_Airspeed.png"
$clipBinenps_Airspeed = "clip2inenps_Airspeed.png"

###Clip 3####
$clipC_Airspeed = 'BT Sport Europe Malmo v Celtic .1'
$cliptitleimageC_Airspeed = "clip3_Airspeed.png"
#$startframeC_Airspeed = "1stframeclip3_Airspeed.png"
$clipCinenps_Airspeed = "clip3inenps_Airspeed.png"

###Clip 4####
$clipD_Airspeed = '2225 weather backup (bcrclean) 150825.1'
$cliptitleimageD_Airspeed = "clip4_Airspeed.png"
#$startframeD_Airspeed = "1stframeclip4_Airspeed.png"
$clipDinenps_Airspeed = "clip4inenps_Airspeed.png"


### Clip Array #############
$clipitemarray = "#{$clipAinenps},#{$clipBinenps},#{$clipCinenps},#{$clipDinenps},#{$clipAinenpsHL}"
$inword = "in word & test"
$outword = "out word & test"
=begin
#### CG style from W1###
$styleA = "news.png"
$styleAhl = "newshl.png"
$styleB = "newsnight.png"
$styleBhl = "newsnighthl.png"
$styleC = "politics.png"
$styleChl = "politicshl.png"
$styleD = "others.png"
$styleDhl = "othershl.png"
=end

##################################### CG Section #################################################

$testname = 'test NAME @' #testing " = &quot;
$testdes = "test DESIGNATION"
$tetloc = "test LOCATION & Case" #testing & = &amp;
$testtime = "test TIME Offset"
$testfree = "test CG Freetext"
$testtab = "test CG Tabtext"
$teststrap = "test CG Straptext"
$testtick = "This ' is a test for TICKER Content!!"  #yesying ' &apos;
$testlabcon = "Labour, < > Conservative" #testing < = &lt; and > = &gt;
$testeditcg = "This is an Edit CG object test for TICKER Content!!"
$testcombo = "This is a test to check combo box text input clear!!"


##### CG Name From Database test ########
#$cgdbtestA = "davidcamerontexthl.png"
#$cgdbtestB = "dface.png"
#$cgdbtestC = "dctext.png"
$cgdbtestA = "theresamaytexthl.png"
$cgdbtestB = "tface.png"
$cgdbtestC = "tmtext.png"
$cgdbtestarray = "#{$cgdbtestA},#{$cgdbtestB},#{$cgdbtestC}"

######## CG TEST Verification in ENPS varibales ###################
######## CG - News - Name, Locator #############
$cgAinenps = "cgnewsnamename.png" #Name
$cgBinenps = "cgnewslocatoruppercase.png" #LocatorLeft
$cgEinenps = "cgnewsnamedb.png" #Name from DB
$cgMinenps = "cglocateorasscent.png"
######## CG - Newsnight - Locator #############
$cgCinenps = "cgnnlocatorlowercase.png" # Locator
######## CG - POLITICS - Coming Up #############
$cgDinenps = "cgpoliticscominguptitlercase.png" #coming up
$cgHinenps = "cgpoliticscrawl.png" #crawl
$cgJinenps = "cgpoliticscrawlintegration.png" #integration test1
$cgKinenps = "cgpoliticscrawlintegrationHL.png" #integration test1 View
$cgLinenps = "cgpoliticscrawlintegrationedit.png" #integration test edit
######## CG - OTHERS - Locator ###############
$cgFinenps = "cgothershardtalklocator.png" #Hardtalk locator
$cgGinenps = "cgothersnewswatchstrap.png"#Newswatch strap
$cgIinenps = "cgothersnrdlogoon.png" #NRD LOGO OFF


######## CG Test Verify in ENPS Array #############
$cgitemarray = "#{$cgAinenps},#{$cgBinenps},#{$cgCinenps},#{$cgDinenps},#{$cgEinenps},#{$cgFinenps},#{$cgGinenps},#{$cgHinenps},#{$cgIinenps},#{$cgMinenps}"
$cgintegrationarray =  $cgJinenps + "," + $cgKinenps  + "," + $cgLinenps
######## CG Timming Field Array **DO NOT MODIFIY!!** #############
$cgautotimmingarray = "cgintime.png,cgduration.png,cgouttime.png"
$accentlowerAarray = "a1.png,a2.png,a3.png,a4.png,a5.png,a6.png,a7.png,a8.png"
$accentlowerEarray = "e1.png,e2.png,e3.png,e4.png,e5.png"
$accentlowerIarray = "i1.png,i2.png,i3.png,i4.png"
$accentlowerOarray = "o1.png,o2.png,o3.png,o4.png,o5.png,o6.png,o7.png,o8.png"
$accentlowerUarray = "u1.png,u2.png,u3.png,u4.png,u5.png"
$accentlowerYarray = "y1.png,y2.png"
$accentlowerCarray = "c1.png,c2.png,c3.png"
$accentlowerSarray = "s1.png,s2.png,s3.png,s4.png"
$accentlowerNarray = "n1.png,n2.png,n3.png"

$accentUpperAarray = "UA1.png,UA2.png,UA3.png,UA4.png,UA5.png,UA6.png,UA7.png,UA8.png"
$accentUpperEarray = "UE1.png,UE2.png,UE3.png,UE4.png,UE5.png"
$accentUpperIarray = "UI1.png,UI2.png,UI3.png,UI4.png"
$accentUpperOarray = "UO1.png,UO2.png,UO3.png,UO4.png,UO5.png,UO6.png,UO7.png,UO8.png"
$accentUpperUarray = "UU1.png,UU2.png,UU3.png,UU4.png,UU5.png"
$accentUpperYarray = "UY1.png,UY2.png"
$accentUpperCarray = "UC1.png,UC2.png,UC3.png"
$accentUpperSarray = "US1.png,US2.png,US3.png,US4.png"
$accentUpperNarray = "UN1.png,UN2.png,UN3.png"


##################################### Mosart Section #################################################
$mosartAinenps = "mosartldn1.png"
$mosartBinenps = "mosartldn2.png"
$mosartCinenps = "mosartldn3.png"
$mosartDinenps = "mosartldn4.png"

########## Mosart Test Verify in ENPS Array ##########
$mosartintegrationarray = "#{$mosartAinenps},#{$mosartBinenps},#{$mosartCinenps},#{$mosartDinenps}"
