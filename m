Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knwfz-0007Jk-VV
 for ath10k@lists.infradead.org; Sat, 12 Dec 2020 04:38:39 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v6] ath10k: add atomic protection for device recovery
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <010101746bead6a0-d5e97c66-dedd-4b92-810e-c2e4840fafc9-000000@us-west-2.amazonses.com>
References: <010101746bead6a0-d5e97c66-dedd-4b92-810e-c2e4840fafc9-000000@us-west-2.amazonses.com>
Message-Id: <20201212043827.CECB4C433CA@smtp.codeaurora.org>
Date: Sat, 12 Dec 2020 04:38:27 +0000 (UTC)
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

> When it has more than one restart_work queued meanwhile, the 2nd
> restart_work is very easy to break the 1st restart work and lead
> recovery fail.
> 
> Add a flag to allow only one restart work running untill
> device successfully recovered.
> 
> It already has flag ATH10K_FLAG_CRASH_FLUSH, but it can not use this
> flag again, because it is clear in ath10k_core_start. The function
> ieee80211_reconfig(called by ieee80211_restart_work) of mac80211 do
> many things and drv_start(call to ath10k_core_start) is 1st thing,
> when drv_start complete, it does not mean restart complete. So it
> add new flag and clear it in ath10k_reconfig_complete, because it
> is the last thing called from drv_reconfig_complete of function
> ieee80211_reconfig, after it, the restart process finished.
> 
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00049
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

5dadbe4e3718 ath10k: add atomic protection for device recovery

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/010101746bead6a0-d5e97c66-dedd-4b92-810e-c2e4840fafc9-000000@us-west-2.amazonses.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
