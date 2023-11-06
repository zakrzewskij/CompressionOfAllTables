# PowerShell Script: CompressAllTables

This PowerShell script, named `CompressAllTables`, is designed to compress all tables in a specified SQL Server instance. It prompts the user for necessary information, creates a folder, exports table information to CSV files, and compresses each table.

## Usage

1. **Run the Script:**
    - Execute the script `CompressAllTables.ps1`.
    - The script will prompt you for the folder path, SQL Server instance name, and other optional parameters.

    ```powershell
    .\CompressAllTables.ps1
    ```

2. **Specify SQL Server Instance:**
    - Run the script and specify the SQL Server instance name.

    ```powershell
    .\CompressAllTables.ps1 -SqlServerName "MySqlServerInstance"
    ```

3. **Specify CSV Delimiter:**
    - Run the script and specify a custom CSV delimiter.

    ```powershell
    .\CompressAllTables.ps1 -Delimiter ","
    ```

4. **Specify Folder Path:**
    - Run the script and specify a custom folder path.

    ```powershell
    .\CompressAllTables.ps1 -Path "C:\Custom\Folder\Path\"
    ```

5. **Combine Different Options:**
    - Combine different options to customize the script's behavior.

    ```powershell
    .\CompressAllTables.ps1 -SqlServerName "MySqlServerInstance" -Path "C:\Custom\Folder\Path\" -Delimiter ","
    ```

### Functions

- **Function: ImportSqlServerModule**
    - Imports the `sqlserver` module if not already imported.

- **Function: CreateCompressionFolder**
    - Creates a folder at the specified path.
    - Prompts the user for the folder path.
    - Throws an error if the folder already exists.

- **Function: CompressAllTables**
    - Prompts the user for SQL Server instance name.
    - Creates a folder, exports table information to CSV files, and compresses each table.
    - Handles errors and displays relevant error messages.

### Example Usage:

```powershell
# Run the script and compress all tables in the default SQL Server instance
.\CompressAllTables.ps1

# Run the script, compress all tables, and specify the SQL Server instance
.\CompressAllTables.ps1 -SqlServerName "MySqlServer"
```
