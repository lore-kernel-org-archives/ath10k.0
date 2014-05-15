Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WktmT-0005km-Ky
 for ath10k@lists.infradead.org; Thu, 15 May 2014 11:24:58 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC 1/2] ath10k: add implementation for configure max amsdu,
 ampdu
References: <1400151186-24949-1-git-send-email-janusz.dziedzic@tieto.com>
Date: Thu, 15 May 2014 14:24:30 +0300
In-Reply-To: <1400151186-24949-1-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Thu, 15 May 2014 12:53:05 +0200")
Message-ID: <87egzv9te9.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: while1eq1@gmail.com, markaswift@gmail.com, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> Allow to setup maximum subframes for AMSDU and AMPDU aggregation.
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
> ---
> Please check this patches, if help when MacBook Pro Retina used.

Did you somehow check that this command works as it should?

> --- a/drivers/net/wireless/ath/ath10k/htt.h
> +++ b/drivers/net/wireless/ath/ath10k/htt.h
> @@ -240,16 +240,14 @@ struct htt_oob_sync_req {
>  	__le16 rsvd0;
>  } __packed;
>  
> -#define HTT_AGGR_CONF_MAX_NUM_AMSDU_SUBFRAMES_MASK 0x1F
> -#define HTT_AGGR_CONF_MAX_NUM_AMSDU_SUBFRAMES_LSB  0
> +#define HTT_AGGR_CONF_MAX_NUM_AMSDU_SUBFRAMES_MASK 0x1F00
> +#define HTT_AGGR_CONF_MAX_NUM_AMSDU_SUBFRAMES_LSB  8
> +#define HTT_AGGR_CONF_MAX_NUM_AMPDU_SUBFRAMES_MASK 0xFF
> +#define HTT_AGGR_CONF_MAX_NUM_AMPDU_SUBFRAMES_LSB  0

The masks here (0x1f and 0xff) look strange to me. Are they really
correct?

Ah, but we are not using them anywhere? Can you still double check that
the firmware interface is really like this, just for my sake?

> +int ath10k_htt_h2t_aggr_cfg_msg(struct ath10k_htt *htt,
> +				u8 max_subfrms_ampdu,
> +				u8 max_subfrms_amsdu)
> +{
> +	struct htt_aggr_conf *aggr_conf;
> +	struct sk_buff *skb;
> +	struct htt_cmd *cmd;
> +	int len = 0;
> +	int ret;

I prefer not to initialise variables here if possible, so this would be
better:

        int ret, len;

> +	/* By default FW setup amsdu = 3 and ampdu = 64 */
> +	if (max_subfrms_ampdu == 0 || max_subfrms_ampdu > 64)
> +		return -EINVAL;

Empty line here.

> +	if (max_subfrms_amsdu == 0 || max_subfrms_amsdu > 31)
> +		return -EINVAL;
> +
> +	len += sizeof(cmd->hdr);

len = sizeof(cmd->hdr);

(Because not initialising len)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
