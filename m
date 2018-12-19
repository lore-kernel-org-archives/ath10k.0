Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZc2i-00066W-W6
 for ath10k@lists.infradead.org; Wed, 19 Dec 2018 13:37:46 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: skip sending quiet mode cmd for WCN3990
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1544782666-24837-1-git-send-email-kvalo@codeaurora.org>
References: <1544782666-24837-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20181219133734.3DFA261B11@smtp.codeaurora.org>
Date: Wed, 19 Dec 2018 13:37:34 +0000 (UTC)
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Rakesh Pillai <pillair@codeaurora.org>, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> From: Rakesh Pillai <pillair@codeaurora.org>
> 
> HL2.0 firmware does not support setting quiet mode.  If the host driver sends
> the quiet mode setting command to the HL2.0 firmware, it crashes with the below
> signature.
> 
> fatal error received: err_qdi.c:456:EX:wlan_process:1:WLAN RT:207a:PC=b001b4f0
> 
> The quiet mode command support is exposed by the firmware via thermal throttle
> wmi service. Enable ath10k thermal support if thermal throttle wmi service bit
> is set.  10.x firmware versions support this feature by default, but
> unfortunately do not advertise the support via service flags, hence have to
> manually set the service flag in ath10k_core_compat_services().
> 
> Tested on QCA988X with 10.2.4.70.9-2. Also tested on WCN3990.
> 
> Co-developed-by: Govind Singh <govinds@codeaurora.org>
> Co-developed-by: Kalle Valo <kvalo@codeaurora.org>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to wireless-drivers.git, thanks.

53884577fbce ath10k: skip sending quiet mode cmd for WCN3990

-- 
https://patchwork.kernel.org/patch/10730831/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
