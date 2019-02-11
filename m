Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtEXR-0002in-Ea
 for ath10k@lists.infradead.org; Mon, 11 Feb 2019 16:34:35 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Enable Factory Test Mode for WCN3990
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1535526038-4299-1-git-send-email-pillair@codeaurora.org>
References: <1535526038-4299-1-git-send-email-pillair@codeaurora.org>
Message-Id: <20190211163432.B89A561246@smtp.codeaurora.org>
Date: Mon, 11 Feb 2019 16:34:31 +0000 (UTC)
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

> The support to put WCN3990 firmware into Factory
> test mode is not present currently. The WCN3990
> firmware can operate in Factory test mode based
> on the mode it receives in the wlan enable message
> from the host driver.
> 
> When the host driver is started in testmode send
> the operating mode as UTF mode, to the WCN3990
> firmware, in the wlan enable message to start the
> firmware in Factory test mode.
> 
> Tested on: WCN3990
> Tested FW: WLAN.HL.2.0-01192-QCAHLSWMTPLZ-1.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

3c545a25939c ath10k: enable Factory Test Mode for WCN3990

-- 
https://patchwork.kernel.org/patch/10579559/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
