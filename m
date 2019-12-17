Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ih7hZ-0000X2-St
 for ath10k@lists.infradead.org; Tue, 17 Dec 2019 07:55:31 +0000
Received: by mail-ua1-x941.google.com with SMTP id q22so3096027uam.6
 for <ath10k@lists.infradead.org>; Mon, 16 Dec 2019 23:55:28 -0800 (PST)
MIME-Version: 1.0
References: <20191213185050.m6iku7defq44syrl@kili.mountain>
In-Reply-To: <20191213185050.m6iku7defq44syrl@kili.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 17 Dec 2019 08:54:47 +0100
Message-ID: <CAPDyKFoKvhGDuQ+C0Sp2N3==CXiMWfpcrT28+dQ2+Nq_UPaXYQ@mail.gmail.com>
Subject: Re: [bug report] mmc: core: Re-work HW reset for SDIO cards
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
To: Dan Carpenter <dan.carpenter@oracle.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

+ Kalle

On Fri, 13 Dec 2019 at 19:51, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hello Ulf Hansson,
>
> The patch 2ac55d5e5ec9: "mmc: core: Re-work HW reset for SDIO cards"
> from Oct 17, 2019, leads to the following static checker warning:
>
>         drivers/net/wireless/ath/ath10k/sdio.c:1521 ath10k_sdio_hif_power_down()
>         warn: 'ret' can be either negative or positive

Thanks for reporting!

>
> drivers/net/wireless/ath/ath10k/sdio.c
>   1495  static void ath10k_sdio_hif_power_down(struct ath10k *ar)
>   1496  {
>   1497          struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
>   1498          int ret;
>   1499
>   1500          if (ar_sdio->is_disabled)
>   1501                  return;
>   1502
>   1503          ath10k_dbg(ar, ATH10K_DBG_BOOT, "sdio power off\n");
>   1504
>   1505          /* Disable the card */
>   1506          sdio_claim_host(ar_sdio->func);
>   1507
>   1508          ret = sdio_disable_func(ar_sdio->func);
>   1509          if (ret) {
>   1510                  ath10k_warn(ar, "unable to disable sdio function: %d\n", ret);
>   1511                  sdio_release_host(ar_sdio->func);
>   1512                  return;
>   1513          }
>   1514
>   1515          ret = mmc_hw_reset(ar_sdio->func->card->host);
>   1516          if (ret)
>
> It used to be that mmc_hw_reset() return negative error codes or zero
> but now it returns 1 on certain success paths.

Correct.

I was actually looking into this while changing the behaviour of
mmc_hw_reset(). However I decided to leave this as is.

The main reason is, that mmc_hw_reset() is not going to power down the
card. It's hard power cycle, so I am kind of surprised that is being
used at all in this path. This in combination of expecting the value
from mmc_hw_reset() to never be 1 here, seemed like a good idea to
preserve the logging of the warning message.

To silent the static checker tool from warning, we could check
explicitly for "1". Is that something you want me to do?

>
>   1517                  ath10k_warn(ar, "unable to reset sdio: %d\n", ret);
>   1518
>   1519          sdio_release_host(ar_sdio->func);
>   1520
>   1521          ar_sdio->is_disabled = true;
>   1522  }
>
>
> regards,
> dan carpenter

Kind regards
Uffe

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
