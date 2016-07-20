Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x22b.google.com ([2607:f8b0:4001:c0b::22b])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPutN-0004Qs-R9
 for ath10k@lists.infradead.org; Wed, 20 Jul 2016 17:02:42 +0000
Received: by mail-it0-x22b.google.com with SMTP id f6so55444272ith.0
 for <ath10k@lists.infradead.org>; Wed, 20 Jul 2016 10:02:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnN1EVGBu0J5Y7-z2=uqsG8rXS0Lvs7VAoeawv9MGuFyQ@mail.gmail.com>
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>
 <e05dcb58-1cb1-a33a-31bb-b8ba1edf1363@dd-wrt.com>
 <fa3eab06-28f0-e5d4-2e92-770134b49dfa@dd-wrt.com>
 <1467218124941.40575@qti.qualcomm.com>
 <CA+BoTQkepLz55Vdr7OuMnPQPLKq_+vjZi=m2Y9rHLRgBZPsWOw@mail.gmail.com>
 <1468941948774.87860@qti.qualcomm.com>
 <CAJ-Vmon1duBNcWhjaNdANYFfd3hwQUYYHrmx7LRZvT-Ec2x1Cg@mail.gmail.com>
 <578E5AFA.4000908@candelatech.com>
 <CA+BoTQ=QMPUtY64ELCToZLcSrCPQdG=2Eg4FrsULeeDg9sFPYA@mail.gmail.com>
 <CAJ-Vmok95tiLzmnfiBnnOLQK9hXW2DfjPPVGy9yqucq32PBwJw@mail.gmail.com>
 <CA+BoTQ=ehuXpcJUOeSscLKzX9T=hZyp5i2G9GoxTVX=LAg_4hA@mail.gmail.com>
 <CAJ-Vmo=d=PgUu_AYT1C82AJcnUxKUo_VYMn_b1QF8M_T+5KpkA@mail.gmail.com>
 <CA+BoTQnN1EVGBu0J5Y7-z2=uqsG8rXS0Lvs7VAoeawv9MGuFyQ@mail.gmail.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Wed, 20 Jul 2016 10:02:19 -0700
Message-ID: <CAJ-VmomcD8FgA34z3OFKZvc5yq8EsHOTqP=Lg-6gFOAcWys8og@mail.gmail.com>
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

The "right" way for the target CPU to interact with host CPU memory
(and vice versa, for mostly what it's worth) is to have the copy
engine copy (ie, "DMA") the pieces between them. This may be for
diagnostic purposes, but it's not supposed to be used like this for
doing wifi data exchange, right? :-P

Now, there /may/ be some alignment hilarity in various bits of code
and/or hardware. Eg, Merlin (AR9280) requires its descriptors to be
within a 4k block - the code to iterate through the descriptor
physical address space didn't do a "val = val + offset", it did
something in verilog like "val = (val & 0xffffc000) | (offset &
0x3fff)". This meant if you allocated a descriptor that started just
before the end of a 4k physmem aligned block, you'd end up with
exciting results. I don't know if there are any situations like this
in the ath10k hardware, but I'm sure there will be some gotchas
somewhere.

In any case, if ath10k is consuming too much bounce buffers, the calls
to allocate memory aren't working right and should be restricted to 32
bit addresses. Whether that's by using the DMA memory API (before it's
mapped) or passing in GFP_DMA32 is a fun debate.

(My test hardware arrived, so I'll test this all out today on
Peregrine-v2 and see if the driver works.)



-adrian




-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
