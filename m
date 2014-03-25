Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22d.google.com ([2607:f8b0:400c:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMnz-0002yI-Nu
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 08:33:56 +0000
Received: by mail-vc0-f173.google.com with SMTP id il7so142962vcb.32
 for <ath10k@lists.infradead.org>; Tue, 25 Mar 2014 01:33:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQmVw1fiDU_Pu_fowRfFdme-AZ1-qLmxhCHuxFPSK831rw@mail.gmail.com>
References: <1395734146-10907-1-git-send-email-yeohchunyeow@gmail.com>
 <CA+BoTQmVw1fiDU_Pu_fowRfFdme-AZ1-qLmxhCHuxFPSK831rw@mail.gmail.com>
Date: Tue, 25 Mar 2014 16:33:34 +0800
Message-ID: <CAEFj9867Z+x3orcwUpwjwQB-9c5r4FfAuZBHYDGZ1hNe=6Z1pA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix printing of peer stats in non-AP firmware
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi, Michal

> I suppose there's a limit how much peer entries firmware is able to
> pack up into a single event. The second event you handle here is still
> going to have some sort of a limit and you'll end up dropping results
> again. The same probably goes with vdev stats (which aren't handled
> yet, but hey).

vdev stats is not supported by firmware 999.999.0.636, am I right?
BTW, I also saw that the same happen to latest AP firmware whenever
the peer stats is more than 1. But since the first peer stats is self
stats, so it is ok to overwrite it.

> I think a better approach would be to make read_target_stats *append*
> data to the stats structure and make ath10k wait for more possible
> events instead of being satisfied with just one.
>
> The way you do it now seems like you end up with the extra results
> being shown upon *next* stat request-response.. i.e. you see old
> results.

Will take a look on this.

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
