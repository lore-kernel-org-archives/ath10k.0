Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJKSP-0005fZ-W3
 for ath10k@lists.infradead.org; Fri, 28 Feb 2014 10:14:18 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3 0/8] ath10k: performance improvements
References: <1392629563-31046-1-git-send-email-michal.kazior@tieto.com>
 <1393485587-16879-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 28 Feb 2014 12:13:51 +0200
In-Reply-To: <1393485587-16879-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 27 Feb 2014 08:19:39 +0100")
Message-ID: <87ppm7bl40.fsf@kamboji.qca.qualcomm.com>
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

> These patches aim at reducing host CPU load and
> thus improve performance on low-end systems.
>
> In my setup I get a relative improvement of
> 100mbps for both UDP Tx and Rx.
>
>                Tx ----->
> laptop:eth---eth:AP135:ath10k---ath10k:laptop
>                <----- Rx
>
>
> v2:
>  * improve comments/commit messages
>  * fix unbalanced locking
>  * fix var naming (s/err/ret)
>  * fix sparse/checkpatch/buildbot warnings
>  * remove code that didn't belong here
>  * split batch tx/rx into 2 patches
>    (+ath10k: reduce htt tx/rx spinlock overhead)
>
> v3:
>  * just a resend (due to my mail-server issues the
>    other day not all of the v2 patches had been
>    sent out)
>
> Michal Kazior (8):
>   ath10k: remove DMA mapping wrappers
>   ath10k: remove is_aborted from skb_cb
>   ath10k: replace send_head() with tx_sg()
>   ath10k: bypass htc for htt tx path
>   ath10k: batch htt tx/rx completions
>   ath10k: reduce htt tx/rx spinlock overhead
>   ath10k: remove pci completion list
>   ath10k: minimize coherent dma accesses

Thanks, all eight patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
