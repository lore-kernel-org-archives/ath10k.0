Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTU2U-0001wH-O2
 for ath10k@lists.infradead.org; Thu, 14 Jun 2018 15:19:56 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Skip data calibration for non-bmi target
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1528866215-24754-1-git-send-email-svishnoi@codeaurora.org>
References: <1528866215-24754-1-git-send-email-svishnoi@codeaurora.org>
Message-Id: <20180614151944.44F346055D@smtp.codeaurora.org>
Date: Thu, 14 Jun 2018 15:19:44 +0000 (UTC)
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
To: Surabhi Vishnoi <svishnoi@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Surabhi Vishnoi <svishnoi@codeaurora.org> wrote:

> In non-bmi target ex. WCN3990, data calibration
> is handled via QMI.
> 
> Skip data calibration in debug routine to enable ath10k
> debugfs for non bmi targets.
> 
> Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

5db98aee93cd ath10k: skip data calibration for non-bmi target

-- 
https://patchwork.kernel.org/patch/10461559/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
