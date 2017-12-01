Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKlfy-0003ZK-Ez
 for ath10k@lists.infradead.org; Fri, 01 Dec 2017 13:48:29 +0000
MIME-Version: 1.0
Date: Fri, 01 Dec 2017 19:18:00 +0530
From: akolli@codeaurora.org
Subject: Re: [PATCH 2/2] ath10k: add per peer tx stats support for 10.2.4
In-Reply-To: <1512125137.38490.70.camel@sakura.staff.proxad.net>
References: <1512046701-14435-1-git-send-email-akolli@qti.qualcomm.com>
 <1512046701-14435-3-git-send-email-akolli@qti.qualcomm.com>
 <1512125137.38490.70.camel@sakura.staff.proxad.net>
Message-ID: <7792e2fb2c546d8745c65e48945f2535@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: mbizon@freebox.fr
Cc: linux-wireless-owner@vger.kernel.org, akolli@qti.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org


Hello,

Thanks for verifying the patch.

On 2017-12-01 16:15, Maxime Bizon wrote:
> On Thu, 2017-11-30 at 18:28 +0530, akolli@qti.qualcomm.com wrote:
> 
> Hello,
> 
>> Tested on QCA9880 with firmware version 10.2.4.70.48. This should also
>> work with firmware branch 10.2.4-1.0-00029
> 
> I tried using your patch on 4.14 with firmware 10.2.4-1.0-00029
> 
I will test update.

>> Parse peer stats from pktlog packets and update the tx rate 
>> information
>> per STA. This way user space can query about transmit rate with iw:
> 
> everything works ok, ath10k_update_per_peer_tx_stats() is called and
> ath10k_sta fields are updated correctly
> 
> but tx bitrate is still 6 MBit/s in station dump
> 
Hope CONFIG_MAC80211_DEBUGFS is enabled in your build.
Please Run ping traffic and see and 'station dump'

>  # iw dev wlan1 station dump
> Station e4:42:a6:24:c8:95 (on wlan1)
> 	inactive time:	0 ms
> 	rx bytes:	222415
> 	rx packets:	1678
> 	tx bytes:	8511140
> 	tx packets:	5828
> 	tx retries:	0
> 	tx failed:	4
> 	rx drop misc:	2
> 	signal:  	-39 [-54, -56, -39] dBm
> 	signal avg:	-39 [-53, -55, -39] dBm
> 	tx bitrate:	6.0 MBit/s
> 	rx bitrate:	360.0 MBit/s VHT-MCS 8 40MHz short GI VHT-NSS 2
> 	authorized:	yes
> 	authenticated:	yes
> 	associated:	yes
> 	preamble:	long
> 	WMM/WME:	yes
> 	MFP:		no
> 	TDLS peer:	no
> 	DTIM period:	2
> 	beacon interval:96
> 	short slot time:yes
> 	connected time:	1136 seconds
> 
> I see that ath10k does not implement ->dump_station callback, so which
> part of the code updates the generic "struct station_info" fields ?
> 
> Am I missing a patch ?
> 
Rate parameters are updated from below call,
.sta_statistics                 = ath10k_sta_statistics,

Thanks,
Anil.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
