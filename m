Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9ukh-0004RX-Rl
 for ath10k@lists.infradead.org; Tue, 30 Jun 2015 12:35:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath: DFS - limit number of potential PRI sequences
References: <1434443643-28477-1-git-send-email-zefir.kurtisi@neratec.com>
Date: Tue, 30 Jun 2015 15:34:34 +0300
In-Reply-To: <1434443643-28477-1-git-send-email-zefir.kurtisi@neratec.com>
 (Zefir Kurtisi's message of "Tue, 16 Jun 2015 10:34:03 +0200")
Message-ID: <87si991ijp.fsf@kamboji.qca.qualcomm.com>
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
To: Zefir Kurtisi <zefir.kurtisi@neratec.com>
Cc: ath9k-devel@venema.h4ckr.net, linux-wireless@vger.kernel.org, poh@qca.qualcomm.com, ath10k@lists.infradead.org

Zefir Kurtisi <zefir.kurtisi@neratec.com> writes:

> In the PRI detector, after the current radar pulse
> has been checked agains existing PRI sequences, it
> is considered as part of a new potential sequence.
>
> Previously, the condition to accept a new sequence
> was to have at least the same number of pulses as
> the longest matching sequence. This was wrong,
> since it led to duplicates of PRI sequences.
>
> This patch changes the acceptance criteria for new
> potential sequences from 'at least' to 'more than'
> the longest existing.
>
> Detection performance remains unaffected, while
> the number of PRI sequences accounted at runtime
> (and with it CPU load) is reduced by up to 50%.
>
> Signed-off-by: Zefir Kurtisi <zefir.kurtisi@neratec.com>

Thanks, applied to ath.git.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
