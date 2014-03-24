Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WS0gT-0007rT-AR
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 08:56:42 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 4/8] ath10k: setup rx channel per ppdu
References: <1395394341-3958-1-git-send-email-janusz.dziedzic@tieto.com>
 <1395394341-3958-5-git-send-email-janusz.dziedzic@tieto.com>
Date: Mon, 24 Mar 2014 10:56:14 +0200
In-Reply-To: <1395394341-3958-5-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Fri, 21 Mar 2014 10:32:17 +0100")
Message-ID: <87vbv46klt.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> Setup band and frequency in ieee80211_rx_status
> only once - for ppdu.
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

[...]

> @@ -775,23 +794,7 @@ static void ath10k_process_rx(struct ath10k *ar, struct htt_rx_info *info)
>  	if (info->amsdu_more)
>  		status->flag |= RX_FLAG_AMSDU_MORE;
>  
> -	status->signal = info->signal;

What about the signal, how is it set now? I don't see that anywhere in
this patch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
