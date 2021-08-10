# Replenish Builds

This project includes the CL commands necessary for building and promoting API source code. Currently there is one .sql file per github issue, and the commands are intended to be run from Access Client Solutions - Run SQL Scripts. 

## Setup
The commands in the .sql files assume that you have one library list for each environment. Within Run SQL Scripts, this requires one JDBC configuration per environment.

![JDBC Configurations](docs/img/jdbc-configurations.png)

### Development Configuration
Your development configuration should look something like this:

![Development Configuration](docs/img/development-configuration.png)

### ITE Configuration
Your configuration for the Integrated Testing Environment should look something like this:

![ITE Configuration](docs/img/ite-configuration.png)

### Deployment Configuration
Lastly, your configuration for deployment should look something like this:

![Deployment Configuration](docs/img/deployment-config.png)


## Creating A Build Script
In order to create a new build script that corresponds to a certain GitHub issue on the K3S-Replenish-RPG repository, copy the file called GH-template.sql and name the file according to the GitHub issue number (e.g., GH455 for issue number 455). Once that file is created, open it with Run SQL Scripts.

![Opening file in ACS](docs/img/screen-shot-1.png)

Now follow the steps in the comments of the template. These will allow you to quickly set values throughout the file including the API program names, service program names, and text descriptions.

Notice that there are four sections within the file that represent the four steps you will take when developing and promoting the source code. The commands within the development, ITE, and deployment sections are intended to be run with their corresponding JDBC configurations. You can quickly switch configurations by selecting Connection -> Apply JDBC Configuration in the Run SQL Scripts menu.

![Switching JDBC config in ACS](docs/img/screen-shot-2.png)

Once you have applied the appropriate JDBC configuration, you can highlight the commands for the environment that you're working in and press command + R to "Run Selected." Compilation output will be in your spooled files.