Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxHCv-0008A9-Hw
 for ath10k@lists.infradead.org; Sun, 09 Apr 2017 18:05:08 +0000
Received: by mail-lf0-x243.google.com with SMTP id 75so1354072lfs.3
 for <ath10k@lists.infradead.org>; Sun, 09 Apr 2017 11:04:39 -0700 (PDT)
Subject: Re: [PATCH 0/7] ath10k: remove ath10k_sdio_io()
References: <149137591893.4898.2318291094351440261.stgit@potku.adurom.net>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <6d38a23a-ddd7-a19e-35e0-319c9f1a5261@gmail.com>
Date: Sun, 9 Apr 2017 20:04:35 +0200
MIME-Version: 1.0
In-Reply-To: <149137591893.4898.2318291094351440261.stgit@potku.adurom.net>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

I have made some basic testing (AP scanning) with this patchset and as far as I can
see they haven't broken anything.

I have not exercised all code (like error interrupt handling etc.) so those patches
might contain bugs (I noticed a FIXME comment in one of them).

I will review those patches and get back with more comments (if I find anything).

Erik

On 2017-04-05 09:06, Kalle Valo wrote:
> Using ath10k_sdio_io() and ath10k_sdio_read_write_sync() are just
> confusing. Refactor the code by following the plan outlined
> below.
>
> I'm planning to fold all these seven patches into Erik's patch
> adding sdio.c[1] so I didn't write any commit logs. I'm just
> submitting these separately to make it easier to review the
> changes.
>
> Kalle
>
> ath10k_sdio_read_write_sync():
> X HIF_RD_SYNC_BLOCK_FIX	-> ath10k_sdio_readsb()
> X HIF_RD_SYNC_BYTE_INC	-> ath10k_sdio_read(), ath10k_sdio_read32()
> X HIF_WR_SYNC_BYTE_FIX	-> ath10k_sdio_writesb32()
> X HIF_WR_SYNC_BYTE_INC	-> ath10k_sdio_write()
>
> ath10k_sdio_prep_async_req():
> X HIF_WRITE		-> HIF_WR_SYNC_BYTE_INC -> ath10k_sdio_write()
>
> ath10k_sdio_read/write32():
> sdio_readl()/sdio_writel() (those use endian macros)
>
> ath10k_sdio_writesb32():
> kmalloc()
> sdio_writesb(len)
> kfree()
>
> ath10k_sdio_readsb():
> len = round_down(len, ar_sdio->mbox_info.block_size);
> sdio_readsb(len)
>
> ath10k_sdio_read():
> sdio_memcpy_fromio()
>
> ath10k_sdio_write():
> sdio_memcpy_toio()
>
>
> [1] https://patchwork.kernel.org/patch/9626001/
>
> ---
>
> Kalle Valo (7):
>       ath10k: add ath10k_sdio_write32/read32()
>       ath10k: add ath10k_sdio_writesb()
>       ath10k: add ath10k_sdio_read()
>       ath10k: add ath10k_sdio_write()
>       ath10k: add ath10k_sdio_readsb()
>       ath10k: convert __ath10k_sdio_write_async() to use ath10k_sdio_write()
>       ath10k: remove unused sdio wrappers
>
>
>  drivers/net/wireless/ath/ath10k/sdio.c |  419 +++++++++++++++++---------------
>  drivers/net/wireless/ath/ath10k/sdio.h |   40 ---
>  2 files changed, 219 insertions(+), 240 deletions(-)
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
