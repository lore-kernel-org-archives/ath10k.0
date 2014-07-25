Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XAaiP-00040r-S2
 for ath10k@lists.infradead.org; Fri, 25 Jul 2014 08:18:58 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v4] ath10k: fix Rx aggregation reordering
References: <1405509540-32691-1-git-send-email-michal.kazior@tieto.com>
 <1406110833-14031-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 25 Jul 2014 11:18:30 +0300
In-Reply-To: <1406110833-14031-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Wed, 23 Jul 2014 12:20:33 +0200")
Message-ID: <87ha25rgvd.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Denton Gentry <denton.gentry@gmail.com>

Michal Kazior <michal.kazior@tieto.com> writes:

> Firmware doesn't perform Rx reordering so it is
> left to the host driver to do that.
>
> Use mac80211 to perform reordering instead of
> re-inventing the wheel.
>
> This fixes TCP throughput issues in some
> environments.
>
> Reported-by: Denton Gentry <denton.gentry@gmail.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
