Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f84NJ-0005SE-RQ
 for ath10k@lists.infradead.org; Mon, 16 Apr 2018 13:40:55 +0000
MIME-Version: 1.0
Subject: Re: [1/2] ath10k: Add WMI_SERVICE_AVAILABLE_EVENT support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1522379640-6442-2-git-send-email-cjhuang@codeaurora.org>
References: <1522379640-6442-2-git-send-email-cjhuang@codeaurora.org>
Message-Id: <20180416134043.64F1C607E1@smtp.codeaurora.org>
Date: Mon, 16 Apr 2018 13:40:43 +0000 (UTC)
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
To: Carl Huang <cjhuang@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Carl Huang <cjhuang@codeaurora.org> wrote:

> Add WMI_SERVICE_AVAILABLE_EVENT to extend WMI_SERVICE_READY_EVENT,
> the 128bit service map in WMI_SERVICE_READY_EVENT is not enough
> for firmware to notice new WLAN service to host driver. Hereby,
> for thoese new WLAN service, firmware will notice host driver by
> WMI_SERVICE_AVAILABLE_EVENT.
> 
> Signed-off-by: Alan Liu <alanliu@codeaurora.org>
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This added a new sparse warning, I fixed it in the pending branch:

drivers/net/wireless/ath/ath10k/wmi.c:5283:35: warning: incorrect type in argument 4 (different base types)
drivers/net/wireless/ath/ath10k/wmi.c:5283:35:    expected unsigned long [unsigned] [usertype] len
drivers/net/wireless/ath/ath10k/wmi.c:5283:35:    got restricted __le32 [addressable] [usertype] service_map_ext_len

-- 
https://patchwork.kernel.org/patch/10316767/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
