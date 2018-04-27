Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fC1Wu-00023A-6e
 for ath10k@lists.infradead.org; Fri, 27 Apr 2018 11:27:13 +0000
MIME-Version: 1.0
Subject: Re: ath10k: fix information leak in debugfs
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1519044681-5663-1-git-send-email-vnaralas@codeaurora.org>
References: <1519044681-5663-1-git-send-email-vnaralas@codeaurora.org>
Message-Id: <20180427112657.8427E60F5F@smtp.codeaurora.org>
Date: Fri, 27 Apr 2018 11:26:57 +0000 (UTC)
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
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Venkateswara Naralasetty <vnaralas@codeaurora.org> wrote:

> During write to some of debugfs in ath10k, few variables exposing stack
> data when process user input. which leads to possible information leak.
> 
> This patch fix this issue by initializing buffer and checks
> the return valure of 'simple_write_to_buffer'.
> 
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

2f177c1628c3 ath10k: fix information leak in debugfs

-- 
https://patchwork.kernel.org/patch/10227751/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
