Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vb0-x229.google.com ([2607:f8b0:400c:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8FhZ-00081p-Ky
 for ath10k@lists.infradead.org; Tue, 28 Jan 2014 20:56:10 +0000
Received: by mail-vb0-f41.google.com with SMTP id g10so617862vbg.28
 for <ath10k@lists.infradead.org>; Tue, 28 Jan 2014 12:55:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAJ-VmokorbJ2iU4rGNYdRj+A22NR9cV-5h-tDN0pD2FCurZDpA@mail.gmail.com>
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <CAJ-VmokorbJ2iU4rGNYdRj+A22NR9cV-5h-tDN0pD2FCurZDpA@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 28 Jan 2014 15:55:28 -0500
Message-ID: <CAHqTa-1e2pBU+UGZLOUMPPiOBU8wYMeystzC9FaRzxeMyUCEjw@mail.gmail.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

On Tue, Jan 28, 2014 at 3:28 PM, Adrian Chadd <adrian@freebsd.org> wrote:
> Can you put a sleep in before the initial write?

I've tried adding printks and various things before the write, and it
didn't seem to help.

I also noticed that iowrite32() contains a write barrier, and
ioread32() contains a read barrier, but they're structured like this:

iowrite32() { wmb(); write32(); }
ioread32() { read32(); rmb(); }

Which means that actually the write32() and read32() do not have
barriers between them.  I think that might be a problem, but adding
the barriers didn't help either.

> There are hardware bugs that are.. delicate. What you should do is find what
> kind of reporting you can pull out of the pcie endpoint the nic is connected
> to in order to see why it threw a fatal error. Then at least we can poke it
> further.

Ok.  I'm going to see if I can hunt down a PCIe bus analyzer and find
out what the deal is.

> Its also worth asking the qca hardware team about this. They'll likely want
> to know what the pcie errors are so please figure that out.

Thanks for the advice!

Are other people not seeing this?  Or are they just trying not to
crash the firmware so they don't have to care? :)

Thanks,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
