Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9HvC-00057B-0P
 for ath10k@lists.infradead.org; Mon, 21 Jul 2014 18:02:46 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: prevent some tx flushing failures
References: <1405518073-14513-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 21 Jul 2014 21:02:16 +0300
In-Reply-To: <1405518073-14513-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 16 Jul 2014 15:41:13 +0200")
Message-ID: <874myay4if.fsf@kamboji.qca.qualcomm.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Firmware could request inspection of some
> submitted tx requests. Since the callback wasn't
> implemented it was possible to bleed tx msdu_ids
> which could translate to tx flushing timeouts.
>
> There's nothing ath10k can do to help firmware
> with tx processing now so just report all tx
> frames as already inspected to prevent firmware
> from sending up inspection events and force it to
> report regular tx completion indications with
> discard status.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
