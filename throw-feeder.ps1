$feeds = @(
    'https://www.cisa.gov/cybersecurity-advisories/all.xml',
    'https://www.ic3.gov/rssIndustry.xml',
    'https://www.ic3.gov/rss/news.xml',
    'https://www.ic3.gov/rss/news.xml',
    'https://us-cert.cisa.gov/ncas/alerts.xml',
    'https://www.us-cert.gov/ncas/alerts.xml',
    'https://www.us-cert.gov/ncas/current-activity.xml',
    'https://www.cisecurity.org/feed/alert',
    'https://www.cisecurity.org/feed/advisories',
    'https://nvd.nist.gov/feeds/xml/cve/misc/nvd-rss.xml',
    'https://nvd.nist.gov/feeds/xml/cve/misc/nvd-rss-analyzed.xml',
    'https://www.govinfo.gov/rss/billsum-bulkdata.xml',
    'https://www.govinfo.gov/rss/cfr.xml',
    'https://www.govinfo.gov/rss/bills.xml',
    'https://www.govinfo.gov/rss/econi.xml',
    'https://www.govinfo.gov/rss/fr.xml',
    'https://www.govinfo.gov/rss/plaw.xml',
    'https://www.govinfo.gov/rss/uscode.xml',
    'https://www.cyberscoop.com/feed/',
    'https://rss.cnn.com/rss/cnn_topstories.rss',
    'https://www.huffpost.com/section/front-page/feed?x=1',
    'https://www.crowdstrike.com/blog/feed',
    'https://www.volexity.com/blog/feed/',
    'https://technet.microsoft.com/en-us/security/rss/advisory',
    'https://portswigger.net/blog/rss',
    'https://www.home-assistant.io/atom.xml',
    'https://forum.proxmox.com/forums/announcements.7/index.rss',
    'https://www.google.com/alerts/feeds/05252290034695110361/2567612534284750863',
    'https://aws.amazon.com/blogs/security/feed/',
    'https://api.msrc.microsoft.com/update-guide/rss',
    'https://developer.apple.com/news/rss/news.rss',
    'https://msrc.microsoft.com/blog/rss/',
    'https://www.exploit-db.com/rss.xml',
    'https://cyber.gc.ca/webservice/en/rss/alerts',
    'https://krebsonsecurity.com/feed/',
    'https://threatpost.com/feed/',
    'https://nakedsecurity.sophos.com/feed/',
    'https://www.darkreading.com/rss.xml',
    'https://www.bleepingcomputer.com/feed/',
    'https://rss.packetstormsecurity.com/',
    'https://feeds.feedburner.com/TheHackersNews',
    'https://www.reddit.com/r/netsec/.rss',
    'https://securityintelligence.com/feed/',
    'https://www.cshub.com/rss/news',
    'https://www.cshub.com/rss/articles',
    'https://www.cshub.com/rss/whitepapers',
    'https://www.cshub.com/rss/categories/cloud',
    'https://www.cshub.com/rss/categories/threat-defense',
    'https://www.cshub.com/rss/categories/security-strategy',
    'https://www.cshub.com/rss/categories/attacks',
    'https://www.cshub.com/rss/categories/malware',
    'https://www.cshub.com/rss/categories/network',
    'https://www.schneier.com/blog/atom.xml',
    'https://tools.cisco.com/security/center/psirtrss20/CiscoSecurityAdvisory.xml',
    'https://isc.sans.edu/rssfeed.xml',
    'https://digital.nhs.uk/feed/cyber-alerts-feed.xml',
    'https://malware-traffic-analysis.net/blog-entries.rss',
    'https://cxsecurity.com/wlb/rss/exploit/',
    'https://thecyberwire.libsyn.com/rss',
    'https://www.cybersecurity-insiders.com/feed/',
    'https://www.zerodayinitiative.com/rss/published/',
    'https://feeds.feedburner.com/Securityweek',
    'https://thehackernews.com/feeds/posts/default',
    'https://blog.malwarebytes.org/feed/',
    'https://www.kali.org/feed/',
    'https://www.youtube.com/feeds/videos.xml?channel_id=UC3s0BtrBJpwNDaflRSoiieQ',
    'https://feeds.arstechnica.com/arstechnica/index/',
    'https://news.ycombinator.com/rss',
    'https://www.wired.com/feed/rss',
    'https://hackernoon.com/feed',
    'https://www.theverge.com/rss/index.xml',
    'https://feeds.feedburner.com/darknethackers',
    'https://www.engadget.com/rss.xml',
    'https://www.offensive-security.com/feed'
)

foreach ($feed in $feeds) {
    foreach ($item in Invoke-RestMethod -Uri $feed ) {
                     $dataElements = Select-Xml -Xml $item -XPath "//data"
                        $dataElements | ForEach-Object {
                            [PSCustomObject]@{
                                'Publication Date' = $_.Node.'#text'
                                Title              = $_.Node.Title
                                Link               = $_.Node.Link
                            }
                        }
        [PSCustomObject]@{
            'Publication date' = $item.pubDate
            Title              = $item.Title
            Link               = $item.Link
        }
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
