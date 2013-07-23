Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1YG1-0003GY-HZ
 for ath10k@lists.infradead.org; Tue, 23 Jul 2013 08:47:46 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/4] ath10k: fixes
References: <1374129193-3533-1-git-send-email-michal.kazior@tieto.com>
 <1374495211-20353-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 23 Jul 2013 11:47:16 +0300
In-Reply-To: <1374495211-20353-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 22 Jul 2013 14:13:27 +0200")
Message-ID: <87mwpdwtm3.fsf@kamboji.qca.qualcomm.com>
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

> Hi,
>
> Here are some fixes for ath10k. The rts threshold
> patch addresses my mistake in commit
> 9aeb6fe53d1f0d6e58658484ce9ad7b59f0ef16b which
> caused rts to be always enabled causing throughput
> issues in some cases.
>
> v2: first patch is split now into two as requested
>     rebased on top of latest github master branch
>
>
> Michal Kazior (4):
>   ath10k: prevent HTC from being used after stopping
>   ath10k: don't reset HTC endpoints unnecessarily
>   ath10k: fix memleak in mac setup
>   ath10k: fix rts/fragmentation threshold setup

All four applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
