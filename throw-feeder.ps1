
foreach ($feed in $feeds) {
    foreach ($item in Invoke-RestMethod -Uri $feed ) {
            $dataElements = Select-Xml -Xml $item -XPath "//data"
            $dataElements | ForEach-Object {
                if ($_.Node.'#text' -eq $null ) {
                    <# Action to perform if the condition is true #>
                }
                    else {
                        <# Action to perform if the condition is false #>
                    }

            }
            [PSCustomObject]@{
                'Publication date' = $item.pubDate
                'updated' = $item.updated
                'id' = $item.id
                'guid' = $item.guid
                'name' = $item.name
                'Title' = $item.Title
                'Link' = $item.Link
                'author' = $item.author
                'category' = $item.category
                "content" = $item.content
                'description' = $item.description
                'enclosure' = $item.enclosure
                'source' = $item.source
                'summary' = $item.summary
                'rights' = $item.rights
                date
            }
    }
}
https://www.darkreading.com/rss.xml


$url = 'http://www.independent.co.uk/news/uk/rss'
Invoke-RestMethod -Uri $url -OutFile c:\scripts\worldnews.xml
[xml]$Content = Get-Content C:\scripts\worldnews.xml
$Feed = $Content.rss.channel

# User Input field
$UserTerm = Read-Host 'Enter a Term'
ForEach ($msg in $Feed.Item | ?{$_.Title.Contains($userTerm)}) {
    [PSCustomObject]@{
        'Source' = "News"
        'Title' = $msg.title
        'Link' = $msg.link
        'Description' = $msg.description
    }

}

    # $total | Sort-Object { $_."Publication Date" -as [datetime] }
    # Select-Object -Last $numberofitems
    # $feed = 'https://www.govinfo.gov/rss/cfr.xml' 
    # $rss = Invoke-RestMethod -Uri $feed
    # $items = $rss.rss.channel.item 
    # foreach ($item in $items) {
    #     $newItem = New-Object PSObject{
    #         $title = $item.title
    #         $link = $item.link
    #         $pubDate = $item.pubDate
    #         $description = $item.description
    #         $enclosure = $item.enclosure
    #         $source = $rss.rss.channel.title
    #         $id = $item."post-id".InnerText
    #         $category = $item.category
    #         $author = $item.author
    #         $comments = $item.comments
    #         $guid = $item.guid

    #     }

    #     $newItem

    # }
    # foreach ($item in $rss.rss.channel.item) {
    #     write-host "Processing " $item.title
    #     [PSCustomObject]@{
    #         'Source' = $rss.rss.channel.title
    #         'Title' = $item.title
    #         'Link' = $item.link
    #         'Description' = $item.description
    #     }
    #     if ($item.enclosure) {
    #         write-host "Successfully retrieved $item.enclosure"
    #     } else {
    #         write-host "whoops! $feed looks like something went wrong."
    #     }
    # }
# }
