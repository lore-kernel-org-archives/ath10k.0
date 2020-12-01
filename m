Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk3LD-0003YD-3w
 for ath10k@lists.infradead.org; Tue, 01 Dec 2020 10:57:05 +0000
Received: by mail-ej1-f70.google.com with SMTP id a8so1001821ejc.19
 for <ath10k@lists.infradead.org>; Tue, 01 Dec 2020 02:57:00 -0800 (PST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: ath10k: Missing airtime scheduler parts
In-Reply-To: <2631481.BEx9A2HvPv@ripper>
References: <2631481.BEx9A2HvPv@ripper>
Date: Tue, 01 Dec 2020 11:56:57 +0100
Message-ID: <87a6uxx092.fsf@toke.dk>
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
To: Sven Eckelmann <sven@narfation.org>, linux-wireless@vger.kernel.org
Cc: Yibo Zhao <yiboz@codeaurora.org>, ath10k@lists.infradead.org

Sven Eckelmann <sven@narfation.org> writes:

> Hi,
>
> I was asked what parts are currently missing for (a better) airtime fairness 
> with ath10k. I know that the AQL were merged and enabled for ath10k (and 
> mt76). But there was also the virtual time-based airtime scheduler [1] which 
> was proposed. I think the development on that one didn't continue since last 
> year.

I did recently rebase that patch to the current mac80211-next, actually.
Sent it off to Felix for some testing, but if you wan to give it a go I
can post it to the list as well :)

> Maybe someone else knows if there were some other parts worked on
> which I've am missed and which were not yet merged.

I don't think there have been any other patches being actively worked
on, but I seem to recall something about AQL (partly?) breaking airtime
fairness because the scheduler only keeps fairness between stations that
are actually scheduled, and AQL interrupting that...

-Toke


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
