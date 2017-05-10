Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8UjG-00067p-Gh
 for ath10k@lists.infradead.org; Wed, 10 May 2017 16:44:48 +0000
Received: by mail-wr0-x244.google.com with SMTP id w50so169082wrc.0
 for <ath10k@lists.infradead.org>; Wed, 10 May 2017 09:44:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170510162546.15439-1-adrian@freebsd.org>
References: <20170510162546.15439-1-adrian@freebsd.org>
From: Steve deRosier <derosier@gmail.com>
Date: Wed, 10 May 2017 09:44:23 -0700
Message-ID: <CALLGbRL8NQi03U60AwEtOq-W0mFOn1uDmc_TXWRJofPqcP6VXg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: add configurable debugging.
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Hi Adrian,

On Wed, May 10, 2017 at 9:25 AM, Adrian Chadd <adrian@freebsd.org> wrote:

> diff --git a/drivers/net/wireless/ath/ath10k/debug.h b/drivers/net/wireless/ath/ath10k/debug.h
> index 257d10985c6e..7bd461927029 100644
> --- a/drivers/net/wireless/ath/ath10k/debug.h
> +++ b/drivers/net/wireless/ath/ath10k/debug.h
> @@ -200,27 +200,43 @@ void ath10k_sta_update_rx_duration(struct ath10k *ar,
>  #endif /* CONFIG_MAC80211_DEBUGFS */
>
>  #ifdef CONFIG_ATH10K_DEBUG
> -__printf(3, 4) void ath10k_dbg(struct ath10k *ar,
> +static inline int
> +_ath10k_do_dbg(struct ath10k *ar, enum ath10k_debug_mask mask)
> +{
> +       if (ar->trace_debug_mask & mask)
> +               return (1);
> +       if (ar->debug_mask & mask)
> +               return (1);
> +       return (0);
> +}
> +
> +void _ath10k_dbg(struct ath10k *ar,
>                                enum ath10k_debug_mask mask,
>                                const char *fmt, ...);
> -void ath10k_dbg_dump(struct ath10k *ar,
> +
> +void _ath10k_dbg_dump(struct ath10k *ar,
>                      enum ath10k_debug_mask mask,
>                      const char *msg, const char *prefix,
>                      const void *buf, size_t len);
> +
> +#define        ath10k_dbg(ar, mask, ...)                                       \
> +       do {                                                            \
> +               if (_ath10k_do_dbg(ar, mask)) {                         \
> +                       _ath10k_dbg((ar), (mask), __VA_ARGS__);         \
> +               };                                                      \
> +       } while (0)
> +

Looks to me you dropped the "__printf(3, 4)" safety check. Was that intentional?

Thanks,
- Steve

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
