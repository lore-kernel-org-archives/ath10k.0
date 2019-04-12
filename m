Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEvPn-0004H1-PG
 for ath10k@lists.infradead.org; Fri, 12 Apr 2019 12:36:21 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 0/6] ath10k: SDIO and high latency patches from Silex
References: <20190409190851.4557-1-erik.stromdahl@gmail.com>
Date: Fri, 12 Apr 2019 15:36:15 +0300
In-Reply-To: <20190409190851.4557-1-erik.stromdahl@gmail.com> (Erik
 Stromdahl's message of "Tue, 9 Apr 2019 21:08:45 +0200")
Message-ID: <87pnprflj4.fsf@kamboji.qca.qualcomm.com>
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

> This series adds a few more fixes for SDIO and high latency devices.
>
> I have had these on my private tree for quite some time now so they
> should be considered fairly well tested.
>
> 4 out of 6 patches are from Alagu Sankar at Silex.
> I have made some adjustments to some of them in order to make them
> smaller and easier to review.
>
> Alagu Sankar (4):
>   ath10k: use clean packet headers
>   ath10k: high latency fixes for beacon buffer
>   ath10k: sdio: read RX packets in bundles
>   ath10k: sdio: add MSDU ID allocation in HTT TX path
>
> Erik Stromdahl (2):
>   ath10k: sdio: add missing error check
>   ath10k: sdio: replace skb_trim with explicit set of skb->len

Bad timing as also me and Wen have been cleaning up these patches and
finalising the SDIO support so our work overlapped. I'll send our
version of patches soon and we can then compare.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
