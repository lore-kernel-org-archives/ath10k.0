Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJeY9-0002o9-KJ
 for ath10k@lists.infradead.org; Mon, 05 Nov 2018 13:04:15 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] ath10k: snoc: remove 'wcn3990' from generic resource
 handling
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20181013005504.46399-1-briannorris@chromium.org>
References: <20181013005504.46399-1-briannorris@chromium.org>
Message-Id: <20181105130403.5AB936085F@smtp.codeaurora.org>
Date: Mon,  5 Nov 2018 13:04:03 +0000 (UTC)
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

This patchset (I think it was with the first patch, but not sure) had some
conflicts but 3-way merge was able to automatically solve them. Please check
the end result anyway:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=77adda81e264e0c93af9570ac4ada82a5d0f5d99

-- 
https://patchwork.kernel.org/patch/10639795/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
