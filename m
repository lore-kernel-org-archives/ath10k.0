Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqhKh-0007wJ-BJ
 for ath10k@lists.infradead.org; Mon, 04 Feb 2019 16:42:57 +0000
MIME-Version: 1.0
Subject: Re: [PATCH REGRESSION] Revert "ath10k: add quiet mode support for
 QCA6174/QCA9377"
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20181107185643.240346-1-briannorris@chromium.org>
References: <20181107185643.240346-1-briannorris@chromium.org>
Message-Id: <20190204164254.BF5DD60721@smtp.codeaurora.org>
Date: Mon,  4 Feb 2019 16:42:54 +0000 (UTC)
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
Cc: Yu Wang <yyuwang@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Govind Singh <govinds@codeaurora.org>, Rakesh Pillai <pillair@codeaurora.org>, stable@vger.kernel.org

Brian Norris <briannorris@chromium.org> wrote:

> This reverts commit cfb353c0dc058bc1619cc226d3cbbda1f360bdd3.
> 
> WCN3990 firmware does not yet implement this feature, and so it crashes
> like this:
> 
>   fatal error received: err_qdi.c:456:EX:wlan_process:1:WLAN RT:207a:PC=b001b4f0
> 
> This feature can be re-implemented with a proper service bitmap or other
> feature-discovery mechanism in the future. But it should not break
> working boards.
> 
> Fixes: cfb353c0dc05 ("ath10k: add quiet mode support for QCA6174/QCA9377")
> Cc: Yu Wang <yyuwang@codeaurora.org>
> Cc: Rakesh Pillai <pillair@codeaurora.org>
> Cc: Govind Singh <govinds@codeaurora.org>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Brian Norris <briannorris@chromium.org>

This regression should be fixed by (which is in v4.20):

53884577fbce ath10k: skip sending quiet mode cmd for WCN3990

So this revert should not be needed anymore and I'll drop this.

-- 
https://patchwork.kernel.org/patch/10672903/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
