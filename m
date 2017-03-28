Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1csuAU-0001UT-RX
 for ath10k@lists.infradead.org; Tue, 28 Mar 2017 16:40:29 +0000
Received: by mail-wm0-x243.google.com with SMTP id x124so684337wmf.3
 for <ath10k@lists.infradead.org>; Tue, 28 Mar 2017 09:40:04 -0700 (PDT)
Subject: Re: [PATCH v6 00/10] ath10k: sdio support
References: <148959263520.31432.8488419244476213373.stgit@potku.adurom.net>
 <87k279wrao.fsf@kamboji.qca.qualcomm.com>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <7917f151-a8af-039d-119c-93ee2e6354f1@gmail.com>
Date: Tue, 28 Mar 2017 18:40:01 +0200
MIME-Version: 1.0
In-Reply-To: <87k279wrao.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>


Please let me know if there is anything I can help with...

I will test the patches as soon as v7 is submitted.

On 2017-03-28 13:53, Kalle Valo wrote:
> Kalle Valo <kvalo@qca.qualcomm.com> writes:
>
>> I did some changes while reviewing Erik's SDIO patches. Only compile
>> tested, I don't have any SDIO boards at the moment.
>
> [...]
>
>> still todo:
>>
>> o fix remaining memory leaks (if any)
>>
>> o endian support, eg ath10k_sdio_hif_set_mbox_sleep()
>>
>> o are ath10k_sdio_io() and ath10k_sdio_read_write_sync() really
>>   necessary? looks like just an unnecessary abstraction layer
>
> It took me longer than I planned, but here are my notes about what I'm
> planning to do to remove unnecessary ath10k_sdio_io() abstraction:
>
> ath10k_sdio_read_write_sync():
> HIF_RD_SYNC_BLOCK_FIX	-> ath10k_sdio_readsb()
> HIF_RD_SYNC_BYTE_INC	-> ath10k_sdio_read(), ath10k_sdio_read32()
> HIF_WR_SYNC_BYTE_FIX	-> ath10k_sdio_writesb()
> HIF_WR_SYNC_BYTE_INC	-> ath10k_sdio_write()
>
> ath10k_sdio_prep_async_req():
> HIF_WRITE		-> HIF_WR_SYNC_BYTE_INC -> ath10k_sdio_write()
>
> ath10k_sdio_read/write32():
> sdio_readl()/sdio_writel() (those use endian macros)
>
> ath10k_sdio_readsb():
> len = round_down(len, ar_sdio->mbox_info.block_size);
> sdio_memcpy_fromio(len)
>
> With these changes I'm hoping to get rid of also the memory leaks and
> have proper endian support.
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
