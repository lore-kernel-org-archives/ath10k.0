Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eCySf-00014g-Uy
 for ath10k@lists.infradead.org; Fri, 10 Nov 2017 01:50:28 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: RE: [Make-wifi-fast] [PATCH] ath10k: Re-enable TXQs for all devices
Date: Fri, 10 Nov 2017 01:49:55 +0000
Message-ID: <a7b75767d01b46ef818f86dbd0c657a8@NALASEXR01H.na.qualcomm.com>
References: <20171109071945.11033-1-toke@toke.dk>
 <6112ae948ba2409da27709d01da567eb@NALASEXR01H.na.qualcomm.com>
 <87k1yzq9i8.fsf@toke.dk>
 <CAA93jw6yw5=ALMdRaRrGU9uySmov9HwM-mr2npRbzsSxHgSAGw@mail.gmail.com>
In-Reply-To: <CAA93jw6yw5=ALMdRaRrGU9uySmov9HwM-mr2npRbzsSxHgSAGw@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Dave Taht <dave.taht@gmail.com>, =?utf-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, Kalle Valo <kvalo@codeaurora.org>
Cc: "make-wifi-fast@lists.bufferbloat.net" <make-wifi-fast@lists.bufferbloat.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> >
> > The issue that seems to point to has been fixed a while ago; I'll send
> > and updated patch with a better commit message (also forgot to cc the
> > ath10k list, I see).
> >
> > -Toke
> 
> Hmm. I remember that thread. I thought we'd basically resolved that issue (45%
> of the time spent in fq_codel_drop under udp flood), back then, with eric adding
> the batch drop fix to fq_codel itself:
> 
> See commit: https://osdn.net/projects/android-
> x86/scm/git/kernel/commits/9d18562a227874289fda8ca5d117d8f503f1dcca
> 
> which fixed up the problem beautifully:
> 
> https://lists.bufferbloat.net/pipermail/make-wifi-fast/2016-May/000590.html
> 
> So if we've been carrying this darn patch for the ath10k vs something that we'd
> actually fixed elsewhere in the stack, for over a year, sigh.
>
Dave,

Agree.. Even I am not fan of that patch in ath10k. IIRC Michal pushed this
change as temp one and planned to revert it once it is fixed in stack or in driver.

I thought Eric change in fq_codel is meant only for fatty udp flows. Forgive my ignorance.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
