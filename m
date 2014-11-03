Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XlR9z-0002kl-AU
 for ath10k@lists.infradead.org; Mon, 03 Nov 2014 23:35:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: handle ieee80211 header and payload tracing
 separately
References: <1414661336-20764-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Tue, 4 Nov 2014 01:34:37 +0200
In-Reply-To: <1414661336-20764-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Thu, 30 Oct 2014 14:58:56 +0530")
Message-ID: <874muf7t9u.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> For packet log, the transmitted frame 802.11 header alone is sufficient.
> Recording entire packet is also consuming lot of disk space. To optimize
> this, tx and rx data tracepoints are splitted into header and payload
> tracepoints.
>
> To record tx ieee80211 headers
>
>      trace-cmd record -e ath10k_tx_hdr
>
> To record complete packets
>
>      trace-cmd record -e ath10k_tx_hdr -e ath10k_tx_payload
>
> Cc: Michal Kazior <michal.kazior@tieto.com>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/trace.h
> +++ b/drivers/net/wireless/ath/ath10k/trace.h
> @@ -341,7 +341,10 @@ TRACE_EVENT(ath10k_txrx_tx_unref,
>  	 )
>  );
>  
> -DECLARE_EVENT_CLASS(ath10k_data_event,
> +#define ATH10K_FRM_HDR_LEN  \
> +	ieee80211_hdrlen(((struct ieee80211_hdr *)data)->frame_control)

This macro does not look good. I would recommend to follow what Johannes
suggested:

"It would be worth hiding that inside the tracepoint's assign function,
so instead of passing data/len here you'd pass the full skb, or the full
skb data/skb len, like this:

ar, skb->data, skb->len

to both tracers. Then inside the tracer you can do the hdrlen check, and
that way move the code into the tracing so it's not hit when tracing is
disabled."

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
