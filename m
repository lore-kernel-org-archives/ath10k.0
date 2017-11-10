Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.toke.dk ([52.28.52.200])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eCz9E-00029h-9n
 for ath10k@lists.infradead.org; Fri, 10 Nov 2017 02:34:59 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: RE: [Make-wifi-fast] [PATCH] ath10k: Re-enable TXQs for all devices
In-Reply-To: <a7b75767d01b46ef818f86dbd0c657a8@NALASEXR01H.na.qualcomm.com>
References: <20171109071945.11033-1-toke@toke.dk>
 <6112ae948ba2409da27709d01da567eb@NALASEXR01H.na.qualcomm.com>
 <87k1yzq9i8.fsf@toke.dk>
 <CAA93jw6yw5=ALMdRaRrGU9uySmov9HwM-mr2npRbzsSxHgSAGw@mail.gmail.com>
 <a7b75767d01b46ef818f86dbd0c657a8@NALASEXR01H.na.qualcomm.com>
Date: Fri, 10 Nov 2017 11:33:53 +0900
Message-ID: <87h8u2rhf2.fsf@toke.dk>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, Dave Taht <dave.taht@gmail.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: "make-wifi-fast@lists.bufferbloat.net" <make-wifi-fast@lists.bufferbloat.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> Agree.. Even I am not fan of that patch in ath10k. IIRC Michal pushed
> this change as temp one and planned to revert it once it is fixed in
> stack or in driver.
>
> I thought Eric change in fq_codel is meant only for fatty udp flows.
> Forgive my ignorance.

It is, mostly. There's a separate possible issue with TCP performance
that we're looking into, but that is unrelated to TXQs.

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
