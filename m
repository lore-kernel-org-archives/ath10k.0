Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO0JF-0004YZ-07
 for ath10k@lists.infradead.org; Tue, 07 May 2019 13:39:06 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Move board id and fw version logging to info level
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190301145000.22624-1-govinds@codeaurora.org>
References: <20190301145000.22624-1-govinds@codeaurora.org>
Message-Id: <20190507133904.ABA1D60ACE@smtp.codeaurora.org>
Date: Tue,  7 May 2019 13:39:04 +0000 (UTC)
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Govind Singh <govinds@codeaurora.org> wrote:

> Board id and fw version is not printed by default in qmi
> cap response message. Move board id and fw version logging
> to info level for default logging.
> 
> [   34.005399] ath10k_snoc a000000.wifi: qmi chip_id 0x30b chip_family 0x4001 board_id 0xff soc_id 0x40070000
> [   34.005432] ath10k_snoc a000000.wifi: qmi fw_version 0x3106836b fw_build_timestamp 2019-02-13 10:24 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.3.1-00875-QCAHLSWMTPL-1
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

7b612ed94d0a ath10k: Move board id and fw version logging to info level

-- 
https://patchwork.kernel.org/patch/10835539/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
