Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyJt7-0004mB-Hw
 for ath10k@lists.infradead.org; Mon, 25 Feb 2019 17:17:59 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fill rx duration for each peer in fw_stats for
 WCN3990
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1550570110-32010-1-git-send-email-svishnoi@codeaurora.org>
References: <1550570110-32010-1-git-send-email-svishnoi@codeaurora.org>
Message-Id: <20190225171756.BD50660A43@smtp.codeaurora.org>
Date: Mon, 25 Feb 2019 17:17:56 +0000 (UTC)
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
To: Surabhi Vishnoi <svishnoi@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Surabhi Vishnoi <svishnoi@codeaurora.org> wrote:

> Currently, rx_duration for each peer is not getting populated in
> fw_stats debugfs entry for WCN3990.
> 
> WCN3990 firmware sends rx duration for each peer as part of
> peer_extd_stats in WMI_UPDATE_STATS_EVENT. To enable peer_extd_stats,
> firmware expects host to send fw_stats_req_mask with flag
> WMI_TLV_PEER_STATS_EXTD set in WMI_REQUEST_STATS_CMD.
> 
> Send fw_stats_req_mask with flag WMI_TLV_PEER_STATS_EXTD set in
> WMI_REQUEST_STATS_CMD and parse the peer_extd_stats in
> WMI_UPDATE_STATS_EVENT to populate the rx_duration of each peer
> in fw_stats debugfs entry.
> 
> Currently the driver handles 32-bit rx_duration, but the rx_duration
> for WCN3990 can be upto 63 bit. The firmware sends rx_duration split
> into two 32-bit fields, with the upper 32-bits being valid only if its
> MSB is set. This change handles the 63-bit rx_duration obtained from
> WCN3990 and maintain the backward compatibility.
> 
> To get the rx_duration of each connected peer :
> cat /sys/kernel/debug/ieee80211/phyX/ath10k/fw_stats
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Kbuild bot reported a warning:

   drivers/net/wireless/ath/ath10k/wmi-tlv.c: In function 'ath10k_wmi_tlv_op_pull_fw_stats':
>> drivers/net/wireless/ath/ath10k/wmi-tlv.c:1423:42: warning: left shift count >= width of type [-Wshift-count-overflow]
        dst->rx_duration |= rx_duration_high <<
                                             ^~
-- 
https://patchwork.kernel.org/patch/10819589/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
