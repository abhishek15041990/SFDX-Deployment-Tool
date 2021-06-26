# SFDX Deploy Tool 

SFDX Deploy Tool helps you to deploy metadata from one salesforce org to another using SFDX CLI commands.

## Getting Started

Download this repository as a zip file and extract it. You can also clone this repository using the below command.
```
git clone https://github.com/abhishek15041990/SFDX-Deployment-Tool.git
```

### Prerequisites

[SFDX CLI](https://developer.salesforce.com/tools/sfdxcli) must be downloaded and installed on your system before using this tool.

### Installing

Once you've extracted this tool. You'll see a **config.txt** file with the information as shown below
```
sourceOrg=SFDCORG1
destinationOrg=SFDCORG2
package.xmlLocationToDeploy=metadata\package.xml
folderLocationForFetchedZip=metadata
waitTimeInMinutes=10
testLevel=RunSpecifiedTests
runTests=TemperatureConverterTest,LeadProcessorTest
folderLocationToUndeploy=metadata\destructive
```
Follow the below steps to configure **config.txt**,

1. Replace **SFDCORG1** by the alias of your source org in sfdx cli ( If you haven't connected your source org using sfdx cli in past, you can delete CR1 and leave this space empty )

2. Replace **SFDCORG2** by the alias of your destination org in sfdx cli ( If you haven't connected your destination org using sfdx cli in past, you can delete PB1 and leave this space empty )

3. As you can see, the **package.xmlLocationToDeploy** is given the value **metadata\package.xml** i.e. the package.xml inside the metadata folder will be used to fetch and deploy data.
Either you can update the package.xml inside the metadata folder with your own metadata or you can specify the path to your own package.xml in the config file.

4. You can also see that the **folderLocationForFetchedZip** is given the value **metadata**. This means that when you'll fetch the metadata from source org it'll create a zip file inside 
the metadata folder and this zip file will be used later to deploy the metadata to destination org. If you want to use a different folder, you can specify the full path to that folder in config file.

5. Now we have the **waitTimeInMinutes** which is specified as 10 minutes you can update it according to your choice.

6. SFDX CLI provides you 4 test levels namely:- NoTestRun, RunSpecifiedTests, RunLocalTests and RunAllTestsInOrg. I have given my **testLevel** parameter the value of **RunSpecifiedTests** which will use the **runTests** parameter to get the test classes name which will be executed while deployment. 
You can also change it to NoTestRun or anything else from the available test levels but make sure that for the **runTests** parameter, you're specifying the testclass names separated by ",". The **runTests** parameter will be used only when the **testLevel** is set to **RunSpecifiedTests**.

7. The **folderLocationToUndeploy** should consists of the location of a folder which contains an **empty package.xml** file and a **destructiveChanges.xml** file. This will be used when you need to un-deploy or remove metadata from the org. The metadata specified in destructiveChanges.xml will be removed from destination org.

**SFDX Deploy Tool** is now ready for use.

### Usage

You just need to make sure that the file **sfdxdeploytool.bat** and **config.txt** are in the same folder. 
After configuring, double click on **sfdxdeploytool.bat** and you're good to go.

## Tools and Softwares used

* [SFDX CLI](https://developer.salesforce.com/tools/sfdxcli) - Salesforce CLI.

## Todo

- [x] User should be able to fetch, validate, deploy and un-deploy metadata.
- [ ] Support for mac.

