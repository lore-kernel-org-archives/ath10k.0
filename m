Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAJ66-0002Q8-Tq
 for ath10k@lists.infradead.org; Wed, 10 Oct 2018 18:20:41 +0000
Received: by mail-pf1-x441.google.com with SMTP id f29-v6so3043955pff.5
 for <ath10k@lists.infradead.org>; Wed, 10 Oct 2018 11:20:28 -0700 (PDT)
Date: Wed, 10 Oct 2018 11:20:25 -0700
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH V2] ath10k: allocate small size dma memory in
 ath10k_pci_diag_write_mem
Message-ID: <20181010182023.GA26746@ban.mtv.corp.google.com>
References: <1539171269-23944-1-git-send-email-cjhuang@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1539171269-23944-1-git-send-email-cjhuang@codeaurora.org>
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
To: Carl Huang <cjhuang@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi Carl,

On Wed, Oct 10, 2018 at 07:34:29PM +0800, Carl Huang wrote:
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -1071,10 +1071,9 @@ int ath10k_pci_diag_write_mem(struct ath10k *ar, u32 address,
>  	struct ath10k_ce *ce = ath10k_ce_priv(ar);
>  	int ret = 0;
>  	u32 *buf;
> -	unsigned int completed_nbytes, orig_nbytes, remaining_bytes;
> +	unsigned int completed_nbytes, alloc_nbytes, remaining_bytes;
>  	struct ath10k_ce_pipe *ce_diag;
>  	void *data_buf = NULL;
> -	u32 ce_data;	/* Host buffer address in CE space */
>  	dma_addr_t ce_data_base = 0;
>  	int i;
>  

...

> @@ -1128,7 +1127,7 @@ int ath10k_pci_diag_write_mem(struct ath10k *ar, u32 address,
>  		 * Request CE to send caller-supplied data that
>  		 * was copied to bounce buffer to Target(!) address.
>  		 */
> -		ret = ath10k_ce_send_nolock(ce_diag, NULL, (u32)ce_data,
> +		ret = ath10k_ce_send_nolock(ce_diag, NULL, (u32)ce_data_base,

The (u32) cast isn't necessary, is it? ath10k_ce_send_nolock() takes a
dma_addr_t for the 3rd argument.

Incidentally, that'd probably help if you start supporting PCI devices
with >32-bit addressing.

Brian

>  					    nbytes, 0, 0);
>  		if (ret != 0)
>  			goto done;
...

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
