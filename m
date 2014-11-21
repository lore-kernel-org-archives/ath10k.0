Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xrrb7-0001Nj-47
 for ath10k@lists.infradead.org; Fri, 21 Nov 2014 17:02:17 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/7] ath10k: rework rx path
References: <1415110931-10945-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 21 Nov 2014 19:01:51 +0200
In-Reply-To: <1415110931-10945-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 4 Nov 2014 15:22:04 +0100")
Message-ID: <87oas0bi80.fsf@kamboji.qca.qualcomm.com>
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

> This patchset unifies rx path. Instead of
> branching for A-MSDU and MSDU cases a single
> codepath is introduced.
>
> This yields:
>
>    text    data     bss     dec     hex filename
>   14068       0       0   14068    36f4 before/htt_rx.o
>   13308       3       0   13311    33ff after/htt_rx.o
>
> I haven't measured any Rx performance loss in my
> setup but I may be biased. In theory this could
> reduce i-cache pressure and improve Rx throughput
> on CPU contrained systems by a few mbps.
>
> This patchset serves two purposes though:
>  - clean up and unify the Rx path a bit
>  - make it possible to reuse code more easily in
>    the future
>
>
> Michal Kazior (7):
>   ath10k: start using sk_buff_head
>   ath10k: simplify Rx loop
>   ath10k: refactor htt->rx_confused
>   ath10k: unify rx undecapping
>   ath10k: remove unused function argument
>   ath10k: use rx descriptor for ppdu status extraction
>   ath10k: report rx rate and signal for fragmented Rx

Thanks, all seven applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
