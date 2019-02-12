Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtd4x-0005cI-HM
 for ath10k@lists.infradead.org; Tue, 12 Feb 2019 18:46:49 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Add support to configure ftm responder role
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1549439910-9315-1-git-send-email-pradeepc@codeaurora.org>
References: <1549439910-9315-1-git-send-email-pradeepc@codeaurora.org>
Message-Id: <20190212184647.38296608BA@smtp.codeaurora.org>
Date: Tue, 12 Feb 2019 18:46:47 +0000 (UTC)
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

> Configure fine timing measurement (FTM) responder role from the
> ftm_responder bss param sent by mac80211. With FTM functionality offloaded
> to firmware, adding the interface allows userspace to enable or disable
> FTM responder functionality. ath10k disables it at the time of interface
> creation.
> 
> Supported FW: 10.4
> 
> Tested on IPQ4019 with firmware: 10.4-3.2.1.1-00022
> 
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

059104bff312 ath10k: add support to configure ftm responder role

-- 
https://patchwork.kernel.org/patch/10798883/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
