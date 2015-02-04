Configuration 'DSC_File'
{
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

