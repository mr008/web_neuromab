# web_neuromab

## Installation

### Prerequisites

Before beginning the installation, ensure that you have the following:

1. **Server with Web Hosting Capabilities**: Recommended to use a server with support for ColdFusion, as the application primarily uses ColdFusion Markup Language files.

2. **ColdFusion Server**: The application is built with ColdFusion18 files, so a ColdFusion server environment is necessary. Adobe ColdFusion or Lucee (an open-source alternative) can be used.

3. **Database**: SQL Express is needed and currently, it only supports Linux.

4. **Web Server**: A web server like Apache or IIS to host and serve the web files.

### Steps

1. **Set Up the Web Server**:
   - Install and configure your web server (Apache, IIS, etc.).
   - Ensure the web server is running and accessible.

2. **Install ColdFusion Server**:
   - Download and install Adobe ColdFusion or Lucee.
   - Follow the installation guide provided by the software to properly set it up.
   - For Windows:
     - Open a Command Prompt window.
     - Change directory to `{cfroot}\cfusion\bin`.
     - Run the following command: `coldfusion.exe -start -console`.
     - To stop ColdFusion, use: `coldfusion.exe -stop -console`.
     - To restart, use: `coldfusion.exe -restart -console`.
   - For UNIX/Linux/Solaris/MAC OS X:
     - Open a Terminal window.
     - Change directory to `{cfroot}\cfusion\bin`.
     - Run the following command: `./coldfusion start`.
   - TODO: Picture here to be inserted.

3. **Deploy Application Files**:
   - Upload the contents of the 'neuromab' folder to your web server's root directory or a specific subdirectory if appropriate.
   - Ensure that all `.cfm`, `.htm`, and other related files are placed in the correct directory where the web server can access them.

4. **Database Setup**:
   - Set up the database server; the website currently runs with Microsoft SQL Express.
   - Import any provided database schema or data in the zip file.

5. **Test the Application**:
   - Access the application through a web browser using your server's domain or IP address.
   - When you first open the ColdFusion Administrator (at http://127.0.0.1:8500/CFIDE/administrator/index.cfm), ColdFusion migrates settings from any previous version of ColdFusion to the new version.
   - Log in using the ColdFusion Administrator password (i.e., the password that you provided earlier during the installation), then follow the prompts to complete the migration.
   - Select the folder on the graphical interface.
   - TODO: Picture here to be inserted.
   - Verify that all pages load correctly and that there are no server errors.

6. **Troubleshooting**:
   - If you encounter any issues, check server logs for errors.
   - Ensure all permissions and configurations are correctly set.

For detailed instructions, refer to the documentation of each component (Web Server, ColdFusion Server, Database Server) and the specific requirements of the application.
