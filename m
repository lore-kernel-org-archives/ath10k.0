Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmJ3s-0000kO-Ey
 for ath10k@lists.infradead.org; Mon, 07 Dec 2020 16:08:30 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix a check patch warning
 returnNonBoolInBooleanFunction of sdio.c
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1606103240-9868-1-git-send-email-wgong@codeaurora.org>
References: <1606103240-9868-1-git-send-email-wgong@codeaurora.org>
Message-Id: <20201207160811.DE897C43461@smtp.codeaurora.org>
Date: Mon,  7 Dec 2020 16:08:11 +0000 (UTC)
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

> cppcheck possible warnings: (new ones prefixed by >>, may not real problems)
> drivers/net/wireless/ath/ath10k/sdio.c:2234:2:
> warning: Non-boolean value returned from function returning bool [returnNonBoolInBooleanFunction]
> return param & HI_OPTION_SDIO_CRASH_DUMP_ENHANCEMENT_FW;
> 
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> 
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00049
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

7f881a721716 ath10k: fix a check patch warning returnNonBoolInBooleanFunction of sdio.c

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1606103240-9868-1-git-send-email-wgong@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
