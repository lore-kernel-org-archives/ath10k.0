Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGDmT-0007hH-Tz
 for ath10k@lists.infradead.org; Tue, 27 Jan 2015 21:34:42 +0000
Received: by mail-ig0-f177.google.com with SMTP id z20so7361233igj.4
 for <ath10k@lists.infradead.org>; Tue, 27 Jan 2015 13:34:19 -0800 (PST)
Date: Tue, 27 Jan 2015 16:33:49 -0500
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [PATCH] ath10k: Replace ioread with wmb for data sync
Message-ID: <20150127213349.GA24933@localhost>
References: <1422311118-11320-1-git-send-email-poh@qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1422311118-11320-1-git-send-email-poh@qca.qualcomm.com>
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

On Mon, Jan 26, 2015 at 02:25:18PM -0800, Peter Oh wrote:
> Using ioread() to perform data sync is excessive.
> Use compact API, wmb(), that intended to be used for the case.
> It reduces total 14 CPU clocks per interrupt.

Hi,

>  	ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS + PCIE_INTR_CLR_ADDRESS,
>  			   PCIE_INTR_FIRMWARE_MASK | PCIE_INTR_CE_MASK_ALL);
>  
> -	/* IMPORTANT: this extra read transaction is required to
> -	 * flush the posted write buffer. */
> -	(void)ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS +
> -				PCIE_INTR_ENABLE_ADDRESS);
> +	/* invoke data sync barrier */
> +	wmb();
>  }

I am no expert in arcane PCI matters, but that looks suspicious to me.  I seem
to recall wmb() only enforced ordering, and maybe not even memory-IO ordering
on all platforms.  If you want to disable an irq, it really seems like you
would want to flush posted writes so you know the hardware has seen it.

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
