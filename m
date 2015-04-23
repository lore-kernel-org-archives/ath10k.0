Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from edge10.ethz.ch ([82.130.75.186])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlGXz-0002Ba-6F
 for ath10k@lists.infradead.org; Thu, 23 Apr 2015 12:48:04 +0000
From: "Costa Molero  Edgar" <cedgar@student.ethz.ch>
Subject: =?windows-1256?Q?Getting_the_Packet_error_rate_from_debug_files.=FE?=
Date: Thu, 23 Apr 2015 12:47:36 +0000
Message-ID: <BB63CF2605733841BD56CD9C38AC1F7E1E676869@MBX23.d.ethz.ch>
Content-Language: ca-ES
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi all,

I am trying to somehow compute the packet error rate (PER) using all the available information in the /sys/kernel/debug/ieee80211/phyX/ directory.

After using iperf I try to put together information from the following sources:

* iw wlanX station dump
* fw_stats file
* /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/stations/macaddr/

Does anyone know where I can find that parameter ?

Thanks,
Edgar
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
