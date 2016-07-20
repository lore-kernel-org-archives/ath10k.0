Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x22c.google.com ([2607:f8b0:4001:c0b::22c])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPkJa-0001WJ-HV
 for ath10k@lists.infradead.org; Wed, 20 Jul 2016 05:45:03 +0000
Received: by mail-it0-x22c.google.com with SMTP id f6so21794123ith.0
 for <ath10k@lists.infradead.org>; Tue, 19 Jul 2016 22:44:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQ=QMPUtY64ELCToZLcSrCPQdG=2Eg4FrsULeeDg9sFPYA@mail.gmail.com>
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>
 <e05dcb58-1cb1-a33a-31bb-b8ba1edf1363@dd-wrt.com>
 <fa3eab06-28f0-e5d4-2e92-770134b49dfa@dd-wrt.com>
 <1467218124941.40575@qti.qualcomm.com>
 <CA+BoTQkepLz55Vdr7OuMnPQPLKq_+vjZi=m2Y9rHLRgBZPsWOw@mail.gmail.com>
 <1468941948774.87860@qti.qualcomm.com>
 <CAJ-Vmon1duBNcWhjaNdANYFfd3hwQUYYHrmx7LRZvT-Ec2x1Cg@mail.gmail.com>
 <578E5AFA.4000908@candelatech.com>
 <CA+BoTQ=QMPUtY64ELCToZLcSrCPQdG=2Eg4FrsULeeDg9sFPYA@mail.gmail.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Tue, 19 Jul 2016 22:44:40 -0700
Message-ID: <CAJ-Vmok95tiLzmnfiBnnOLQK9hXW2DfjPPVGy9yqucq32PBwJw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix system hang at qca99x0 probe on x86 platform
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
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Valo,
 Kalle" <kvalo@qca.qualcomm.com>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, Ben Greear <greearb@candelatech.com>, "nbd@nbd.name" <nbd@nbd.name>

Hi,

dma coherent doesn't /have/ to mean "low 32 bits". It's just supposed
to mean "try really hard to use uncached memory on platforms that
support it."

The ath10k hardware (at least what I've played with thus far) is all
32 bit DMA hardware, not 64 bit, so it can't be handed 64 bit memory -
contiguous or otherwise.

So, if dma coherent on linux means 32 bit only physmem, great.

Now, it also turns out that various platforms that say they do
coherent memory these days do "mostly coherent", and you still need
some flush/sync ops..


-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
