Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fM9Ls-0006IM-2Z
 for ath10k@lists.infradead.org; Fri, 25 May 2018 09:50:27 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Add support to configure channel dwell time
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1526088159-29912-1-git-send-email-pradeepc@codeaurora.org>
References: <1526088159-29912-1-git-send-email-pradeepc@codeaurora.org>
Message-Id: <20180525094924.A972460F6D@smtp.codeaurora.org>
Date: Fri, 25 May 2018 09:49:24 +0000 (UTC)
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> wrote:

> Configure channel dwell time from duration of the scan request
> received from mac80211 when the duration is non-zero. When the
> scan request does not have duration value, use the default ones,
> the current implementation.
> 
> Corresponding flag NL80211_EXT_FEATURE_SET_SCAN_DWELL is
> advertized.
> 
> Supported Chipsets:
>  -QCA988X/QCA9887 PCI
>  -QCA99X0/QCA9984/QCA9888/QCA4019 PCI
>  -QCA6174/QCA9377 PCI/USB/SDIO
>  -WCN3990 SNOC
> 
> Tested on QCA9984 with firmware ver 10.4-3.6-0010
> 
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

be8cce96f14d ath10k: add support to configure channel dwell time

-- 
https://patchwork.kernel.org/patch/10395687/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
