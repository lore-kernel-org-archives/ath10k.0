Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x233.google.com ([2607:f8b0:4001:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYccr-0004To-BS
 for ath10k@lists.infradead.org; Thu, 19 Mar 2015 15:44:50 +0000
Received: by iecsl2 with SMTP id sl2so69293441iec.1
 for <ath10k@lists.infradead.org>; Thu, 19 Mar 2015 08:44:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8ab73bee-735c-4140-a050-e52fb2afd5b5@DE-WIE-EXCH3A.green.sophos>
References: <54EB264D.5040805@sophos.com>
 <CA+BoTQnaNmRs9NcXUtJddhD1SfxAy+Ct-s-hD4mvsi9cqh1eSw@mail.gmail.com>
 <54EB2ED5.8040104@sophos.com>
 <CA+BoTQm01wMzdB1-1V6OE=oNRuCcrrAoRU5LtxYiQt+TmSEfxA@mail.gmail.com>
 <54EB3C30.60302@sophos.com>
 <CA+BoTQkQq5RG4dDBf0whxBfe5yNvjSb-57AYfoDWeHk-CuZvAw@mail.gmail.com>
 <8ab73bee-735c-4140-a050-e52fb2afd5b5@DE-WIE-EXCH3A.green.sophos>
Date: Thu, 19 Mar 2015 08:44:27 -0700
Message-ID: <CAJ-VmonNygdZHU9+aUMh47_hjsRtrEqhH5wvgEWoQepPQh9DhQ@mail.gmail.com>
Subject: Re: ath10k + INTEL_IDLE aka. cstates == firmware crash
From: Adrian Chadd <adrian@freebsd.org>
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
To: Fabian Wittenberg <Fabian.Wittenberg@sophos.com>
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

It's possible that you're entering a sleep state, the whole socket +
dram controller is going to sleep, and the latency that the wakeup
causes is confusing the firmware and/or DMA engine.



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
