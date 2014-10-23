Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XhIjQ-0004rw-TN
 for ath10k@lists.infradead.org; Thu, 23 Oct 2014 13:47:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/6] ath10k: pci related fixes 2014-10-09
References: <1413807282-27951-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 23 Oct 2014 16:46:45 +0300
In-Reply-To: <1413807282-27951-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 20 Oct 2014 14:14:36 +0200")
Message-ID: <87oat2q4oq.fsf@kamboji.qca.qualcomm.com>
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

> First 2 patches address some irq issues.
>
> Other 4 fix and cleanup device resetting.
>
> Hopefully this will make ath10k a little more
> robust when it comes to warm reset.
>
> As a side effect of the changes ath10k now boots a
> little faster (slightly over a second instead of
> two).
>
> v2:
>  * don't remove power_up/down [Kalle]
>  * fix CE crash [Janusz]
>  * remove irq workaround in patch #2
>
>
> Michal Kazior (6):
>   ath10k: re-disable interrupts after target init
>   ath10k: mask/unmask msi fw irq
>   ath10k: split ce pipe init/alloc further

I have applied these patches.

>   ath10k: make warm reset a bit safer and faster
>   ath10k: split reset logic from power up
>   ath10k: don't reset chip on power_down

And dropped these patches per your request.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
