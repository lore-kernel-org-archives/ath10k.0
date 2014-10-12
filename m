Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XdNQp-0005dt-Fm
 for ath10k@lists.infradead.org; Sun, 12 Oct 2014 17:59:49 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: fix kernel panic while shutting down AP
References: <1412942907-24760-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Sun, 12 Oct 2014 20:59:15 +0300
In-Reply-To: <1412942907-24760-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Fri, 10 Oct 2014 17:38:27 +0530")
Message-ID: <87bnphb24s.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> Based on GFP flag given to DMA coherent allocation, the behaviour of
> dma_free_coherent is changed. This behavioural diffrence is noticeable
> in ARM platform. If DMA memory is allocated with GFP_KERNEL, free
> coherent can not be called inside spin lock. This is causing kernel
> crash in ARM platforms. Fix this by changing GFP flag to atomic.
>
> Cc: Michal Kazior <michal.kazior@tieto.com>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Thanks, applied.

I modified the commit log a bit to mention the possible commit causing
this:

commit 82d7aba71541a308bc19e869f7cf7423672dee37
Author: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Date:   Fri Oct 10 17:38:27 2014 +0530

    ath10k: fix kernel panic while shutting down AP
    
    Based on GFP flag given to DMA coherent allocation, the behaviour of
    dma_free_coherent is changed. This behavioural diffrence is noticeable
    in ARM platform. If DMA memory is allocated with GFP_KERNEL, free
    coherent can not be called inside spin lock. This is causing kernel
    crash in ARM platforms. Fix this by changing GFP flag to atomic.
    
    This is most likely a regression from commit 64badcb6d645 ("ath10k: workaround
    fw beaconing bug").
    
    Cc: Michal Kazior <michal.kazior@tieto.com>
    Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
