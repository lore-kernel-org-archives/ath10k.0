Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtpimr.rockwellcollins.com ([205.175.225.240]
 helo=secvs01.rockwellcollins.com)
 by merlin.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1euJdV-0006W0-QC
 for ath10k@lists.infradead.org; Fri, 09 Mar 2018 15:08:46 +0000
Received: by mail-yb0-f199.google.com with SMTP id c3-v6so5362883ybl.14
 for <ath10k@lists.infradead.org>; Fri, 09 Mar 2018 07:08:31 -0800 (PST)
MIME-Version: 1.0
From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Fri, 9 Mar 2018 09:08:29 -0600
Message-ID: <CAM=7fbewAQ7tW7J4fbq811a4++H+RMz0oxC9KiOsZnPFFQcuNQ@mail.gmail.com>
Subject: DMA issues on PowerPC64
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
To: ath10k@lists.infradead.org

Hi all,

Some background information first.  I transitioned a build from 32 bit
to 64 bit and discovered my wifi modules no longer work.  I am using
fsl-v2.0-1703 on a qoriq t1042.  I sourced the problem to DMA mapping
errors and found that it was trying to map addresses in regions not
allowed by the kernel.

ath10k_pci 0001:01:00.0: unable to get target info from device
ath10k_pci 0001:01:00.0: could not get target info (5)
ath10k_pci 0001:01:00.0: could not probe fw (5)


I discovered that if I limited my memory from the actual 8GB present
down to just 2GB with the bootarg mem=2048M, the ath10k modules
worked.

So I started poking around in ath10k/pci.c and noticed that if I ORed
the regions specified in the memory allocations with GFP_DMA, I could
get rid of the initial dma mapping errors.  A couple of examples are
below.

skb = __dev_alloc_skb(pipe->buf_sz, GFP_DMA | GFP_ATOMIC);
treq = kmemdup(req, req_len, GFP_DMA | GFP_KERNEL);


But then came across these failures which I have yet to sort out.

ath10k_pci 0001:01:00.0: failed to connect htt (-5)
ath10k_pci 0001:01:00.0: could not init core (-5)
ath10k_pci 0001:01:00.0: could not probe fw (-5)


I am wondering if anyone else has come across this issue and solved it
or if somehow this is just an issue on ppc64 and I am somehow the only
one in that use case.  Unfortunately because of the qoriq t1042, I am
on the latest kernel I can use via the latest available sdk for my
processor which is linux kernel version 4.1.35-rt41

Thank you,
Jared

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
