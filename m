Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMXei-00014O-SW
 for ath10k@lists.infradead.org; Wed, 27 Aug 2014 07:28:33 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 3/3] ath10k: make target endianess more explicit
References: <1408961963-3682-1-git-send-email-michal.kazior@tieto.com>
 <1408961963-3682-4-git-send-email-michal.kazior@tieto.com>
Date: Wed, 27 Aug 2014 10:28:05 +0300
In-Reply-To: <1408961963-3682-4-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 25 Aug 2014 12:19:23 +0200")
Message-ID: <874mwyxugq.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Some copy engine structures are target specific
> and are uploaded to the device during
> init/configuration.
>
> This also cleans up a bit diag_mem_read/write
> implicit byteswap mess leaving only
> diag_access_read/write with an implicit endianess
> byteswap.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

>  /* Write 4B data to Target memory or register */
>  static int ath10k_pci_diag_write_access(struct ath10k *ar, u32 address,
>  					u32 data)
>  {
>  	/* Assume range doesn't cross this boundary */
>  	if (address >= DRAM_BASE_ADDRESS)
> -		return ath10k_pci_diag_write_mem(ar, address, &data,
> -						 sizeof(u32));
> +		return ath10k_pci_diag_write32(ar, address, data);

Nothing wrong with your patch, but I really despise functions with split
personality like this one. The caller should know which area it's
writing to. And we have similar stuff in ath10k_pci_diag_read_mem() as
well:

	/*
	 * This code cannot handle reads to non-memory space. Redirect to the
	 * register read fn but preserve the multi word read capability of
	 * this fn
	 */
	if (address < DRAM_BASE_ADDRESS) {
		if (!IS_ALIGNED(address, 4) ||
		    !IS_ALIGNED((unsigned long)data, 4))
			return -EIO;

		while ((nbytes >= 4) &&  ((ret = ath10k_pci_diag_read_access(
					   ar, address, (u32 *)data)) == 0)) {
			nbytes -= sizeof(u32);
			address += sizeof(u32);
			data += sizeof(u32);
		}
		return ret;
	}


Can you guess what's the idea behind this? I would prefer that we get
rid of all the ugly _access() functions in pci.c.

-- 
Kalle Valo



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
