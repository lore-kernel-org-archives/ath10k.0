Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qc0-x229.google.com ([2607:f8b0:400d:c01::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wkf0Q-0002Ij-Hs
 for ath10k@lists.infradead.org; Wed, 14 May 2014 19:38:22 +0000
Received: by mail-qc0-f169.google.com with SMTP id e16so51949qcx.28
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 12:38:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA93jw6-Vu5=ySa1Oi6WO1BEo8cuAnKP3FJNJD1P=dEj_-9D3A@mail.gmail.com>
References: <CAHqTa-3YUpt3jByNxiEkPGV52CoRDS-R4W33ywKVLa-Ye9d2bQ@mail.gmail.com>
 <53703B61.3050305@candelatech.com>
 <CAHqTa-3Rj-=4A3BoQoD0fb7P=jDd53KvGjxW_BnkoF_+hdWW5g@mail.gmail.com>
 <53704888.9060602@candelatech.com>
 <CAHqTa-2sG0wDVaGQVkVcPezArA=OGT+35s_GU+5AmV0TQOau7w@mail.gmail.com>
 <537056B1.6060902@candelatech.com>
 <CAHqTa-1DwKqeSQD5FwOomyhqHv1THWD__0pnEs3RktOigp70kw@mail.gmail.com>
 <CAHqTa-2y9n3AxdN--QGqGW-HRZnrBwEOhujWZ4FNZKmpU+kHMQ@mail.gmail.com>
 <CAHqTa-3gn1N8hTW4rpMos+h+K4nafoEsv94P0=0O3=Dpiaf2oA@mail.gmail.com>
 <CAA93jw6-Vu5=ySa1Oi6WO1BEo8cuAnKP3FJNJD1P=dEj_-9D3A@mail.gmail.com>
Date: Wed, 14 May 2014 12:38:00 -0700
Message-ID: <CAJ-Vmo=iof58iAkg0cGHthnPLq1Pk9VO2-ZZUje2hC=OsGOVdA@mail.gmail.com>
Subject: Re: Unicast packets stop being transmitted to a particular station,
 under load, when WPA2 is enabled
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
To: Dave Taht <dave.taht@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>, Avery Pennarun <apenwarr@gmail.com>

[snip]

I found a lot of .. bad behaving WME/TID/QoS mapping code in freebsd's
atheros and net80211 code. It wouldn't surprise me to find the same in
Linux. There's not always a lot of driver / stack testing with
multiple overlapping TID traffic. (I found a lot out by actually
running lots of torrents whilst working; that triggers some bulk/best
effort/high priority concurrent traffic and it clued me in for how
screwed up it is.)

Ok, so the "seqno = 0" thing is something that various wireless stacks
do (including a couple of freebsd drivers, ugh) - when aggregation is
enabled, they reset the seqno back to 0 before continuing. It's kind
of odd, but it's typically because the non-aggregation seqno space was
done by the wireless stack (net80211 or derived) but then aggregation,
BAW tracking transmit/retransmit is done by the driver and/or
firmware. Thus it doesn't actually know about the sequence numbers in
question.

Yes, you negotiate a different block-ack setup with each TID. Same as
how each TID has a separate sequence number space. It gets more
interesting, as there's only one set of keys for all TIDs, yet each
TID can have a separate replay counter.

Anyway, lemme look at the trace. I'd like to see what's going on after
the negotitation.


-a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
