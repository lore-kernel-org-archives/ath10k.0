Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvlGg-0004Cp-NR
 for ath10k@lists.infradead.org; Fri, 22 May 2015 11:37:35 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3 1/2] ath10k: handle cycle counter wraparound
References: <CA+BoTQ=V1psOoaL1WG7vSUjSLhPnQqBUODjeB3NyWt-pMtmNFA@mail.gmail.com>
 <1432282693-4553-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 22 May 2015 14:36:56 +0300
In-Reply-To: <1432282693-4553-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 22 May 2015 10:18:12 +0200")
Message-ID: <87zj4w4zdz.fsf@kamboji.qca.qualcomm.com>
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

> When QCA988X cycle counter HW register wraps
> around it resets to 0x7fffffff instead of 0. All
> other cycle counter related registers are divided
> by 2 so they never wraparound themselves. QCA61X4
> has a uniform CC and it wraparounds in a regular
> fashion though.
>
> Worst case wraparound time is approx 24 seconds
> (2**31 / 88MHz). Since scan channel visit times
> are max 5 seconds (offchannel case) it is
> guaranteed there's been at most 1 wraparound and
> it is possible to compute survey data.
>
> This fixes some occasional incorrect survey data
> on QCA988X as some channels (depending on how/when
> scan/offchannel requests were requested) would
> have approx 24 sec active time which wasn't
> actually the case.
>
> This should help make hostapd ACS more reliable.
>
> Reported-by: Srinivasa Duvvuri <sduvvuri@chromium.org>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> +void ath10k_core_get_cc_delta(struct ath10k *ar,
> +			      u32 *cc_delta, u32 *rcc_delta,
> +			      u32 cc, u32 rcc,
> +			      u32 cc_prev, u32 rcc_prev)
> +{
> +	if (ar->hw_params.has_shifted_cc_wraparound && cc < cc_prev) {
> +		cc_prev -= 0x7fffffff;
> +		rcc *= 2;
> +	}
> +
> +	*cc_delta = cc - cc_prev;
> +	*rcc_delta = rcc - rcc_prev;
> +}

Why do you have this function in core.c? Why not in wmi.c?


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
