Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8hb8-00076x-PR
 for ath10k@lists.infradead.org; Thu, 20 Aug 2020 10:15:10 +0000
MIME-Version: 1.0
Date: Thu, 20 Aug 2020 18:14:37 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [RFC] ath10k: change to do napi_enable and napi_disable when
 insmod and rmmod for sdio
In-Reply-To: <CABPxzYK4kYvBAvYxk6rs-PHM==vBaHQTm3dCCh_+Z+KOB+c6qA@mail.gmail.com>
References: <20200214035555.24762-1-wgong@codeaurora.org>
 <878se9iup3.fsf@codeaurora.org>
 <CABPxzYK4kYvBAvYxk6rs-PHM==vBaHQTm3dCCh_+Z+KOB+c6qA@mail.gmail.com>
Message-ID: <b7e0e8dfe9a4ee0cb92c6c0f153c7bc2@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Krishna Chaitanya <chaitanya.mgit@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Kalle Valo <kvalo@codeaurora.org>

On 2020-08-20 17:19, Krishna Chaitanya wrote:
...
>> > diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
>> > index 7b894dcaad2e..b71499b171c6 100644
>> > --- a/drivers/net/wireless/ath/ath10k/sdio.c
>> > +++ b/drivers/net/wireless/ath/ath10k/sdio.c
>> > @@ -1756,8 +1756,6 @@ static int ath10k_sdio_hif_start(struct ath10k *ar)
>> >       struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
>> >       int ret;
>> >
>> > -     napi_enable(&ar->napi);
>> > -
>> >       /* Sleep 20 ms before HIF interrupts are disabled.
>> >        * This will give target plenty of time to process the BMI done
>> >        * request before interrupts are disabled.
>> > @@ -1884,7 +1882,6 @@ static void ath10k_sdio_hif_stop(struct ath10k *ar)
>> >       spin_unlock_bh(&ar_sdio->wr_async_lock);
>> >
>> >       napi_synchronize(&ar->napi);
>> > -     napi_disable(&ar->napi);
>> >  }
>> >
>> >  #ifdef CONFIG_PM
>> > @@ -2121,6 +2118,7 @@ static int ath10k_sdio_probe(struct sdio_func *func,
>> >
>> >       netif_napi_add(&ar->napi_dev, &ar->napi, ath10k_sdio_napi_poll,
>> >                      ATH10K_NAPI_BUDGET);
>> > +     napi_enable(&ar->napi);
>> >
>> >       ath10k_dbg(ar, ATH10K_DBG_BOOT,
>> >                  "sdio new func %d vendor 0x%x device 0x%x block 0x%x/0x%x\n",
>> > @@ -2235,6 +2233,7 @@ static void ath10k_sdio_remove(struct sdio_func *func)
>> >
>> >       ath10k_core_unregister(ar);
>> >
>> > +     napi_disable(&ar->napi);
>> >       netif_napi_del(&ar->napi);
>> >
>> >       ath10k_core_destroy(ar);
>> 
>> I'm not really convinced that this is the right fix, but I'm no NAPI
>> expert. Can anyone else help?
> Calling napi_disable() twice can lead to hangs, but moving NAPI from
> start/stop to
> the probe isn't the right approach as the datapath is tied to 
> start/stop.
> 
> Maybe check the state of NAPI before disable?
> 
>  if (test_bit(NAPI_STATE_SCHED, &ar->napi.napi.state))
>   napi_disable(&ar->napi)
> or maintain napi_state like this 
> https://patchwork.kernel.org/patch/10249365/
it is better to use above link's patch.
napi.state is controlled by napi API, it is better ath10k not know it.
> 
> Also, the most common cause for such issues (1st
> napi_synchronize/napi_disable hang)
> is that napi_poll is being scheduled, so, you might want to check that
> napi_schedule isn't
> called after stop.
> 
> cd ath10k; git log --grep=napi shows plenty of such issues. the one
> that matches closest is
> c2cac2f74ab4bcf0db0dcf3a612f1e5b52d145c8, so, it could just be a 
> regression.
This above commit's scene is not same with this patch.
It is hang for only do 1 simulate crash of the commit, this patch is 
doing simulate crash and rmmod meanwhile.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
