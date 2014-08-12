Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XH739-0000Pj-11
 for ath10k@lists.infradead.org; Tue, 12 Aug 2014 08:03:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/6] ath10k: fixes 2014-08-07, part 1
References: <1407402212-29809-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 12 Aug 2014 10:56:24 +0300
In-Reply-To: <1407402212-29809-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 7 Aug 2014 11:03:26 +0200")
Message-ID: <87lhquqgyf.fsf@kamboji.qca.qualcomm.com>
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

> This is part 1 (of 3) of my patches. Split for
> your reviewing pleasure.
>
> This one is mostly non-functional (just cleanups)
> except the removal of soc powersave.
>
>
> Michal Kazior (6):
>   ath10k: embed ar_pci inside ar
>   ath10k: remove target soc ps code
>   ath10k: remove pci features var
>   ath10k: group some pci probing helpers
>   ath10k: remove htc->stopped

Thanks, these five patches applied.

>   ath10k: move fw init print

I dropped this one as I think it's buggy.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
