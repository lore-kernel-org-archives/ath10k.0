Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBhmQ-0002u2-M7
 for ath10k@lists.infradead.org; Thu, 15 Jan 2015 10:35:59 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: prevent fw reg dump spam
References: <1421072977-22688-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 15 Jan 2015 12:35:26 +0200
In-Reply-To: <1421072977-22688-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 12 Jan 2015 15:29:37 +0100")
Message-ID: <87wq4oxrf5.fsf@kamboji.qca.qualcomm.com>
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

> Originally the explicit fw register dump was added
> to wait_for_target_init because interrupts are
> masked early during power_up.
>
> Due to some changes in power_up/reset sequences
> sometimes when fw crashed ath10k would print the
> dump more than once via hif_stop -> warm_reset ->
> wait_for_target_init, possibly with different
> values each.
>
> Prevent this by doing the explicit fw register
> dump only during power_up instead of
> wait_for_target_init.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
