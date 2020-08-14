Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6bm5-0007aA-Jf
 for ath10k@lists.infradead.org; Fri, 14 Aug 2020 15:37:48 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/2] ath10k: start recovery process when payload length
 exceeds max htc length for sdio
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200108031957.22308-3-wgong@codeaurora.org>
References: <20200108031957.22308-3-wgong@codeaurora.org>
Message-Id: <20200814153736.77E7CC433C6@smtp.codeaurora.org>
Date: Fri, 14 Aug 2020 15:37:36 +0000 (UTC)
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> wrote:

> When simulate random transfer fail for sdio write and read, it happened
> "payload length exceeds max htc length" and recovery later sometimes.
> 
> Test steps:
> 1. Add config and update kernel:
> CONFIG_FAIL_MMC_REQUEST=y
> CONFIG_FAULT_INJECTION=y
> CONFIG_FAULT_INJECTION_DEBUG_FS=y
> 
> 2. Run simulate fail:
> cd /sys/kernel/debug/mmc1/fail_mmc_request
> echo 10 > probability
> echo 10 > times # repeat until hitting issues
> 
> 3. It happened payload length exceeds max htc length.
> [  199.935506] ath10k_sdio mmc1:0001:1: payload length 57005 exceeds max htc length: 4088
> ....
> [  264.990191] ath10k_sdio mmc1:0001:1: payload length 57005 exceeds max htc length: 4088
> 
> 4. after some time, such as 60 seconds, it start recovery which triggered
> by wmi command timeout for periodic scan.
> [  269.229232] ieee80211 phy0: Hardware restart was requested
> [  269.734693] ath10k_sdio mmc1:0001:1: device successfully recovered
> 
> The simulate fail of sdio is not a real sdio transter fail, it only
> set an error status in mmc_should_fail_request after the transfer end,
> actually the transfer is success, then sdio_io_rw_ext_helper will
> return error status and stop transfer the left data. For example,
> the really RX len is 286 bytes, then it will split to 2 blocks in
> sdio_io_rw_ext_helper, one is 256 bytes, left is 30 bytes, if the
> first 256 bytes get an error status by mmc_should_fail_request,then
> the left 30 bytes will not read in this RX operation. Then when the
> next RX arrive, the left 30 bytes will be considered as the header
> of the read, the top 4 bytes of the 30 bytes will be considered as
> lookaheads, but actually the 4 bytes is not the lookaheads, so the len
> from this lookaheads is not correct, it exceeds max htc length 4088
> sometimes. When happened exceeds, the buffer chain is not matched between
> firmware and ath10k, then it need to start recovery ASAP. Recently then
> recovery will be started by wmi command timeout, but it will be long time
> later, for example, it is 60+ seconds later from the periodic scan, if
> it does not have periodic scan, it will be longer.
> 
> Start recovery when it happened "payload length exceeds max htc length"
> will be reasonable.
> 
> This patch only effect sdio chips.
> 
> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00029.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

2fd3c8f34d08 ath10k: start recovery process when payload length exceeds max htc length for sdio

-- 
https://patchwork.kernel.org/patch/11322583/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
