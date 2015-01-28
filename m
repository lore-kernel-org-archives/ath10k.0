Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGKHK-0001s4-GR
 for ath10k@lists.infradead.org; Wed, 28 Jan 2015 04:30:59 +0000
Received: by mail-ig0-f182.google.com with SMTP id r10so8937692igi.3
 for <ath10k@lists.infradead.org>; Tue, 27 Jan 2015 20:30:36 -0800 (PST)
Date: Tue, 27 Jan 2015 23:30:05 -0500
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [PATCH] ath10k: Replace ioread with wmb for data sync
Message-ID: <20150128043005.GB24933@localhost>
References: <1422311118-11320-1-git-send-email-poh@qca.qualcomm.com>
 <20150127213349.GA24933@localhost>
 <54C824DC.5080804@qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54C824DC.5080804@qca.qualcomm.com>
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
To: Peter Oh <poh@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, Jan 27, 2015 at 03:53:00PM -0800, Peter Oh wrote:
> >>-	/* IMPORTANT: this extra read transaction is required to
> >>-	 * flush the posted write buffer. */
> >>-	(void)ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS +
> >>-				PCIE_INTR_ENABLE_ADDRESS);
> >>+	/* invoke data sync barrier */
> >>+	wmb();
> >>  }
> >I am no expert in arcane PCI matters, but that looks suspicious to me.  I seem
> >to recall wmb() only enforced ordering, and maybe not even memory-IO ordering
> >on all platforms.  If you want to disable an irq, it really seems like you
> >would want to flush posted writes so you know the hardware has seen it.
> enforced ordering is happened by flush write buffer and wmb is
> commonly used to flush write buffer.
> so that wmb guarantees ordering by flush write buffer. That's why
> it's called a memory barrier.

Ok, sure, but I/O ordering two different writes, and ensuring device
has seen a posted write, are related but different things, no?  So if
you are disabling an interrupt and want to be really sure interrupts
are off when function returns, I think you still want the read.

Anyway, it's your driver, just pointing out that the "IMPORTANT"
read might still be important to someone.

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
