Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDxcZ-0001TW-Cj
 for ath10k@lists.infradead.org; Thu, 13 Feb 2014 14:50:36 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Set proper nss value for the peer
References: <1392027925-8321-1-git-send-email-marek.kwaczynski@tieto.com>
Date: Thu, 13 Feb 2014 16:50:08 +0200
In-Reply-To: <1392027925-8321-1-git-send-email-marek.kwaczynski@tieto.com>
 (Marek Kwaczynski's message of "Mon, 10 Feb 2014 11:25:25 +0100")
Message-ID: <87txc383tr.fsf@kamboji.qca.qualcomm.com>
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
To: Marek Kwaczynski <marek.kwaczynski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Marek Kwaczynski <marek.kwaczynski@tieto.com> writes:

> It was found during testing the nss calculation does not
> cover all corner cases. Station could request eq. only MCS8
> and MCS9 (nss=2 specific). Next num_rates=2 so the driver
> sets nss=(max((2+7)/8, 1))=1. Which is wrong. The in-driver
> calculation was introduced prior (commit ddcc347b70
> mac80211: fix rx_nss calculation for drivers with hw rc).
> Since it's fixed, use mac80211 provided value from now.
> End user will experience lower throuhputs than expected
> if the nss is wrongly calculated.
>
> Signed-off-by: Marek Kwaczynski <marek.kwaczynski@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
