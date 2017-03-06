Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ckxAl-0005V6-6Y
 for ath10k@lists.infradead.org; Mon, 06 Mar 2017 18:15:53 +0000
From: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Subject: Re: ath10k - spectral scan - and - channel change
Date: Mon, 6 Mar 2017 18:15:22 +0000
Message-ID: <1488824121995.94884@qti.qualcomm.com>
References: <1472714547.6626259.1487882069484.ref@mail.yahoo.com>
 <1472714547.6626259.1487882069484@mail.yahoo.com>
 <506078490.66937.1487918945400@mail.yahoo.com>,
 <1252163427.5136459.1488819450737@mail.yahoo.com>
In-Reply-To: <1252163427.5136459.1488819450737@mail.yahoo.com>
Content-Language: en-IN
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Will Kerr <willjkerr@yahoo.co.uk>

please follow
https://wireless.wiki.kernel.org/en/users/drivers/ath10k/spectral

please check if phy0 does exists ?
________________________________________
From: ath10k <ath10k-bounces@lists.infradead.org> on behalf of Will Kerr <willjkerr@yahoo.co.uk>
Sent: 06 March 2017 22:27
To: ath10k@lists.infradead.org
Subject: Re: ath10k - spectral scan - and - channel change

pinging and compacting the Q just in case the experts have an idea on this..


Is it possible to control spectral_scan_ctl whilst in AP mode?
my result:

root@OpenWrt:~# echo disable > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan_ctl
ash: write error: No such device

or


change channel whilst in Monitor mode?
my result:

root@OpenWrt:~# iw dev wlan0 set channel 112
command failed: Device or resource busy (-16)

Thanks Will.





________________________________
From: Will Kerr <willjkerr@yahoo.co.uk>
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Sent: Friday, 24 February 2017, 6:49
Subject: ath10k - spectral scan - and - channel change


Hello, I searched the mail archives but couldn't find a clue to my question so here it is:

Im interested in performing a spectral scan of as much of the spectrum as possible, and quickly. this means scanning a channel for some time, changing channels, and repeating.


Background: when configuring an ath9k radio to Monitor mode, it is possible to do 2 things:

1) change wifi channel via command line, e.g. iw dev wlan1 set channel 3. This does it seemingly quickly, without taking down the interface (good)

2) control the debugfs files like  /sys/kernel/debug/ieee80211/phy1/ath9k/spectral_scan_ctl (good)


The problem is:

ath10k, in Monitor mode, I am only able to change channels - 1) iw dev wlan0 set channel 104, but not access the debugfs files  2) (which is essential to control and obtain the spectral scan result)
the error I get is:

root@OpenWrt:~# echo disable > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan_ctl
ash: write error: No such device



ath10k, in AP mode, The opposite occurs - I am only able to access debugfs files  2) , but not change channel 1), which is annoying because I cant then scan the entire possible range.


the error I get is one of:

root@OpenWrt:~# iw dev wlan0 set channel 112

command failed: Device or resource busy (-16)
or
root@OpenWrt:~# iw dev wlan0 set channel 104
command failed: Invalid argument (-22)



Is there anything I can do to get both working?

Thanks. Will

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
