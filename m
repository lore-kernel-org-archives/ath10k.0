Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grl1i-0003RN-R3
 for ath10k@lists.infradead.org; Thu, 07 Feb 2019 14:51:44 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix hw-restart crash inject mode for WCN3990
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1548753967-2233-1-git-send-email-pillair@codeaurora.org>
References: <1548753967-2233-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20190207145142.26A056055C@smtp.codeaurora.org>
Date: Thu,  7 Feb 2019 14:51:42 +0000 (UTC)
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rakesh Pillai <pillair@codeaurora.org> wrote:

> The hw-restart crash inject mode is a special mode, where
> there is no crash generated in the firmware, but instead
> the driver restarts the firmware. In order to restart WCN3990
> firmware, the driver needs to send qmi_wlan_disable message
> followed by the qmi_wlan_enable message to the WCN3990 firmware.
> 
> Currently the qmi_wlan_disable message is not sent to
> the WCN3990 firmware when hw-restart crash is injected,
> which causes the firmware to crash when the driver sends
> qmi_wlan_enable message during ath10k_restart.
> 
> Send qmi_wlan_disable to the WCN3990 firmware when the
> hw-restart crash is injected via debugfs.
> 
> Tested HW: WCN3990
> Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

cdb78e5af491 ath10k: fix hw-restart crash inject mode for WCN3990

-- 
https://patchwork.kernel.org/patch/10785855/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
