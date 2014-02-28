Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22b.google.com ([2607:f8b0:400c:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJGfY-0008Aw-KS
 for ath10k@lists.infradead.org; Fri, 28 Feb 2014 06:11:37 +0000
Received: by mail-ve0-f171.google.com with SMTP id cz12so283796veb.16
 for <ath10k@lists.infradead.org>; Thu, 27 Feb 2014 22:10:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8738j4ftep.fsf_-_@kamboji.qca.qualcomm.com>
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <871tzq210z.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmomkfvaTm+=Du8FqCC=b=UG2d=8ixUK2tUsFj4_dsRL4Pg@mail.gmail.com>
 <CAHqTa-3O0_5OcTKNi0KLa--63ZYO4o7qK=VsN7Bsyi0nX+rF7g@mail.gmail.com>
 <CAHqTa-2kUJ1hrc8c2Kqy+cGexPJdisTMuUTH8WQ5KqV9qURwMw@mail.gmail.com>
 <8738j4ftep.fsf_-_@kamboji.qca.qualcomm.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Thu, 27 Feb 2014 22:10:31 -0800
Message-ID: <CAHqTa-0L5oJKSuJ9XEsprKJciMsEa5aFfLpaBLZ4Jsxw59XAmQ@mail.gmail.com>
Subject: Re: Missing memory barriers
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, Feb 27, 2014 at 7:48 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Avery Pennarun <apenwarr@gmail.com> writes:
>> - there are definitely some missing memory barriers in here; in a few
>> cases you can clearly see a write getting done before the read that
>> came before it.  Looking at the definitions for iowrite32 and
>> ioread32, and for rmb() and wmb(), we can see that the use of rmb()
>> and wmb() do not work properly (at least on ARM) when you care about
>> the ordering between reads and writes.  However, I don't think this
>> actually causes the problem.
>
> Can you tell more about this, please? Did you find out where we are
> actually doing it wrong?

Sure.  It's been a while since I wrote the above and it was with an
older version of the ath10k driver, but basically what happens is as
follows.

First look in arch/arm/include/asm/system.h.  Note that in various
situations, rmb() and wmb() may be defined identically or may do
slightly different things.  On the architecture I'm using, I'm fairly
sure they are defined identically.  Results may be slightly different
if they are not.

Next look at arch/arm/include/asm/io.h at the definitions for
iowrite32 and ioread32.  In pseudocode they are roughly like this:

iowrite32:
   wmb();
   write();
ioread32:
   read();
   rmb();

So for example in ath10k_pci_device_reset (or ath10k_pci_cold_reset if
you have that set of patches), there is a code sequence that looks
something like this:

- write the reset register
- loop:
  - read the status

I noticed that when the device crashes the PCIe bus due to voltage
problems, writing the reset register is not what causes the PCIe host
to notice an abort - it's reading the status afterward.  While
investigating this, I hooked up a PCIe bus analyzer and found that it
was reading the status *before* writing the reset.  That's because the
above expands out to:

   wmb()
   write(reset)
   read(status)
   rmb()

which the CPU or compiler is free to reorder as:

  wmb()
  read(status)
  write(reset)
  rmb()

And in fact, it *wants* to do this reordering because there is a
conditional that depends on the result of read(status), so with the
reordering, the CPU pipeline can think about that conditional while
executing write(reset) in parallel.  And this is indeed what happens,
according to my PCIe bus trace.

The way the ARM iowrite/ioread barriers are set up, it works as
expected when you read before writing, but the first read after a
write can be reordered.  If you want to be careful about this, I think
you'd have to insert an extra barrier by hand.

The bad news is that, while inserting the extra barrier did clean up
my bus trace, it didn't fix the underlying problem.  When the chip
dies due to this cold reset operation, the inability to read the
status register is only a symptom, not the cause.  In the end it's
harmless that we end up doing the first read before the write
operation finishes.  What happens isn't what the code says, but I
don't think that matters in this case.

(I think my main line of investigation at the time was in the first
read after the command was sent to take the chip *out* of reset.  I
thought maybe reading while it was in reset was the underlying cause
of the abort.  No such luck.)

Hope this helps.

Have fun,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
