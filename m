Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-eopbgr20060.outbound.protection.outlook.com ([40.107.2.60]
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKpng-00025G-A3
 for ath10k@lists.infradead.org; Tue, 13 Jun 2017 17:40:22 +0000
Subject: Re: [RFC v2 06/10] ath10k: htt: High latency RX support
References: <1497279791-9598-1-git-send-email-erik.stromdahl@gmail.com>
 <1497279791-9598-7-git-send-email-erik.stromdahl@gmail.com>
From: Peter Oh <peter.oh@bowerswilkins.com>
Message-ID: <97b65176-7def-54b1-c204-e41bcbe1935f@bowerswilkins.com>
Date: Tue, 13 Jun 2017 10:39:46 -0700
MIME-Version: 1.0
In-Reply-To: <1497279791-9598-7-git-send-email-erik.stromdahl@gmail.com>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>, kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org


On 06/12/2017 08:03 AM, Erik Stromdahl wrote:
> Special HTT RX handling for high latency interfaces.
>
> Since no DMA physical addresses are used in the RX ring
> config message (this is not supported by the high latency
> devices), no RX ring is allocated.
> All RX skb's are allocated by the driver and passed directly
> to mac80211 in the HTT RX indication handler.
>
> A nice side effect of this is that no huge buffer will be
> allocated with dma_alloc_coherent. On embedded systems with
> limited memory resources, the allocation of the RX ring is
> prone to fail.
>
> Some tweaks made to "make it work":
>
> Removal of protected bit in 802.11 header frame control field.
> The chipset seems to do hw decryption but the frame_control
> protected bit is still set.
>
> This is necessary for mac80211 not to drop the frame.
>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> ---
>
> +static void ath10k_htt_rx_proc_rx_ind_ll(struct ath10k_htt *htt,
> +					 struct htt_rx_indication *rx)
>   {
>   	struct ath10k *ar = htt->ar;
>   	struct htt_rx_indication_mpdu_range *mpdu_ranges;
> @@ -2356,7 +2442,12 @@ bool ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
>   		break;
>   	}
>   	case HTT_T2H_MSG_TYPE_RX_IND:
> -		ath10k_htt_rx_proc_rx_ind(htt, &resp->rx_ind);
> +		if (ar->is_high_latency)
Can we use function pointers at initial time to avoid condition check at 
hot path?
I'm afraid adding more lines on hot path.
> +			return ath10k_htt_rx_proc_rx_ind_hl(htt,
> +							    &resp->rx_ind_hl,
> +							    skb);
> +		else
> +			ath10k_htt_rx_proc_rx_ind_ll(htt, &resp->rx_ind);
>   		break;
>   	case HTT_T2H_MSG_TYPE_PEER_MAP: {
>   		struct htt_peer_map_event ev = {
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
