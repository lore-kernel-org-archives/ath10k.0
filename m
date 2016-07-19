Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPWuj-00073O-8U
 for ath10k@lists.infradead.org; Tue, 19 Jul 2016 15:26:29 +0000
From: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix system hang at qca99x0 probe on x86 platform
Date: Tue, 19 Jul 2016 15:25:49 +0000
Message-ID: <1468941948774.87860@qti.qualcomm.com>
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>
 <e05dcb58-1cb1-a33a-31bb-b8ba1edf1363@dd-wrt.com>
 <fa3eab06-28f0-e5d4-2e92-770134b49dfa@dd-wrt.com>
 <1467218124941.40575@qti.qualcomm.com>,
 <CA+BoTQkepLz55Vdr7OuMnPQPLKq_+vjZi=m2Y9rHLRgBZPsWOw@mail.gmail.com>
In-Reply-To: <CA+BoTQkepLz55Vdr7OuMnPQPLKq_+vjZi=m2Y9rHLRgBZPsWOw@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, "nbd@nbd.name" <nbd@nbd.name>

On June 30, 2016 12:39 PM, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 29 June 2016 at 18:35, Manoharan, Rajkumar <rmanohar@qti.qualcomm.com>=
 wrote:
>>>> Am 29.06.2016 um 16:04 schrieb Sebastian Gottschall:
>>>> this fix will crash QCA9980 on QCA IPQ8064 cpu based systems.
>>>> so please rework it, or leave it out.
>>>> note:
>>>> maybe the limit of 256kb is too low for that card
>>>>
>>> by the way. 512 works
>
> I think this suggests the problem isn't about memory chunk size limit
> per se but some kind of bug in address/offset logic in fw or hw.
> =

> DMA coherent and single-map addresses use completely different ranges
> in many cases. Perhaps some MSBs are not properly handled in fw or hw.
> I recall there is a magic macro through which target device accesses
> host memory so maybe that's a good place to look to better understand
> the problem?
> =

Micha=B3,

Could you please shed some light on this issue? It seems this issue is popp=
ing up
more frequently and there are multiple threads for this issue.

"Anyone brought up 9984 NIC on x86-64?"
"AR9882 IOMMU faults"

> I recall Ben mentioned he worked around the problem by enabling
> IOMMU/VT-d on his system. This could either prevent the device from
> doing bad things or maybe changed DMA address ranges that are handed
> out to the driver effectively or changed PCI controller behavior in
> some way.
>
>> Thanks a lot Sebastian. Let me confirm the same on x86 and will update t=
he change.
> =

> Just changing the memory chunk size limit blindly is bad and
> Sebastian's crash has proven it. 512 may seem to work now but it may
> fail with a other 10.4 firmware revisions or make x86 hang in other
> cases.
> =

Even with current logic, If the memory chunk allocation fails for bigger si=
ze, then it tries
to allocate smaller chunks. So If smaller chunks causes unexpected behaviou=
r, it is even
applicable to existing logic. no?

-Rajkumar
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
