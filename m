Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ya47R-0005zu-Oo
 for ath10k@lists.infradead.org; Mon, 23 Mar 2015 15:18:22 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/6] ath10k: thermal mitigation fixes
References: <1426431985-16332-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Mon, 23 Mar 2015 17:17:49 +0200
In-Reply-To: <1426431985-16332-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Sun, 15 Mar 2015 20:36:19 +0530")
Message-ID: <877fu7eo9u.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> Here are few enhancements in thermal throttling that allows
> user to control throttling state and quiet period. Also enables
> throttling for station mode. These patches are rebased on latest TOT.
>
> Rajkumar Manoharan (6):
>   ath10k: add debugfs entry to configure quiet period
>   ath10k: Fix interpretation of cooling device state
>   ath10k: configure thermal throttle while powering up
>   ath10k: do not restrict thermal throttling to ap mode
>   ath10k: cache throttle state when device is down
>   ath10k: move driver state check before setting throttle

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
