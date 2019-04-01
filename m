Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAulR-0002EZ-8f
 for ath10k@lists.infradead.org; Mon, 01 Apr 2019 11:06:07 +0000
Received: by mail-lf1-f65.google.com with SMTP id a6so5974799lfl.5
 for <ath10k@lists.infradead.org>; Mon, 01 Apr 2019 04:06:03 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH] ath10k: remove iteration in wake_tx_queue
In-Reply-To: <20190327162906.6010-1-erik.stromdahl@gmail.com>
References: <20190327162906.6010-1-erik.stromdahl@gmail.com>
Date: Mon, 01 Apr 2019 13:05:56 +0200
Message-ID: <87bm1qq92j.fsf@toke.dk>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>, kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: yiboz@codeaurora.org

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> Iterating the TX queue and thereby dequeuing all available packets in the
> queue could result in performance penalties on some SMP systems.
>
> The reason for this is most likely that the per-ac lock (active_txq_lock)
> in mac80211 will be held by the CPU iterating the current queue.
>
> This will lock up other CPUs trying to push new messages on the TX
> queue.
>
> Instead of iterating the queue we fetch just one packet at the time,
> resulting in minimal starvation of the other CPUs.

Did you test this with Felix' patches reducing the time the lock is held
in mac80211?

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
