Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axFOc-0004Sl-Tm
 for ath10k@lists.infradead.org; Mon, 02 May 2016 15:04:27 +0000
Received: by mail-pf0-x229.google.com with SMTP id 77so47154175pfv.2
 for <ath10k@lists.infradead.org>; Mon, 02 May 2016 08:04:06 -0700 (PDT)
Message-ID: <1462201445.5535.247.camel@edumazet-glaptop3.roam.corp.google.com>
Subject: Re: [Codel] fq_codel_drop vs a udp flood
From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Mon, 02 May 2016 08:04:05 -0700
In-Reply-To: <CACiydbL0K2fQT4EXm4LjDaxDLC+AVj9szTpyHq2iUwuPVNNz+g@mail.gmail.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbL0K2fQT4EXm4LjDaxDLC+AVj9szTpyHq2iUwuPVNNz+g@mail.gmail.com>
Mime-Version: 1.0
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
To: Roman Yeryomin <leroi.lists@gmail.com>
Cc: make-wifi-fast@lists.bufferbloat.net, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Dave Taht <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>

On Mon, 2016-05-02 at 17:09 +0300, Roman Yeryomin wrote:

> So if I run some UDP download you will just kill me? Sounds broken.
> 

Seriously guys, I never suggesting kill a _task_ but the _flow_

Meaning dropping packets. See ?

If you do not want to drop packets, do not use fq_codel and simply use
bufferbloat pfifo_fast.





_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
