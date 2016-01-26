Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aO58q-0000On-BM
 for ath10k@lists.infradead.org; Tue, 26 Jan 2016 15:02:52 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: prevent txrx running for too long
References: <1452693172-28340-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 26 Jan 2016 17:01:57 +0200
In-Reply-To: <1452693172-28340-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 13 Jan 2016 14:52:52 +0100")
Message-ID: <87twm0peoq.fsf@kamboji.qca.qualcomm.com>
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

> On multicore systems it was possible for the txrx
> tasklet to keep on running for long periods of
> time on a single CPU due to tx completion
> processing. Another CPU could feed the running
> tasklet for an indefinite amount of time.
>
> The tasklet is now guaranteed to run a finite
> amount of time and is limited by HTT CE Rx ring
> depth.
>
> This improves behavior when RPS is used on target
> system and might improve TCP handling as well.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
