Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIqUq-0003Zv-Na
 for ath10k@lists.infradead.org; Fri, 11 Oct 2019 08:42:02 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [RFC PATCH 1/2] ath10k: report survey info as accumulated values
References: <20190918124259.17804-1-sven@narfation.org>
 <20190918124259.17804-2-sven@narfation.org>
Date: Fri, 11 Oct 2019 11:41:56 +0300
In-Reply-To: <20190918124259.17804-2-sven@narfation.org> (Sven Eckelmann's
 message of "Wed, 18 Sep 2019 14:42:58 +0200")
Message-ID: <87mue7znaj.fsf@kamboji.qca.qualcomm.com>
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
To: Sven Eckelmann <sven@narfation.org>
Cc: vnaralas@codeaurora.org, linux-wireless@vger.kernel.org, Sven Eckelmann <seckelmann@datto.com>, ath10k@lists.infradead.org

Sven Eckelmann <sven@narfation.org> writes:

> From: Sven Eckelmann <seckelmann@datto.com>
>
> The survey report is expected to contain a counter which is increasing all
> the time. But ath10k reports some kind of delta. This can either be the
> difference to the last get_survey or the difference to some even older
> get_survey because the values are sometimes cached and sometimes
> overwritten.
>
> To make the returned values useful, they must be accumulated manually by
> ath10k before send out to the upper layers. Special care must be taken when
> accepting values from older firmware versions (which use
> ATH10K_HW_CC_WRAP_SHIFTED_ALL) because they will not clear the cycle_busy
> and cycle_total counter and will only use 31 bit of the 64 but counter.

Please clarify a bit more which older firmware versions you are talking
about, we have so many of them :) I assume you are talking about _all_
QCA988X and QCA9887 firmware versions, but it would be nice to clarify
that in the commit log.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
