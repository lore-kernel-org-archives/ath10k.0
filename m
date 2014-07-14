Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X6gG9-0004yO-5d
 for ath10k@lists.infradead.org; Mon, 14 Jul 2014 13:25:38 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix unregister deadlock when fw probe fails
References: <1404120720-14649-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 14 Jul 2014 16:25:11 +0300
In-Reply-To: <1404120720-14649-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 30 Jun 2014 11:32:00 +0200")
Message-ID: <87r41okr7s.fsf@kamboji.qca.qualcomm.com>
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

> If firmware probing worker failed it called
> device_release_driver() which synchronously called
> remove() pci callback. The callback in turn waited
> for the worker that called it to finish resulting
> in a deadlock.
>
> Waiting for a completion instead of a worker, like
> some other drivers do, doesn't seem like the best
> idea either:
>
>   Syscall                 Worker
>
>                           probe_fw()
>   rmmod
>   dev_lock()
>   pci->remove()
>   wait_for_completion()
>                           complete_all()
>                           device_release_driver()
>                           dev_lock()
>                           [sleep]
>   free(ar)
>   dev_unlock()
>                           [resume]
>
> There's no guarantee that Worker upon resuming can
> still access any data/code of the module.
>
> Leaving device bound to a driver is not as harmful
> as deadlocking so remove the call to
> device_release_driver() while a proper solution is
> figured out.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
