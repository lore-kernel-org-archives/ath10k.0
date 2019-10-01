Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFHBA-0000EV-DB
 for ath10k@lists.infradead.org; Tue, 01 Oct 2019 12:22:57 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 5/5] ath10k: sdio: remove skb_trim in TX path
References: <20190417191503.18814-1-erik.stromdahl@gmail.com>
 <20190417191503.18814-6-erik.stromdahl@gmail.com>
Date: Tue, 01 Oct 2019 15:22:52 +0300
In-Reply-To: <20190417191503.18814-6-erik.stromdahl@gmail.com> (Erik
 Stromdahl's message of "Wed, 17 Apr 2019 21:15:03 +0200")
Message-ID: <871rvw64f7.fsf@kamboji.qca.qualcomm.com>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> This patch fixes a bug with padding of the skb data buffer.
> Since skb_trim can only be used to reduce the skb len, it is useless when
> we pad (increase the length of) the skb. Instead we allocate a new
> buffer with enough space to contain both the TX data and padding.
>
> Since some skb's have multiple references, we can't use skb_put_padto()
> to extend and pad skb->data (since it causes a panic if there is more
> than one reference).
>
> Also, in order to avoid the following possible deadlock issue (reported by
> lockdep):
>
> [   26.508508]  Possible interrupt unsafe locking scenario:
> [   26.508508]
> [   26.515314]        CPU0                    CPU1
> [   26.519862]        ----                    ----
> [   26.524408]   lock(fs_reclaim);
> [   26.527573]                                local_irq_disable();
> [   26.533508]                                lock(_xmit_ETHER#2);
> [   26.539453]                                lock(fs_reclaim);
> [   26.545135]   <Interrupt>
> [   26.547769]     lock(_xmit_ETHER#2);
> [   26.551370]
> [   26.551370]  *** DEADLOCK ***
>
> ... we use the GFP_NOFS flag with kzalloc()
>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>

I replied to v1 about using skb_pad(), let's discuss more there:

https://patchwork.kernel.org/patch/10891949/

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
