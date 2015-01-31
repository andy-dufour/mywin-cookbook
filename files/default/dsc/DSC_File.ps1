Configuration 'DSC_File'
{
  [CmdletBinding()]
  param
  (
     $sourcePath,
     $destinationPath = ''
  )
  Node 'localhost' 
  {
    File LogFile
    {
      SourcePath = $sourcePath
      DestinationPath = $destinationPath
      Ensure = "Present"
    }
  }
}

