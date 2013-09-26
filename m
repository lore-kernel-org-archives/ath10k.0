Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPCUg-0008Sn-BE
 for ath10k@lists.infradead.org; Thu, 26 Sep 2013 14:24:39 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: replenish HTT RX buffers in a tasklet
References: <1380010716-27151-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 26 Sep 2013 17:24:01 +0300
In-Reply-To: <1380010716-27151-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 24 Sep 2013 10:18:36 +0200")
Message-ID: <8761tnpsou.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> This starves FW RX ring buffer in case of
> excessive RX. This prevents from CPU being
> overwhelmed by RX indications/completions by
> naturally forbiddin FW to submit more RX.
>
> This fixes RX starvation on slow machines when
> under heavy RX traffic.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied. I did a cosmetic change:

> +/* Refill a bunch of RX buffers for each refill round so that FW/HW can handle
> + * aggregated traffic more nicely. */
> +#define ATH10K_HTT_MAX_NUM_REFILL 16
> +
> +

I removed the extra newline here.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
