Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLtaT-0007h7-3m
 for ath10k@lists.infradead.org; Thu, 12 Feb 2015 13:13:45 +0000
Message-ID: <54DCA6F1.90909@candelatech.com>
Date: Thu, 12 Feb 2015 05:13:21 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Increase AST table SKID length limit
References: <1423733322-31113-1-git-send-email-sjegadee@qti.qualcomm.com>
In-Reply-To: <1423733322-31113-1-git-send-email-sjegadee@qti.qualcomm.com>
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
To: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org



On 02/12/2015 01:28 AM, SenthilKumar Jegadeesan wrote:
> The current SKID length configuration causes firmware
> to reject peer creation for not able to allocate
> AST entries for peers. This issue is observed when
> least significant 3 bytes are used ramdomly to create
> client MAC addresses.
>
> AST table SKID length configuration is increased to
> maximum value to fix this issue.

If your firmware is like 10.1, then probably AST length should
really be same as config.num_peers?

10.1 firmware definitely has same or similar issue in it's
AST table handling, for what that is worth.

Thanks,
Ben


>
> Signed-off-by: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath10k/hw.h  | 1 +
>   drivers/net/wireless/ath/ath10k/wmi.c | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
> index 460771f..b86996e 100644
> --- a/drivers/net/wireless/ath/ath10k/hw.h
> +++ b/drivers/net/wireless/ath/ath10k/hw.h
> @@ -254,6 +254,7 @@ struct ath10k_pktlog_hdr {
>
>   /* 10.2 parameters */
>   #define TARGET_10_2_DMA_BURST_SIZE		1
> +#define TARGET_10_2_AST_SKID_LIMIT		128
>
>   /* Target specific defines for WMI-TLV firmware */
>   #define TARGET_TLV_NUM_VDEVS			3
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index aeea1c7..13290da 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -3920,7 +3920,7 @@ static struct sk_buff *ath10k_wmi_10_2_op_gen_init(struct ath10k *ar)
>   	config.num_peers = __cpu_to_le32(TARGET_10X_NUM_PEERS);
>   	config.num_peer_keys = __cpu_to_le32(TARGET_10X_NUM_PEER_KEYS);
>   	config.num_tids = __cpu_to_le32(TARGET_10X_NUM_TIDS);
> -	config.ast_skid_limit = __cpu_to_le32(TARGET_10X_AST_SKID_LIMIT);
> +	config.ast_skid_limit = __cpu_to_le32(TARGET_10_2_AST_SKID_LIMIT);
>   	config.tx_chain_mask = __cpu_to_le32(TARGET_10X_TX_CHAIN_MASK);
>   	config.rx_chain_mask = __cpu_to_le32(TARGET_10X_RX_CHAIN_MASK);
>   	config.rx_timeout_pri_vo = __cpu_to_le32(TARGET_10X_RX_TIMEOUT_LO_PRI);
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
