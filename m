Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X87LC-0006Re-73
 for ath10k@lists.infradead.org; Fri, 18 Jul 2014 12:32:47 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFT/RFC 0/5] ath10k: handle/report A-MSDU as a skb list
References: <1404992714-15690-1-git-send-email-janusz.dziedzic@tieto.com>
Date: Fri, 18 Jul 2014 15:32:18 +0300
In-Reply-To: <1404992714-15690-1-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Thu, 10 Jul 2014 13:45:09 +0200")
Message-ID: <871tti3l0t.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: ath10k@lists.infradead.org, denton.gentry@gmail.com

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> This is prototype, how we can handle A-MSDU as a skb list in mac80211.
> No changes in mac80211 reordering code required in such case, also we
> don't need to build one big frame using memcpy ...
>
> With such prototype tid_agg_rx->reorder_buf[sn] will describe exactly
> one MPDU (with included A-MSDU subframes if skb->next) and detection of
> duplicated frames will work correctly. So, reordering should works
> correctly.
>
> I tested this with A-MPDU and A-MSDU run together (A-MSDU frame up to
> 10k) - TCP STA -> AP. I used ath10k STA with unlocked A-MSDU limit in
> RC in firmware. Didn't notice any problems.

So what are you exactly fixing here? It would be nice to get some
background and motivations for the changes in the cover letter.

Also we have so many reordering patches that I'm confused now. For
example, how is this related to patch "ath10k: handle attention flags
correctly when A-MSDU"?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
