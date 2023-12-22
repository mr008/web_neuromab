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

3. **Configure ColdFusion with Web Server**:
   - Integrate ColdFusion with your web server. This typically involves configuring the web server to process `.cfm` files through the ColdFusion server.

4. **Deploy Application Files**:
   - Upload the contents of the 'neuromab' folder to your web server's root directory or a specific subdirectory if appropriate.
   - Ensure that all `.cfm`, `.htm`, and other related files are placed in the correct directory where the web server can access them.

5. **Database Setup (currently)**:
   - Set up the database server, currently the website runs with Microsoft SQL Express.
   - Create a new database and import any provided database schema or data.

6. **Application Configuration**:
   - Edit any configuration files (if present) to set up database connections or specify application settings.
   - This step may require updating files within the 'include' directory or specific `.cfm` files.

7. **Test the Application**:
   - Access the application through a web browser using your server's domain or IP address.
   - Verify that all pages load correctly and that there are no server errors.

8. **Troubleshooting**:
   - If you encounter any issues, check server logs for errors.
   - Ensure all permissions and configurations are correctly set.

For detailed instructions, refer to the documentation of each component (Web Server, ColdFusion Server, Database Server) and the specific requirements of the application.
