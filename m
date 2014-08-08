Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFgk5-0003Ok-N4
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 09:45:46 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC 3/3] ath10k: make target endianess more explicit
References: <1407489735-28091-1-git-send-email-michal.kazior@tieto.com>
 <1407489735-28091-4-git-send-email-michal.kazior@tieto.com>
Date: Fri, 8 Aug 2014 12:45:12 +0300
In-Reply-To: <1407489735-28091-4-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 8 Aug 2014 11:22:15 +0200")
Message-ID: <87lhqzz55j.fsf@kamboji.qca.qualcomm.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

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

> @@ -567,8 +562,17 @@ static int ath10k_pci_diag_read_access(struct ath10k *ar, u32 address,
>  				       u32 *data)
>  {
>  	/* Assume range doesn't cross this boundary */
> -	if (address >= DRAM_BASE_ADDRESS)
> -		return ath10k_pci_diag_read_mem(ar, address, data, sizeof(u32));
> +	if (address >= DRAM_BASE_ADDRESS) {
> +		__le32 val;
> +		int ret;

For simplicity I would prefer to have variable declaration in the
beginning of the function.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
