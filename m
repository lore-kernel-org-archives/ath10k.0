Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1csphs-0000XH-UI
 for ath10k@lists.infradead.org; Tue, 28 Mar 2017 11:54:38 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v6 00/10] ath10k: sdio support
Date: Tue, 28 Mar 2017 11:53:51 +0000
Message-ID: <87k279wrao.fsf@kamboji.qca.qualcomm.com>
References: <148959263520.31432.8488419244476213373.stgit@potku.adurom.net>
In-Reply-To: <148959263520.31432.8488419244476213373.stgit@potku.adurom.net>
 (Kalle Valo's message of "Wed, 15 Mar 2017 17:44:41 +0200")
Content-Language: en-US
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> I did some changes while reviewing Erik's SDIO patches. Only compile
> tested, I don't have any SDIO boards at the moment.

[...]

> still todo:
>
> o fix remaining memory leaks (if any)
>
> o endian support, eg ath10k_sdio_hif_set_mbox_sleep()
>
> o are ath10k_sdio_io() and ath10k_sdio_read_write_sync() really
>   necessary? looks like just an unnecessary abstraction layer

It took me longer than I planned, but here are my notes about what I'm
planning to do to remove unnecessary ath10k_sdio_io() abstraction:

ath10k_sdio_read_write_sync():
HIF_RD_SYNC_BLOCK_FIX	-> ath10k_sdio_readsb()
HIF_RD_SYNC_BYTE_INC	-> ath10k_sdio_read(), ath10k_sdio_read32()
HIF_WR_SYNC_BYTE_FIX	-> ath10k_sdio_writesb()
HIF_WR_SYNC_BYTE_INC	-> ath10k_sdio_write()

ath10k_sdio_prep_async_req():
HIF_WRITE		-> HIF_WR_SYNC_BYTE_INC -> ath10k_sdio_write()

ath10k_sdio_read/write32():
sdio_readl()/sdio_writel() (those use endian macros)

ath10k_sdio_readsb():
len = round_down(len, ar_sdio->mbox_info.block_size);
sdio_memcpy_fromio(len)

With these changes I'm hoping to get rid of also the memory leaks and
have proper endian support.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
