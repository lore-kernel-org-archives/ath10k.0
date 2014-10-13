Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XdaZc-0000Cy-CU
 for ath10k@lists.infradead.org; Mon, 13 Oct 2014 08:01:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 5/5] ath10k: replace power up/down with reset callback
References: <1412842950-14098-1-git-send-email-michal.kazior@tieto.com>
 <1412842950-14098-6-git-send-email-michal.kazior@tieto.com>
Date: Mon, 13 Oct 2014 11:01:07 +0300
In-Reply-To: <1412842950-14098-6-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 9 Oct 2014 10:22:30 +0200")
Message-ID: <87fves9z5o.fsf@kamboji.qca.qualcomm.com>
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

> The power up/down didn't make much sense any more
> since hif_stop already stops the device
> compeletely. The target lifecycle was never symmetric
> so don't bother trying to make it look like it is
> and expose a reset hif callback instead of power
> up/down callbacks.
>
> This removes redundant reset calls and thus makes
> device boot/stop/recovery a bit faster.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

About this I'm not that sure. The reason why I wanted to have power_up()
and power_down() is the case when we need to control the target power
via a gpio line, which I anticipate we will need soon. If you remove
these how could we control the gpio line?

Wouldn't it be the same that you just make hif_power_up() do the same as
hif_reset() and hif_power_down() doesn't do anything (for now)? Or am I
missing something?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
