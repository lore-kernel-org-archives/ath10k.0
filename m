Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gybIs-0000HP-Rc
 for ath10k@lists.infradead.org; Tue, 26 Feb 2019 11:53:44 +0000
MIME-Version: 1.0
Date: Tue, 26 Feb 2019 17:23:40 +0530
From: Surabhi Vishnoi <svishnoi@codeaurora.org>
Subject: Re: [PATCH] ath10k: Fill rx duration for each peer in fw_stats for
 WCN3990
In-Reply-To: <20190225171756.9632C609F3@smtp.codeaurora.org>
References: <1550570110-32010-1-git-send-email-svishnoi@codeaurora.org>
 <20190225171756.9632C609F3@smtp.codeaurora.org>
Message-ID: <558f033a71573862be59867f22c75294@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org


Hi Kalle,

I have uploaded the v2 patch which fixes the warning.
https://patchwork.kernel.org/patch/10829811/


Thanks,
Surabhi Vishnoi


On 2019-02-25 22:47, Kalle Valo wrote:
> Surabhi Vishnoi <svishnoi@codeaurora.org> wrote:
> 
>> Currently, rx_duration for each peer is not getting populated in
>> fw_stats debugfs entry for WCN3990.
>> 
>> WCN3990 firmware sends rx duration for each peer as part of
>> peer_extd_stats in WMI_UPDATE_STATS_EVENT. To enable peer_extd_stats,
>> firmware expects host to send fw_stats_req_mask with flag
>> WMI_TLV_PEER_STATS_EXTD set in WMI_REQUEST_STATS_CMD.
>> 
>> Send fw_stats_req_mask with flag WMI_TLV_PEER_STATS_EXTD set in
>> WMI_REQUEST_STATS_CMD and parse the peer_extd_stats in
>> WMI_UPDATE_STATS_EVENT to populate the rx_duration of each peer
>> in fw_stats debugfs entry.
>> 
>> Currently the driver handles 32-bit rx_duration, but the rx_duration
>> for WCN3990 can be upto 63 bit. The firmware sends rx_duration split
>> into two 32-bit fields, with the upper 32-bits being valid only if its
>> MSB is set. This change handles the 63-bit rx_duration obtained from
>> WCN3990 and maintain the backward compatibility.
>> 
>> To get the rx_duration of each connected peer :
>> cat /sys/kernel/debug/ieee80211/phyX/ath10k/fw_stats
>> 
>> Tested HW: WCN3990
>> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
>> 
>> Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> 
> Kbuild bot reported a warning:
> 
>    drivers/net/wireless/ath/ath10k/wmi-tlv.c: In function
> 'ath10k_wmi_tlv_op_pull_fw_stats':
>>> drivers/net/wireless/ath/ath10k/wmi-tlv.c:1423:42: warning: left 
>>> shift count >= width of type [-Wshift-count-overflow]
>         dst->rx_duration |= rx_duration_high <<
>                                              ^~

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
