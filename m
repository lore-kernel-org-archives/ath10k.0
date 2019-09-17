Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAECg-0004PK-OY
 for ath10k@lists.infradead.org; Tue, 17 Sep 2019 14:11:40 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: add cleanup in ath10k_sta_state()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1565903072-3948-1-git-send-email-wenwen@cs.uga.edu>
References: <1565903072-3948-1-git-send-email-wenwen@cs.uga.edu>
Message-Id: <20190917141138.6F6C6614C3@smtp.codeaurora.org>
Date: Tue, 17 Sep 2019 14:11:38 +0000 (UTC)
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
To: Wenwen Wang <wenwen@cs.uga.edu>
Cc: "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, "open list:NETWORKING DRIVERS WIRELESS" <linux-wireless@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:QUALCOMM ATHEROS ATH10K WIRELESS
 DRIVER" <ath10k@lists.infradead.org>, "David S. Miller" <davem@davemloft.net>

Wenwen Wang <wenwen@cs.uga.edu> wrote:

> If 'sta->tdls' is false, no cleanup is executed, leading to memory/resource
> leaks, e.g., 'arsta->tx_stats'. To fix this issue, perform cleanup before
> go to the 'exit' label.
> 
> Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

334f5b61a6f2 ath10k: add cleanup in ath10k_sta_state()

-- 
https://patchwork.kernel.org/patch/11096481/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
