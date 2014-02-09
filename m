Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-f170.google.com ([209.85.220.170])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCPKW-0008En-11
 for ath10k@lists.infradead.org; Sun, 09 Feb 2014 08:01:33 +0000
Received: by mail-vc0-f170.google.com with SMTP id hu8so3928111vcb.15
 for <ath10k@lists.infradead.org>; Sun, 09 Feb 2014 00:01:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHqTa-3O0_5OcTKNi0KLa--63ZYO4o7qK=VsN7Bsyi0nX+rF7g@mail.gmail.com>
References: <CAHqTa-3o40ROJQ1=698CVMS=+nxNGT+i98nTU+sNBBG1fSHUzA@mail.gmail.com>
 <871tzq210z.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmomkfvaTm+=Du8FqCC=b=UG2d=8ixUK2tUsFj4_dsRL4Pg@mail.gmail.com>
 <CAHqTa-3O0_5OcTKNi0KLa--63ZYO4o7qK=VsN7Bsyi0nX+rF7g@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Sun, 9 Feb 2014 03:00:45 -0500
Message-ID: <CAHqTa-2kUJ1hrc8c2Kqy+cGexPJdisTMuUTH8WQ5KqV9qURwMw@mail.gmail.com>
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

On Wed, Jan 29, 2014 at 9:41 PM, Avery Pennarun <apenwarr@gmail.com> wrote:
> Still chasing around some people to get a PCIe bus analyzer set up.

Okay, I finally managed to get enough parts put together to look at
the PCIe bus.  To make things a little more clear, I added a macro
that does essentially:

   pci_write_config_dword(0, 0x80000000 | __LINE__)
   mdelay(1);
   pci_write_config_dword(0, __LINE__)

...at various points in the code.  This way I can see precisely what
was the most recent PCIe transaction before the crash.

I'm not super familiar with PCIe, but what I think I'm seeing is:

- the firmware does not need to be loaded yet; sometimes I can crash
it just by doing a cold reset right at driver load time.  So the good
news is, the firmware code is not related.

- the crash is always in ath10k_pci_device_reset

- there are definitely some missing memory barriers in here; in a few
cases you can clearly see a write getting done before the read that
came before it.  Looking at the definitions for iowrite32 and
ioread32, and for rmb() and wmb(), we can see that the use of rmb()
and wmb() do not work properly (at least on ARM) when you care about
the ordering between reads and writes.  However, I don't think this
actually causes the problem.

- the crash happens after writing the 1 to SBC_GLOBAL_RESET_ADDRESS.
The write gets an ACK from the device, so there are no interrupted
PCIe transactions.

- after writing that 1, the PCI bus is fine for ~272 usec.  I can see
the first pci_write_config_dword in my macro above, but it crashes
during the mdelay(1) and the second pci_write_config doesn't go
through.

- ~272 usec after the write, I see TS1 packets getting transmitted at
maximum speed in both directions.  Does this mean the connection is
retraining?

- 50 usec after the first TS1 packet (a surprisingly precise number),
I see an EIOS packet sent in the downstream direction.  After that,
they appear every 25 usec.  However, they *all* show invalid parity
bits according to the PCI analyzer.

Does this ring a bell for anyone?  I think I can also export the
traces as csv in case someone wants to look at them.

Thanks!

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
