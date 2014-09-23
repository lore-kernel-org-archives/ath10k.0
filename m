Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWMQM-0001aS-H1
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 09:30:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: workaround fw beaconing bug
References: <1411023358-5703-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 23 Sep 2014 12:29:46 +0300
In-Reply-To: <1411023358-5703-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 18 Sep 2014 08:55:58 +0200")
Message-ID: <87y4taelbp.fsf@kamboji.qca.qualcomm.com>
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

> Some firmware revisions don't wait for beacon tx
> completion before sending another SWBA event. This
> could lead to hardware using old (freed) beacon
> data in some cases, e.g. tx credit starvation
> combined with missed TBTT. This is very very rare.
>
> On non-IOMMU-enabled hosts this could be a
> possible security issue because hw could beacon
> some random data on the air.  On IOMMU-enabled
> hosts DMAR faults would occur in most cases and
> target device would crash.
>
> Since there are no beacon tx completions (implicit
> nor explicit) propagated to host the only
> workaround for this is to allocate a DMA-coherent
> buffer for a lifetime of a vif and use it for all
> beacon tx commands. Worst case for this approach
> is some beacons may become corrupted, e.g. garbled
> IEs or out-of-date TIM bitmap.
>
> Keep the original beacon-related code as-is in
> case future firmware revisions solve this problem
> so that the old path can be easily re-enabled with
> a fw_feature flag.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
