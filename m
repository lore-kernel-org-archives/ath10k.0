Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-he1eur01on0061.outbound.protection.outlook.com
 ([104.47.0.61] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eUGbY-0003Pn-6Z
 for ath10k@lists.infradead.org; Wed, 27 Dec 2017 18:39:07 +0000
Subject: Re: [PATCH] ath10k: Add tx ack signal support for management frames
References: <1514369696-28029-1-git-send-email-vnaralas@qti.qualcomm.com>
From: Peter Oh <peter.oh@bowerswilkins.com>
Message-ID: <636fb1f4-6cc7-df9a-e310-8c577909590e@bowerswilkins.com>
Date: Wed, 27 Dec 2017 10:22:57 -0800
MIME-Version: 1.0
In-Reply-To: <1514369696-28029-1-git-send-email-vnaralas@qti.qualcomm.com>
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
To: vnaralas@qti.qualcomm.com, ath10k@lists.infradead.org



On 12/27/2017 02:14 AM, vnaralas@qti.qualcomm.com wrote:
> From: Venkateswara Naralasetty <vnaralas@qti.qualcomm.com>
>
> This patch add support to get RSSI from acknowledgment
> frames for transmitted management frames.
>
> hardware_used: QCA4019, QCA9984.
> firmware version: 10.4-3.5.3-00052.
>
> Signed-off-by: Venkateswara Naralasetty <vnaralas@qti.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath10k/core.h   |  2 ++
>   drivers/net/wireless/ath/ath10k/htt.h    |  9 ++++++++-
>   drivers/net/wireless/ath/ath10k/htt_rx.c |  9 +++++++++
>   drivers/net/wireless/ath/ath10k/txrx.c   |  4 ++++
>   drivers/net/wireless/ath/ath10k/wmi.h    | 18 ++++++++++++++++++
>   5 files changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
> index 643041e..64c23a5 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -51,6 +51,8 @@
>   /* Antenna noise floor */
>   #define ATH10K_DEFAULT_NOISE_FLOOR -95
>   
> +#define ATH10K_INVALID_RSSI 128
> +
>   #define ATH10K_MAX_NUM_MGMT_PENDING 128
>   
>   /* number of failed packets (20 packets with 16 sw reties each) */
> diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
> index 6305308..2168558d 100644
> --- a/drivers/net/wireless/ath/ath10k/htt.h
> +++ b/drivers/net/wireless/ath/ath10k/htt.h
> @@ -480,12 +480,18 @@ struct htt_ver_resp {
>   	u8 rsvd0;
>   } __packed;
>   
> +#define HTT_MGMT_TX_CMPL_FLAG_ACK_RSSI BIT(0)
> +
> +#define HTT_MGMT_TX_CMPL_INFO_ACK_RSSI	GENMASK(7, 0)
Better to have xxx_MASK as postfix to represent its usage.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
