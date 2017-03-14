Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cnpFK-0005kC-W9
 for ath10k@lists.infradead.org; Tue, 14 Mar 2017 16:24:33 +0000
Date: Tue, 14 Mar 2017 21:53:50 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: ath10k - spectral scan - and - channel change
Message-ID: <20170314162119.GA8619@atheros-ThinkPad-T61>
References: <1472714547.6626259.1487882069484.ref@mail.yahoo.com>
 <1472714547.6626259.1487882069484@mail.yahoo.com>
 <506078490.66937.1487918945400@mail.yahoo.com>
 <1252163427.5136459.1488819450737@mail.yahoo.com>
 <1488824121995.94884@qti.qualcomm.com>
 <1734874313.389245.1488883032724@mail.yahoo.com>
 <693914393.8639779.1489485635460@mail.yahoo.com>
 <139544311.8688434.1489485807508@mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <139544311.8688434.1489485807508@mail.yahoo.com>
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
To: Will Kerr <willjkerr@yahoo.co.uk>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Shajakhan Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>

> Thank you for looking into this.. I'm really sorry for the confusion, my second email reversed what the problem really is. Now clarified **below**:
> 
> Is it possible to control spectral_scan_ctl whilst in **Monitor mode**?
> my result:
> 
> root at OpenWrt:~# echo disable > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan_ctl
> ash: write error: No such device

[shafi] hmmm interesting .. looks like you need to bring the interface up,
before doing this, the WMI command may respond error

> 
> or 
> 
> change channel whilst in **AP mode**?
> my result:
> 
> root at OpenWrt:~# iw dev wlan0 set channel 112
> command failed: Device or resource busy (-16)

[shafi] again you need to bring the interface up and also check if this channel
is not disabled 

iw phy0 info

> 
> 
> 
> and to your questions:
> (1)
> following  https://wireless.wiki.kernel.org/en/users/drivers/ath10k/spectral - yes, I am able to obtain the spectral_scan0 data OK whilst in AP mode (although I was not able to do root@OpenWrt:~# iw dev wlan0 scan .. command failed: Device or resource busy (-16), I dont know why, I was still able to get scan data OK)

[shafi] just check 'ap-force' is supported (or) not

> 
> (2)
> I get the same result for the below 3 commands if its set to AP mode, Monitor mode, or off (according to the setup in openWRT). I'm sorry, I dont know if there are more commands I should try to confirm things..


[shafi] i have not tried in monitor i can give a try some time ..
you can fine tune the below script ...
before sending spectral commands

1. make sure the interface is up
2. the channel is properly set
3. the mode is properly set
4. in AP mode 'ap-force' scan option is used ..


set -x

echo 0x2 > /sys/module/ath10k_core/parameters/debug_mask
dmesg -n8

echo "=========================================="
echo "Dumping existing spectral scan data"
sleep 1

cat /sys/kernel/debug/ieee80211/phy1/ath10k/spectral_scan_ctl
cat /sys/kernel/debug/ieee80211/phy1/ath10k/spectral_bins
cat /sys/kernel/debug/ieee80211/phy1/ath10k/spectral_count

sleep 3


spectral_bin=$1
spectral_count=$2
ifconfig wlan1 up
sleep 2
echo $spectral_bin > /sys/kernel/debug/ieee80211/phy1/ath10k/spectral_bins
echo $spectral_count > /sys/kernel/debug/ieee80211/phy1/ath10k/spectral_count
echo manual > /sys/kernel/debug/ieee80211/phy1/ath10k/spectral_scan_ctl
echo trigger > /sys/kernel/debug/ieee80211/phy1/ath10k/spectral_scan_ctl
iw dev wlan1 scan ap-force
sleep 1
cp /sys/kernel/debug/ieee80211/phy1/ath10k/spectral_scan0
/tmp/sample-$spectral_bin.fft
echo disable > /sys/kernel/debug/ieee80211/phy1/ath10k/spectral_scan_ctl

sleep 2
ls -lart /tmp/sample**
set +x



> 
> root@OpenWrt:~# iw phy0 info
> Wiphy phy0
> max # scan SSIDs: 16
> max scan IEs length: 199 bytes
> Retry short limit: 7
> Retry long limit: 4
> Coverage class: 0 (up to 0m)
> Device supports AP-side u-APSD.
> Available Antennas: TX 0x7 RX 0x7
> Configured Antennas: TX 0x7 RX 0x7
> Supported interface modes:
> * managed
> * AP
> * AP/VLAN
> * monitor
> ...
> ...
> ...
> (plus more, that I removed )
> 
> root@OpenWrt:~# dmesg | grep phy0
> root@OpenWrt:~#
> 
> root@OpenWrt:~# ls /sys/kernel/debug/ieee80211/phy0/ath10k/spectral*
> /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_bins
> /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_count
> /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan0
> /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan_ctl
> 
> 
> Thank you, Will
> 
> 
> 
> 
> 
> 
> ----- Forwarded Message -----
> From: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
> To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>; Will Kerr <willjkerr@yahoo.co.uk>
> Sent: Monday, 6 March 2017, 18:15
> Subject: Re: ath10k - spectral scan - and - channel change
> 
> please follow
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/spectral
> 
> please check if phy0 does exists ?
> ________________________________________
> From: ath10k <ath10k-bounces@lists.infradead.org> on behalf of Will Kerr <willjkerr@yahoo.co.uk>
> Sent: 06 March 2017 22:27
> To: ath10k@lists.infradead.org
> Subject: Re: ath10k - spectral scan - and - channel change
> 
> pinging and compacting the Q just in case the experts have an idea on this..
> 
> 
> Is it possible to control spectral_scan_ctl whilst in AP mode?
> my result:
> 
> root@OpenWrt:~# echo disable > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan_ctl
> ash: write error: No such device
> 
> or
> 
> 
> change channel whilst in Monitor mode?
> my result:
> 
> root@OpenWrt:~# iw dev wlan0 set channel 112
> command failed: Device or resource busy (-16)
> 
> Thanks Will.
> 
> 
> 
> 
> 
> ________________________________
> From: Will Kerr <willjkerr@yahoo.co.uk>
> To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
> Sent: Friday, 24 February 2017, 6:49
> Subject: ath10k - spectral scan - and - channel change
> 
> 
> Hello, I searched the mail archives but couldn't find a clue to my question so here it is:
> 
> Im interested in performing a spectral scan of as much of the spectrum as possible, and quickly. this means scanning a channel for some time, changing channels, and repeating.
> 
> 
> Background: when configuring an ath9k radio to Monitor mode, it is possible to do 2 things:
> 
> 1) change wifi channel via command line, e.g. iw dev wlan1 set channel 3. This does it seemingly quickly, without taking down the interface (good)
> 
> 2) control the debugfs files like  /sys/kernel/debug/ieee80211/phy1/ath9k/spectral_scan_ctl (good)
> 
> 
> The problem is:
> 
> ath10k, in Monitor mode, I am only able to change channels - 1) iw dev wlan0 set channel 104, but not access the debugfs files  2) (which is essential to control and obtain the spectral scan result)
> the error I get is:
> 
> root@OpenWrt:~# echo disable > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan_ctl
> ash: write error: No such device
> 
> 
> 
> ath10k, in AP mode, The opposite occurs - I am only able to access debugfs files  2) , but not change channel 1), which is annoying because I cant then scan the entire possible range.
> 
> 
> the error I get is one of:
> 
> root@OpenWrt:~# iw dev wlan0 set channel 112
> 
> command failed: Device or resource busy (-16)
> or
> root@OpenWrt:~# iw dev wlan0 set channel 104
> command failed: Invalid argument (-22)
> 
> 
> 
> Is there anything I can do to get both working?
> 
> Thanks. Will
> 
> _______________________________________________
> ath10k mailing list
> 
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
