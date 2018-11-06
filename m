Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK43P-0008QW-N1
 for ath10k@lists.infradead.org; Tue, 06 Nov 2018 16:18:12 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] ath10k: snoc: remove 'wcn3990' from generic resource
 handling
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20181013005504.46399-1-briannorris@chromium.org>
References: <20181013005504.46399-1-briannorris@chromium.org>
Message-Id: <20181106161800.C727E60791@smtp.codeaurora.org>
Date: Tue,  6 Nov 2018 16:18:00 +0000 (UTC)
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
To: Brian Norris <briannorris@chromium.org>
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, Doug Anderson <dianders@chromium.org>, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, Kalle Valo <kvalo@qca.qualcomm.com>

Brian Norris <briannorris@chromium.org> wrote:

> ath10k_wcn3990_clk_info and ath10k_wcn3990_vreg_info are not
> WCN3990-specific structures. They hold generic data. So don't name them
> with wcn3990 specifics.
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

4 patches applied to ath-next branch of ath.git, thanks.

887a3dcf5893 ath10k: snoc: remove 'wcn3990' from generic resource handling
1a1a0d5ccefc ath10k: snoc: fix unabalanced regulator error handling
bfe57a6ac75a ath10k: snoc: relax voltage requirements
82e60d920e8a ath10k: snoc: fix unbalanced clock error handling

-- 
https://patchwork.kernel.org/patch/10639795/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
