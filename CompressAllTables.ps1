# PowerShell Script: CompressAllTables.ps1

# Imports the 'sqlserver' module if not already imported
function ImportModuleSql {
    if (-not (Get-Module -Name "sqlserver")) {
        Import-Module sqlserver -Verbose
    }
}

# Creates a folder at the specified path, throws an error if it already exists
function CreateCompressionFolder {
    [CmdletBinding()]
    param (
        [string]$Path = (Read-Host "Enter the folder path"), # Prompt user for folder path
        [string]$Delimiter = ";"  # Default delimiter for CSV files
    )

    try {
        New-Item -Path $Path -ItemType Directory -ErrorAction Stop -Verbose
    }
    catch {
        Write-Error "Error creating folder: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Compresses all tables in a SQL Server instance
function CompressAllTables {
    [CmdletBinding()]
    param (
        [string]$SqlServerName = (Read-Host "Enter SQL Server instance name"), # Prompt user for SQL Server instance name
        [string]$User = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name,
        [string]$Delimiter = ";"  # Default delimiter for CSV files
    )

    CreateCompressionFolder -Delimiter $Delimiter  # Prompt user for folder path

    ImportModuleSql  # Import the SQL Server module

    $SqlServer = New-Object Microsoft.SqlServer.Management.Smo.Server($SqlServerName)

    foreach ($Database in ($SqlServer.Databases | Where-Object { $_.owner -eq $User })) {
        $DatabaseName = $Database.Name

        # Export table information to a CSV file
        $Database.Tables |
        Select-Object @{Name = "DatabaseName"; Expression = { $Database.Name } },
        @{Name = "SchemaName"; Expression = { $_.Schema } },
        @{Name = "TableName"; Expression = { $_.Name } } |
        ConvertTo-Csv -Delimiter $Delimiter |
        Select-Object -Skip 1 |
        Add-Content -Path ($Path + $DatabaseName + ".csv") -Verbose

        # Import CSV file and compress each table
        Import-Csv -Path ($Path + $DatabaseName + ".csv") -Delimiter $Delimiter |
        ForEach-Object {
            $FullTableNameSql = $_.DatabaseName + "." + $_.SchemaName + "." + $_.TableName
            Write-Host "Full table name: $FullTableNameSql" -BackgroundColor Cyan

            try {
                # Execute SQL command to compress the table
                Invoke-Sqlcmd -ServerInstance $SqlServerName -Database $DatabaseName `
                    -Query ("ALTER TABLE $FullTableNameSql REBUILD PARTITION = ALL WITH (DATA_COMPRESSION = PAGE);
                                       GO 
                                       EXEC sp_spaceused N'$FullTableNameSql';
                                       GO") | Export-Csv -Path ($Path + $DatabaseName + "infoCompress.csv") -NoTypeInformation -UseCulture
            }
            catch {
                Write-Error "Error compressing table: $($_.Exception.Message)" -ForegroundColor Red
            }
        }
    }
}
