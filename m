Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0Toq-0004k4-59
 for ath10k@lists.infradead.org; Mon, 26 Mar 2018 15:13:57 +0000
MIME-Version: 1.0
Subject: Re: [v2] ath10k: fix use-after-free in ath10k_wmi_cmd_send_nowait
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1520232242-24132-1-git-send-email-cjhuang@codeaurora.org>
References: <1520232242-24132-1-git-send-email-cjhuang@codeaurora.org>
Message-Id: <20180326151345.D8479607DD@smtp.codeaurora.org>
Date: Mon, 26 Mar 2018 15:13:45 +0000 (UTC)
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
To: Carl Huang <cjhuang@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Carl Huang <cjhuang@codeaurora.org> wrote:

> The skb may be freed in tx completion context before
> trace_ath10k_wmi_cmd is called. This can be easily captured when
> KASAN(Kernel Address Sanitizer) is enabled. The fix is to move
> trace_ath10k_wmi_cmd before the send operation. As the ret has no
> meaning in trace_ath10k_wmi_cmd then, so remove this parameter too.
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Tested-by: Brian Norris <briannorris@chromium.org>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

9ef0f58ed7b4 ath10k: fix use-after-free in ath10k_wmi_cmd_send_nowait

-- 
https://patchwork.kernel.org/patch/10258179/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
