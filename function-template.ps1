function get-function-template {
    #> 
    .SYNOPSIS
        Short description of function.
    
    .DESCRIPTION
        Detailed description of function.
    
    .PARAMETER Parameter1
        Description of Parameter1.
    
    .PARAMETER Parameter2
        Description of Parameter2.
    
    .EXAMPLE 
        Example of how to use the function.
    
    .INPUTS
        Any input objects used by the function.
    
    .OUTPUTS
        Any output objects returned by the function.
    
    .NOTES
        Additional notes about the function.
    
    #>
    [
        CmdletBinding(
            SupportsShouldProcess=$True,
            ConfirmImpact="Low"
        )
    ]
    Param(
        [Parameter(Mandatory=$True,
        ValueFromPipeline=$True,
        ValueFromPipelineByPropertyName=$True)]
        [Object]$User
    )
    Begin {
        Write-Verbose "Starting New-ExampleFunction"
    }
    Process {
        Write-Verbose "Processing First Parameter: $Parameter1"
        Write-Verbose "Performing operation"
        try {
            $result = $Parameter1 / $Parameter2
            return $result
        }
            catch [System.DivideByZeroException] {
                Write-Error "Cannot divide by zero."
            }
        #Verbose
        Write-Verbose "Processing Second Parameter: $Parameter2"
        catch [System.OverflowException] {
            Write-Error "The result is too large to be represented as an integer."
        }
        catch {
            Write-Error "An unexpected error occurred: $($_.Exception.Message)"
        }
    }
    End {
        Write-Verbose "New-ExampleFunction completed successfully"
        return $result
    }
}
