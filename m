Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFWbc-00082L-Nz
 for ath10k@lists.infradead.org; Tue, 08 Sep 2020 05:55:50 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] ath10k: allow dynamic SAR power limits to be
 configured
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1595823458-3926-3-git-send-email-wgong@codeaurora.org>
References: <1595823458-3926-3-git-send-email-wgong@codeaurora.org>
Message-ID: <010101746c48d05e-6c913ae9-09f9-41d1-a1fc-214f3d204041-000000@us-west-2.amazonses.com>
Date: Tue, 8 Sep 2020 05:55:45 +0000
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

> Add support for a vendor command for STATION, the command
> QCA_NL80211_VENDOR_SUBCMD_SET_SAR_LIMITS which is already defined in
> git://w1.fi/hostap.git (src/command/qca-vendor.h). This allows user
> space to configure power limits for 2.4 GHz and 5 GHz bands.
> 
> ath10k set pdev parameter WMI_PDEV_PARAM_TXPOWER_LIMIT2G and
> WMI_PDEV_PARAM_TXPOWER_LIMIT5G to firmware, the 2 value will
> be used as one input source to affect the tx power.
> 
> When QCA_NL80211_VENDOR_SUBCMD_SET_SAR_LIMITS set to ath10k, it will
> be saved the 2.4G and 5G limit value, If STATION is connected meanwhile,
> then the 2.4G and 5G WMI command will be set to firmware, otherwise
> it will not set to firmware at this moment. When STATION connect
> next time, it will set to firmware.
> 
> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00029.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

The plan is to have a common API for SAR limits, not use vendor API.

Patch set to Rejected.

-- 
https://patchwork.kernel.org/patch/11686327/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
