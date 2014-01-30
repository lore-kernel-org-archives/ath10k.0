Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22b.google.com ([2607:f8b0:400c:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8haQ-00008v-51
 for ath10k@lists.infradead.org; Thu, 30 Jan 2014 02:42:38 +0000
Received: by mail-vc0-f171.google.com with SMTP id le5so1674205vcb.2
 for <ath10k@lists.infradead.org>; Wed, 29 Jan 2014 18:42:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAJ-VmomkfvaTm+=Du8FqCC=b=UG2d=8ixUK2tUsFj4_dsRL4Pg@mail.gmail.com>
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <871tzq210z.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmomkfvaTm+=Du8FqCC=b=UG2d=8ixUK2tUsFj4_dsRL4Pg@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Wed, 29 Jan 2014 21:41:53 -0500
Message-ID: <CAHqTa-3O0_5OcTKNi0KLa--63ZYO4o7qK=VsN7Bsyi0nX+rF7g@mail.gmail.com>
Subject: Re: ath10k driver crashes whenever firmware crashes on ARM SoC
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Wed, Jan 29, 2014 at 1:44 PM, Adrian Chadd <adrian@freebsd.org> wrote:
> Well, the problem is more likely that the PCIe bus doesn't come back
> correctly, and the next IO write hits a PCI bus error.
>
> What about seeing if you can detect the PCIe error before it's a fatal
> one (hence my email earlier about trying to decode this stuff) and
> then reset the PCIe port from the PCI side?

Still chasing around some people to get a PCIe bus analyzer set up.

I did try a bit with resetting the PCI bus, but there's a lot of ways
that can get messy (turns out PCI bus controllers have a lot of
registers that get reset when you reset them, who knew?), and I didn't
manage to work around all of them.

My guess however is that the PCIe bus itself is probably not broken...
but the ath10k device may not be responding to it anymore when this
problem happens.

One thing I noticed is that if I reboot my device (which completely
resets the PCI bus), it comes back and works.  So *somehow* things are
getting cleaned up without actually cutting power.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
