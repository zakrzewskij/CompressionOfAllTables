# PowerShell Script: CompressAllTables

This PowerShell script, named `CompressAllTables`, is designed to compress all tables in a specified SQL Server instance. It prompts the user for necessary information, creates a folder, exports table information to CSV files, and compresses each table.

## Usage

- **Run the Script:**
  - Execute the script `CompressAllTables.ps1`.
  - The script will prompt you for the folder path, SQL Server instance name, and other optional parameters.

    ```powershell
    .\CompressAllTables.ps1
    ```

- **Specify SQL Server Instance:**
  - Run the script and specify the SQL Server instance name.

    ```powershell
    .\CompressAllTables.ps1 -SqlServerName "YourSqlServerInstance"
    ```

- **Specify CSV Delimiter:**
  - Run the script and specify a custom CSV delimiter.

    ```powershell
    .\CompressAllTables.ps1 -Delimiter ","
    ```

- **Specify Folder Path:**
  - Run the script and specify a custom folder path.

    ```powershell
    .\CompressAllTables.ps1 -Path "C:\Your\Folder\Path\"
    ```

- **Combine Different Options:**
  - Combine different options to customize the script's behavior.

    ```powershell
    .\CompressAllTables.ps1 -SqlServerName "YourSqlServerInstance" -Path "C:\Your\Folder\Path\" -Delimiter ","
    ```

Ensure that you have the necessary permissions to execute PowerShell scripts and access the specified SQL Server instance.

### Set ExecutionPolicy 
If you lack script execution privileges, switch to `RemoteSigned`. It allows for the execution of local scripts.
```powershell
Set-ExecutionPolicy RemoteSigned
```
## Functions

- **Function: ImportModuleSql**
  - Imports the `sqlserver` module if not already imported.

- **Function: CreateCompressionFolder**
  - Creates a folder at the specified path.
  - Prompts the user for the folder path.
  - Throws an error if the folder already exists.

- **Function: CompressAllTables**
  - Prompts the user for SQL Server instance name.
  - Creates a folder, exports table information to CSV files, and compresses each table.
  - Handles errors and displays relevant error messages.

