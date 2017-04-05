Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cvf4g-0004Je-9X
 for ath10k@lists.infradead.org; Wed, 05 Apr 2017 07:14:32 +0000
Subject: [PATCH 0/7] ath10k: remove ath10k_sdio_io()
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 5 Apr 2017 10:06:13 +0300
Message-ID: <149137591893.4898.2318291094351440261.stgit@potku.adurom.net>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Using ath10k_sdio_io() and ath10k_sdio_read_write_sync() are just
confusing. Refactor the code by following the plan outlined
below.

I'm planning to fold all these seven patches into Erik's patch
adding sdio.c[1] so I didn't write any commit logs. I'm just
submitting these separately to make it easier to review the
changes.

Kalle

ath10k_sdio_read_write_sync():
X HIF_RD_SYNC_BLOCK_FIX	-> ath10k_sdio_readsb()
X HIF_RD_SYNC_BYTE_INC	-> ath10k_sdio_read(), ath10k_sdio_read32()
X HIF_WR_SYNC_BYTE_FIX	-> ath10k_sdio_writesb32()
X HIF_WR_SYNC_BYTE_INC	-> ath10k_sdio_write()

ath10k_sdio_prep_async_req():
X HIF_WRITE		-> HIF_WR_SYNC_BYTE_INC -> ath10k_sdio_write()

ath10k_sdio_read/write32():
sdio_readl()/sdio_writel() (those use endian macros)

ath10k_sdio_writesb32():
kmalloc()
sdio_writesb(len)
kfree()

ath10k_sdio_readsb():
len = round_down(len, ar_sdio->mbox_info.block_size);
sdio_readsb(len)

ath10k_sdio_read():
sdio_memcpy_fromio()

ath10k_sdio_write():
sdio_memcpy_toio()


[1] https://patchwork.kernel.org/patch/9626001/

---

Kalle Valo (7):
      ath10k: add ath10k_sdio_write32/read32()
      ath10k: add ath10k_sdio_writesb()
      ath10k: add ath10k_sdio_read()
      ath10k: add ath10k_sdio_write()
      ath10k: add ath10k_sdio_readsb()
      ath10k: convert __ath10k_sdio_write_async() to use ath10k_sdio_write()
      ath10k: remove unused sdio wrappers


 drivers/net/wireless/ath/ath10k/sdio.c |  419 +++++++++++++++++---------------
 drivers/net/wireless/ath/ath10k/sdio.h |   40 ---
 2 files changed, 219 insertions(+), 240 deletions(-)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
