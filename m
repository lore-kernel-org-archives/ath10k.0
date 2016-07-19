Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x229.google.com ([2607:f8b0:4001:c0b::229])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPYNl-0003v7-HY
 for ath10k@lists.infradead.org; Tue, 19 Jul 2016 17:00:34 +0000
Received: by mail-it0-x229.google.com with SMTP id f6so19984367ith.0
 for <ath10k@lists.infradead.org>; Tue, 19 Jul 2016 10:00:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <578E5AFA.4000908@candelatech.com>
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>
 <e05dcb58-1cb1-a33a-31bb-b8ba1edf1363@dd-wrt.com>
 <fa3eab06-28f0-e5d4-2e92-770134b49dfa@dd-wrt.com>
 <1467218124941.40575@qti.qualcomm.com>
 <CA+BoTQkepLz55Vdr7OuMnPQPLKq_+vjZi=m2Y9rHLRgBZPsWOw@mail.gmail.com>
 <1468941948774.87860@qti.qualcomm.com>
 <CAJ-Vmon1duBNcWhjaNdANYFfd3hwQUYYHrmx7LRZvT-Ec2x1Cg@mail.gmail.com>
 <578E5AFA.4000908@candelatech.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Tue, 19 Jul 2016 10:00:11 -0700
Message-ID: <CAJ-VmokHgMVn530PfJS_KEwnUiYBvebOAkP72k319b4BUkYRUg@mail.gmail.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Valo,
 Kalle" <kvalo@qca.qualcomm.com>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, "nbd@nbd.name" <nbd@nbd.name>

Some more test hardware arrived on Friday, so I'll whack a peregrine
v2 NIC in this afternoon and test out my changes.

I'll send a pull request with the DMA32 changes today or tomorrow.

(If someone would like to send me some beeliner/cascade hardware or
arrange something to be picked up in San Jose then I can test on that,
otherwise it'll have to wait; I don't have easy access to anything
else besides dakota and that is being used for other bring-up
activities atm.)



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
