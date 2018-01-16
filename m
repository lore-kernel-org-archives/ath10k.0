Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ebSbb-0006Hf-T7
 for ath10k@lists.infradead.org; Tue, 16 Jan 2018 14:52:54 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [bug report] ath10k: add memory dump support for QCA6174/QCA9377
References: <20180115100043.poxnok4cduzz6mbj@mwanda>
Date: Tue, 16 Jan 2018 16:52:37 +0200
In-Reply-To: <20180115100043.poxnok4cduzz6mbj@mwanda> (Dan Carpenter's message
 of "Mon, 15 Jan 2018 13:00:43 +0300")
Message-ID: <87zi5detze.fsf@kamboji.qca.qualcomm.com>
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
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alanliu@qca.qualcomm.com, ath10k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> Hello Alan Liu,
>
> The patch 703f261dd77f: "ath10k: add memory dump support for
> QCA6174/QCA9377" from Dec 22, 2017, leads to the following static
> checker warning:
>
> 	drivers/net/wireless/ath/ath10k/pci.c:1481 ath10k_pci_dump_memory_section()
> 	warn: unsigned 'mem_region->section_table.size' is never less than zero.
>
> drivers/net/wireless/ath/ath10k/pci.c
>   1470  static int ath10k_pci_dump_memory_section(struct ath10k *ar,
>   1471                                            const struct ath10k_mem_region *mem_region,
>   1472                                            u8 *buf, size_t buf_len)
>   1473  {
>   1474          const struct ath10k_mem_section *cur_section, *next_section;
>   1475          unsigned int count, section_size, skip_size;
>   1476          int ret, i, j;
>   1477  
>   1478          if (!mem_region || !buf)
>   1479                  return 0;
>   1480  
>   1481          if (mem_region->section_table.size < 0)
>                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Impossible condition

Should be fixed by the commit below which I applied 20 minutes ago :)

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath-next&id=95f27a51ee02fdd9e7afc06f090c7171673a79ac

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
