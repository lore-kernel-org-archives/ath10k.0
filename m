Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAzMQ-0008PA-1M
 for ath10k@lists.infradead.org; Fri, 12 Oct 2018 15:28:26 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Add wrapper function to ath10k debug
References: <1537766878-11238-1-git-send-email-vnaralas@codeaurora.org>
Date: Fri, 12 Oct 2018 18:27:56 +0300
In-Reply-To: <1537766878-11238-1-git-send-email-vnaralas@codeaurora.org>
 (Venkateswara Naralasetty's message of "Mon, 24 Sep 2018 10:57:58
 +0530")
Message-ID: <87va672nib.fsf@kamboji.qca.qualcomm.com>
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
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Cc: Kan Yan <kyan@chromium.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Venkateswara Naralasetty <vnaralas@codeaurora.org> writes:

> ath10k_dbg() is called in ath10k_process_rx() with huge set of arguments
> which is causing CPU overhead even when debug_mask is not set.
> Good improvement was observed in the receive side performance when call
> to ath10k_dbg() is avoided in the RX path.
>
> Since currently all debug messages are sent via tracing infrastructure,
> we cannot entirely avoid calling ath10k_dbg. Therefore, call to
> ath10k_dbg() is made conditional based on tracing config in the driver.
>
> Trasmit performance remains unchanged with this patch; below are some
> experimental results with this patch and tracing disabled.
>
> mesh mode:
>
>                       w/o this patch          with this patch
>         Traffic       TP      CPU Usage      TP      CPU usage
>
>         TCP          840Mbps    76.53%      960Mbps    78.14%
>         UDP          1030Mbps   74.58%      1132Mbps   74.31%
>
> Infra mode:
>
>                       w/o this patch          with this patch
>         Traffic        TP      CPU Usage      TP      CPU usage
>
>         TCP Rx       1241Mbps   80.89%      1270Mbps   73.50%
>         UDP Rx       1433Mbps   81.77%      1472Mbps   72.80%
>
> Tested platform	: IPQ8064
> hardware used	: QCA9984
> firmware ver	: ver 10.4-3.5.3-00057
>
> Signed-off-by: Kan Yan <kyan@chromium.org>
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>

The first Signed-off-by should be the author's, in this case
Venkateswara. If Kan helped to develop the patch you should also add
Co-developed-by:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

> +/* Avoid calling __ath10k_dbg() if debug_mask is not set and tracing
> + * disabled.
> + */
> +#define ath10k_dbg(ar, dbg_mask, fmt, ...)				\
> +do {									\
> +	if (IS_ENABLED(CONFIG_ATH10K_TRACING) ||			\
> +	    (ath10k_debug_mask & dbg_mask))				\
> +		__ath10k_dbg(ar, dbg_mask, fmt, ##__VA_ARGS__);		\
> +} while (0)
>  #endif /* _DEBUG_H_ */

Johannes had an interesting idea to use trace_ath10k_log_dbg_enabled().
Could you investigate if that would work? That way we might get the
performance improvement even when is enabled CONFIG_ATH10K_TRACING (but
actual trace point is disabled, of course).

Documentation/trace/tracepoints.rst has more info about the
trace_*_enabled() function. It does have a special requirement but I'm
not sure if it matters here as we don't care if we loose a message or
two in the beginning:

    "The trace_<tracepoint>() should always be within the block of the
     if (trace_<tracepoint>_enabled()) to prevent races between the
     tracepoint being enabled and the check being seen."

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
