$startDate = Get-Date "2022-07-21"
$endDate = Get-Date "2022-07-31"

# Define the RSS feed URLs
# $rssFeeds = @(
#     "https://example.com/feed1.xml",
#     "https://example.com/feed2.xml",
#     "https://example.com/feed3.xml"
# )
# Define the content filter keywords
$Filter = @(
    "has",
    "of"
)


$Filter = @(
    "*.la.gov*",
    "*@la.gov*",
    "*la.net*",
    "*louisiana.gov*",
    "*vulnerablity*",
    "*encryption*",
    "*cyber*",
    "*hack*",
    "*attack*",
    "*exploit*",
    "*lsu.edu*",
    "*InfoSec*",
    "*0 day*",
    "*0day*",
    "*vulnerability*",
    "*vuln*",
    "*vulns*",    
    "*fraud*",

    "*bypass*",
    "*privacy*",
    "*LA Wallet*",
    "*data breach*",
    "*data leak*"
)

foreach ($feed in $feeds) {
    # Load the RSS feed into a variable
    $feed = Invoke-RestMethod -Uri $feed
    # Filter the RSS feed items based on date and content
    $filteredItems = $feed.channel.item | Where-Object {
        $_.pubDate -ge $startDate -and $_.pubDate -le $endDate -and ($_.title -match ($Filter2 -join '|') -or $_.description -contains ($Filter2 -join '|'))
    }
    # Output the filtered items
    Write-Host $feed.channel.item.title -ForegroundColor Green
    write-host $feed.channel.item.description -ForegroundColor Gray
    $filteredItems | Select-Object title, pubDate, link | Format-Table -AutoSize
    Write-Host ""
}


foreach ($feed in $feeds) {
    foreach ($item in Invoke-RestMethod -Uri $feed) {

        $data = Select-Xml -Xml $item -XPath "//data"

        $data | ForEach-Object {
            if ($_.Node.'#text' -ne $null) {
                [PSCustomObject]@{
                    'Id' = $data.id
                    'GUID' = $data.guid
                    'Publication date' = $data.pubDate
                    'Title' = $data.title
                    'Link' = $data.link
                    'Description' = $data.description
                    'Enclosure' = $data.enclosure
                    'Source' = $data.source
                    'Category' = $data.category
                    'Author' = $data.author
                    'Comments' = $data.comments
                }
            }
            else {
                <# Action to perform if the condition is false #>
            }
        }
    }
}
