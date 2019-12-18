Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihRtw-0006aM-2g
 for ath10k@lists.infradead.org; Wed, 18 Dec 2019 05:29:37 +0000
Date: Wed, 18 Dec 2019 08:27:21 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] mmc: core: Re-work HW reset for SDIO cards
Message-ID: <20191218052721.GC2524@kadam>
References: <20191213185050.m6iku7defq44syrl@kili.mountain>
 <CAPDyKFoKvhGDuQ+C0Sp2N3==CXiMWfpcrT28+dQ2+Nq_UPaXYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFoKvhGDuQ+C0Sp2N3==CXiMWfpcrT28+dQ2+Nq_UPaXYQ@mail.gmail.com>
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
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On Tue, Dec 17, 2019 at 08:54:47AM +0100, Ulf Hansson wrote:
> + Kalle
> 
> On Fri, 13 Dec 2019 at 19:51, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > Hello Ulf Hansson,
> >
> > The patch 2ac55d5e5ec9: "mmc: core: Re-work HW reset for SDIO cards"
> > from Oct 17, 2019, leads to the following static checker warning:
> >
> >         drivers/net/wireless/ath/ath10k/sdio.c:1521 ath10k_sdio_hif_power_down()
> >         warn: 'ret' can be either negative or positive
> 
> Thanks for reporting!
> 
> >
> > drivers/net/wireless/ath/ath10k/sdio.c
> >   1495  static void ath10k_sdio_hif_power_down(struct ath10k *ar)
> >   1496  {
> >   1497          struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
> >   1498          int ret;
> >   1499
> >   1500          if (ar_sdio->is_disabled)
> >   1501                  return;
> >   1502
> >   1503          ath10k_dbg(ar, ATH10K_DBG_BOOT, "sdio power off\n");
> >   1504
> >   1505          /* Disable the card */
> >   1506          sdio_claim_host(ar_sdio->func);
> >   1507
> >   1508          ret = sdio_disable_func(ar_sdio->func);
> >   1509          if (ret) {
> >   1510                  ath10k_warn(ar, "unable to disable sdio function: %d\n", ret);
> >   1511                  sdio_release_host(ar_sdio->func);
> >   1512                  return;
> >   1513          }
> >   1514
> >   1515          ret = mmc_hw_reset(ar_sdio->func->card->host);
> >   1516          if (ret)
> >
> > It used to be that mmc_hw_reset() return negative error codes or zero
> > but now it returns 1 on certain success paths.
> 
> Correct.
> 
> I was actually looking into this while changing the behaviour of
> mmc_hw_reset(). However I decided to leave this as is.
> 
> The main reason is, that mmc_hw_reset() is not going to power down the
> card. It's hard power cycle, so I am kind of surprised that is being
> used at all in this path. This in combination of expecting the value
> from mmc_hw_reset() to never be 1 here, seemed like a good idea to
> preserve the logging of the warning message.
> 
> To silent the static checker tool from warning, we could check
> explicitly for "1". Is that something you want me to do?

I feel like checking for 1 would be more readable for humans as well.

Or we could just leave it as-is.  I'm not likely to ever publish this
static checker warning.

regards,
dan carpenter


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
