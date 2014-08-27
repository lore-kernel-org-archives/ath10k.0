Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMXd5-0007hl-AH
 for ath10k@lists.infradead.org; Wed, 27 Aug 2014 07:26:51 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 3/3] ath10k: make target endianess more explicit
References: <1408961963-3682-1-git-send-email-michal.kazior@tieto.com>
 <1408961963-3682-4-git-send-email-michal.kazior@tieto.com>
Date: Wed, 27 Aug 2014 10:26:24 +0300
In-Reply-To: <1408961963-3682-4-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 25 Aug 2014 12:19:23 +0200")
Message-ID: <878umaxujj.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

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

>  static int ath10k_pci_diag_read32(struct ath10k *ar, u32 address, u32 *value)
>  {
> -	return ath10k_pci_diag_read_mem(ar, address, value, sizeof(u32));
> +	__le32 val = 0;
> +	int ret;
> +
> +	ret = ath10k_pci_diag_read_mem(ar, address, &val, sizeof(__le32));
> +	*value = __le32_to_cpu(val);
> +
> +	return ret;
>  }

For consistency, I folded a patch below. Is that ok?

--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -620,7 +620,7 @@ static int ath10k_pci_diag_read32(struct ath10k *ar, u32 address, u32 *value)
        __le32 val = 0;
        int ret;
 
-       ret = ath10k_pci_diag_read_mem(ar, address, &val, sizeof(__le32));
+       ret = ath10k_pci_diag_read_mem(ar, address, &val, sizeof(val));
        *value = __le32_to_cpu(val);
 
        return ret;

https://github.com/kvalo/ath/commit/1850a415873cb34a6f84b699dfb9a283df3252ec

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
