Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x22a.google.com ([2607:f8b0:4001:c06::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aU0bR-0005gP-BV
 for ath10k@lists.infradead.org; Thu, 11 Feb 2016 23:24:49 +0000
Received: by mail-io0-x22a.google.com with SMTP id z135so4950645iof.0
 for <ath10k@lists.infradead.org>; Thu, 11 Feb 2016 15:24:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1455123535-26751-1-git-send-email-a.s.protopopov@gmail.com>
References: <1455123535-26751-1-git-send-email-a.s.protopopov@gmail.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Fri, 12 Feb 2016 10:24:09 +1100
Message-ID: <CAGRGNgXr-XS+sCBDCKMKT0x_uQBeiUqS9fNigkBt6x7LbNJkPQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix erroneous return value
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
To: Anton Protopopov <a.s.protopopov@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org

Hi All,

On Thu, Feb 11, 2016 at 3:58 AM, Anton Protopopov
<a.s.protopopov@gmail.com> wrote:
> The ath10k_pci_hif_exchange_bmi_msg() function may return the positive
> value EIO instead of -EIO in case of error.
>
> Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>

This looks right to me.

Reviewed-by: Julian Calaby <julian.calaby@gmail.com>

> ---
>  drivers/net/wireless/ath/ath10k/pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
> index ee925c6..526acde 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -1756,7 +1756,7 @@ static int ath10k_pci_hif_exchange_bmi_msg(struct ath10k *ar,
>                                             DMA_FROM_DEVICE);
>                 ret = dma_mapping_error(ar->dev, resp_paddr);
>                 if (ret) {
> -                       ret = EIO;
> +                       ret = -EIO;
>                         goto err_req;
>                 }
>
> --
> 2.6.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
