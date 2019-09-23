Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCJS7-00054J-RG
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 08:12:13 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 2/2] ath10k: Add support for per peer HTT tx stats for
 WCN3990
References: <1551251628-22518-1-git-send-email-svishnoi@codeaurora.org>
 <1551251628-22518-3-git-send-email-svishnoi@codeaurora.org>
Date: Mon, 23 Sep 2019 11:12:07 +0300
In-Reply-To: <1551251628-22518-3-git-send-email-svishnoi@codeaurora.org>
 (Surabhi Vishnoi's message of "Wed, 27 Feb 2019 12:43:48 +0530")
Message-ID: <87a7ava0tk.fsf@codeaurora.org>
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
To: Surabhi Vishnoi <svishnoi@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Surabhi Vishnoi <svishnoi@codeaurora.org> writes:

> The firmware sends peer stats to the host driver if the firmware
> advertises WMI_SERVICE_PEER_STATS service and the host driver
> indicates the WMI_RSRC_CFG_FLAG_TX_PEER_STATS capability in the
> host capab flag in wmi init cmd.
>
> When peer stats are enabled, firmware sends one HTT event
> HTT_TLV_T2H_MSG_TYPE_PEER_STATS for every four PPDUs transmitted.
> HTT msg payload has tag followed by length followed by
> success pkts/bytes, failed pkts/bytes, retry pkts/bytes and rate
> info per ppdu.
>
> Parse peer stats sent by the firmware in tlv format and update the
> tx rate information and tx_stats debugfs entry per STA.
>
> To get the tx_stats:
> echo 1 > /sys/kernel/debug/ieee80211/phyX/ath10k/enable_extd_tx_stats
> cat /sys/kernel/debug/ieee80211/phyX/net:wlanX/stations/xx:xx:xx:xx:xx:xx/tx_stats
>
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
>
> Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>

[...]

> @@ -3438,7 +3566,7 @@ bool ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
>  		ath10k_htt_rx_tx_mode_switch_ind(ar, skb);
>  		break;
>  	case HTT_T2H_MSG_TYPE_PEER_STATS:
> -		ath10k_htt_fetch_peer_stats(ar, skb);
> +		htt->rx_ops->htt_fetch_peer_stats(ar, skb);
>  		break;

I think this belongs to patch 1.

> +#define ATH10K_HW_GI_MASK				GENMASK(5, 5)

BIT(5)

> +#define ATH10K_HW_SKIPPED_RATE_CTRL_MASK		GENMASK(6, 6)

BIT(6)

> +#define ATH10K_HW_WCN3990_GI_MASK			GENMASK(6, 6)

BIT(6)

> +#define ATH10K_HW_WCN3990_SKIPPED_RATE_CTRL_MASK	GENMASK(7, 7)

BIT(7)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
