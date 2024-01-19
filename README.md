# web_neuromab

# Installation

## Prerequisites

Before beginning the installation, ensure that you have the following:

1. **Server with Web Hosting Capabilities**: Recommended to use a server with support for ColdFusion, as the application primarily uses ColdFusion Markup Language files.

2. **ColdFusion Server**: The application is built with ColdFusion files, so a ColdFusion server environment is necessary. Adobe ColdFusion or Lucee (an open-source alternative) can be used.

3. **Database**: If the application uses a database, ensure a compatible database server is installed and running (e.g., MySQL, SQL Server).

4. **Web Server**: A web server like Apache or IIS to host and serve the web files.

## Steps

1. **Set Up the Web Server**:
   - Install and configure your web server (Apache, IIS, etc.).
   - Ensure the web server is running and accessible.

2. **Install ColdFusion Server**:
   - Download and install Adobe ColdFusion or Lucee.
   - Follow the installation guide provided by the software to properly set it up.
   - For Windows
Open a Command Prompt window
Change directory to {cfroot}\cfusion\bin
Run the following command: coldfusion.exe -start -console
You can also stop and restart ColdFusion. To stop ColdFusion use coldfusion.exe -stop -console. To restart use coldfusion.exe -restart -console.
 - For UNIX/Linux/Solaris/MAC OS X
Open a Terminal window
Change directory to {cfroot}\cfusion\bin
Run the following command: ./coldfusion start
- TODO: Picture here to be inserted

3. **Configure ColdFusion with Web Server**:
   - Integrate ColdFusion with your web server. This involves configuring the web server to process `.cfm` files through the ColdFusion server.
   - Note the location of your your folder with cfm files, later this will be loaded into your ColdFusion server on the graphic interface

4. **Deploy Application Files**:
   - Upload the contents of the 'neuromab' folder to your web server's root directory or a specific subdirectory if appropriate.
   - Ensure that all `.cfm`, `.htm`, and other related files are placed in the correct directory where the web server can access them.

5. **Database Setup (currently)**:
   - Set up the database server, server currently the website runs with Microsoft SQL Express.
   - Create a new database and import any provided database schema or data.

6. **Test the Application**:
   - Access the application through a web browser using your server's domain or IP address.
   - When you first open the ColdFusion Administrator (at http://127.0.0.1:8500/CFIDE/administrator/index.cfm), ColdFusion migrates settings from any previous version of ColdFusion to the new version.
   - Log in using the ColdFusion Administrator password (i.e. the password that you provided earlier during the installation), then follow the prompts to complete the migration.
   - Select the folder on the graphic interface
   - TODO: Picture here to be inserted
   - Verify that all pages load correctly and that there are no server errors.

7. **Troubleshooting**:
   - If you encounter any issues, check server logs for errors.
   - Ensure all permissions and configurations are correctly set.

For detailed instructions, refer to the documentation of each component (Web Server, ColdFusion Server, Database Server) and the specific requirements of the application.
