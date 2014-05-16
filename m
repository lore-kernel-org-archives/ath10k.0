Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlHJU-0004L0-TP
 for ath10k@lists.infradead.org; Fri, 16 May 2014 12:32:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/3] ath10k: add explicit memory barrier for ring index
 update
References: <1400158139-13836-1-git-send-email-michal.kazior@tieto.com>
 <1400158139-13836-4-git-send-email-michal.kazior@tieto.com>
Date: Fri, 16 May 2014 15:32:11 +0300
In-Reply-To: <1400158139-13836-4-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 15 May 2014 14:48:59 +0200")
Message-ID: <87d2fd7vlg.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, apenwarr@gmail.com

Michal Kazior <michal.kazior@tieto.com> writes:

> Avery reported he had some issues related to
> instructions being re-ordered on his ARM test
> system resulting in firmware crashes.
>
> This makes sure that data is in place before CE
> ring index is updated telling firmware it can
> fetch the data.
>
> Reported-By: Avery Pennarun <apenwarr@gmail.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---

[...]

> --- a/drivers/net/wireless/ath/ath10k/ce.c
> +++ b/drivers/net/wireless/ath/ath10k/ce.c
> @@ -63,6 +63,7 @@ static inline void ath10k_ce_dest_ring_write_index_set(struct ath10k *ar,
>  						       u32 ce_ctrl_addr,
>  						       unsigned int n)
>  {
> +	mb();
>  	ath10k_pci_write32(ar, ce_ctrl_addr + DST_WR_INDEX_ADDRESS, n);
>  }
>  
> @@ -76,6 +77,7 @@ static inline void ath10k_ce_src_ring_write_index_set(struct ath10k *ar,
>  						      u32 ce_ctrl_addr,
>  						      unsigned int n)
>  {
> +	mb();
>  	ath10k_pci_write32(ar, ce_ctrl_addr + SR_WR_INDEX_ADDRESS, n);
>  }

I see two new checkpatch warnings:

drivers/net/wireless/ath/ath10k/ce.c:66: CHECK: memory barrier without comment
drivers/net/wireless/ath/ath10k/ce.c:80: CHECK: memory barrier without comment

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
