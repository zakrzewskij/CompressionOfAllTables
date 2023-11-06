# PowerShell Script: CompressAllTables

This PowerShell script, named `CompressAllTables`, is designed to compress all tables in a specified SQL Server instance. It prompts the user for necessary information, creates a folder, exports table information to CSV files, and compresses each table.

## Usage

1. **Run the Script:**
    - Execute the script `CompressAllTables.ps1`.

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
