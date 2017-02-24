Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm32-vm8.bullet.mail.ir2.yahoo.com ([212.82.97.104])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ch9h3-0001rC-Ug
 for ath10k@lists.infradead.org; Fri, 24 Feb 2017 06:49:32 +0000
Date: Fri, 24 Feb 2017 06:49:05 +0000 (UTC)
From: Will Kerr <willjkerr@yahoo.co.uk>
Message-ID: <506078490.66937.1487918945400@mail.yahoo.com>
In-Reply-To: <1472714547.6626259.1487882069484@mail.yahoo.com>
References: <1472714547.6626259.1487882069484.ref@mail.yahoo.com>
 <1472714547.6626259.1487882069484@mail.yahoo.com>
Subject: ath10k - spectral scan - and - channel change
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: Will Kerr <willjkerr@yahoo.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

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
