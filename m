Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0TjF-00029D-Q9
 for ath10k@lists.infradead.org; Mon, 26 Mar 2018 15:08:12 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Add sta rx packet stats per tid
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1517400072-9204-1-git-send-email-vthiagar@codeaurora.org>
References: <1517400072-9204-1-git-send-email-vthiagar@codeaurora.org>
Message-Id: <20180326150759.8309A603AF@smtp.codeaurora.org>
Date: Mon, 26 Mar 2018 15:07:59 +0000 (UTC)
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
To: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@codeaurora.org> wrote:

> Added per tid sta counters for the following
> 
> - Total number MSDUs received from firmware
> - Number of MSDUs received with errors like decryption, crc, mic ,etc.
> - Number of MSDUs dropped in the driver
> - A-MPDU/A-MSDU subframe stats
> - Number of MSDUS passed to mac80211
> 
> All stats other than A-MPDU stats are only for received data frames.
> A-MPDU stats might have stats for management frames when monitor
> interface is active where management frames are notified both in wmi
> and HTT interfaces.
> 
> These per tid stats can be enabled with tid bitmask through a debugfs
> like below
> 
>  echo <tid_bitmask> > /sys/kernel/debug/ieee80211/phyX/ath10k/sta_tid_stats_mask
> 
>  tid 16 (tid_bitmask 0x10000) is used for non-qos data/management frames
> 
> The stats are read from
> /sys/kernel/debug/ieee80211/phyX/netdev\:wlanX/stations/<sta_mac>/dump_tid_stats
> 
> Sample output:
> 
>  To enable rx stats for tid 0, 5 and 6,
> 
>  echo 0x00000061 > /sys/kernel/debug/ieee80211/phy0/ath10k/sta_tid_stats_mask
> 
> cat /sys/kernel/debug/ieee80211/phy0/netdev\:wlan15/stations/8c\:fd\:f0\:0a\:8e\:df/dump_tid_stats
> 
>   		Driver Rx pkt stats per tid, ([tid] count)
>                 ------------------------------------------
> MSDUs from FW                   [00] 2567        [05] 3178        [06] 1089
> MSDUs unchained                 [00] 0           [05] 0           [06] 0
> MSDUs locally dropped:chained   [00] 0           [05] 0           [06] 0
> MSDUs locally dropped:filtered  [00] 0           [05] 0           [06] 0
> MSDUs queued for mac80211       [00] 2567        [05] 3178        [06] 1089
> MSDUs with error:fcs_err        [00] 0           [05] 0           [06] 2
> MSDUs with error:tkip_err       [00] 0           [05] 0           [06] 0
> MSDUs with error:crypt_err      [00] 0           [05] 0           [06] 0
> MSDUs with error:peer_idx_inval [00] 0           [05] 0           [06] 0
> 
> A-MPDU num subframes upto 10    [00] 2567        [05] 3178        [06] 1087
> A-MPDU num subframes 11-20      [00] 0           [05] 0           [06] 0
> A-MPDU num subframes 21-30      [00] 0           [05] 0           [06] 0
> A-MPDU num subframes 31-40      [00] 0           [05] 0           [06] 0
> A-MPDU num subframes 41-50      [00] 0           [05] 0           [06] 0
> A-MPDU num subframes 51-60      [00] 0           [05] 0           [06] 0
> A-MPDU num subframes >60        [00] 0           [05] 0           [06] 0
> 
> A-MSDU num subframes 1          [00] 2567        [05] 3178        [06] 1089
> A-MSDU num subframes 2          [00] 0           [05] 0           [06] 0
> A-MSDU num subframes 3          [00] 0           [05] 0           [06] 0
> A-MSDU num subframes 4          [00] 0           [05] 0           [06] 0
> A-MSDU num subframes >4         [00] 0           [05] 0           [06] 0
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

caee728ab761 ath10k: add sta rx packet stats per tid

-- 
https://patchwork.kernel.org/patch/10193935/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
