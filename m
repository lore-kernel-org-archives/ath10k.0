Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKMiu-0001RL-HU
 for ath10k@lists.infradead.org; Wed, 29 Jul 2015 08:28:24 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: Improve performance by reducing tx_lock
 contention.
References: <1437597504-25554-1-git-send-email-mfaltesek@google.com>
Date: Wed, 29 Jul 2015 11:27:44 +0300
In-Reply-To: <1437597504-25554-1-git-send-email-mfaltesek@google.com> (Marty
 Faltesek's message of "Wed, 22 Jul 2015 16:38:24 -0400")
Message-ID: <87h9on74hr.fsf@kamboji.qca.qualcomm.com>
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
To: Marty Faltesek <mfaltesek@google.com>
Cc: linux-wireless@vger.kernel.org, dgentry@google.com, ath10k@lists.infradead.org, apenwarr@google.com

Marty Faltesek <mfaltesek@google.com> writes:

> From: Qi Zhou <qizhou@google.com>
>
> During tx completion, tx_lock is held for longer than required, preventing
> efficient refill of htt->pending_tx. Refactor the code so that only MSDU
> related operations are protected by the lock.
>
> Improves downstream performance on a dual-core ARM Freescale LS1024A
> (f.k.a. Mindspeed Comcerto 2000) AP with a 3x3 client from 495 to 580 Mbps.
> Other CPU bound multicore systems may also benefit.
>
> Signed-off-by: Denton Gentry <dgentry@google.com>
> Signed-off-by: Avery Pennarun <apenwarr@google.com>
> [mfaltesek@google.com: removed conflicting code for tracking msdu_ids.]
> Signed-off-by: Marty Faltesek <mfaltesek@google.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
