# Define input and output file paths
$inputFilePath = "C:\path\to\input.xlsx"
$outputFilePath = "C:\path\to\output.csv"

# Load the Excel COM object
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false

# Open the input file and select the first worksheet
$workbook = $excel.Workbooks.Open($inputFilePath)
$worksheet = $workbook.Worksheets.Item(1)

# Define the range of cells to be exported
$startRow = 1
$endRow = $worksheet.UsedRange.Rows.Count
$startColumn = 1
$endColumn = $worksheet.UsedRange.Columns.Count
$range = $worksheet.Range($worksheet.Cells.Item($startRow, $startColumn), $worksheet.Cells.Item($endRow, $endColumn))

# Export the range to a CSV file
$range | Export-Csv -Path $outputFilePath -NoTypeInformation

# Close the workbook and exit Excel
$workbook.Close($false)
$excel.Quit()
