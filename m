Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCJY8-0000Uj-Ai
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 08:18:25 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] net: ath: fix missing checks for bmi reads and writes
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190315051903.10664-1-kjlu@umn.edu>
References: <20190315051903.10664-1-kjlu@umn.edu>
Message-Id: <20190923081823.5D2CF614DC@smtp.codeaurora.org>
Date: Mon, 23 Sep 2019 08:18:23 +0000 (UTC)
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
To: Kangjie Lu <kjlu@umn.edu>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, pakki001@umn.edu, "David S. Miller" <davem@davemloft.net>

Kangjie Lu <kjlu@umn.edu> wrote:

> ath10k_bmi_write32 and ath10k_bmi_read32 can fail. The fix
> checks their statuses to avoid potential undefined behaviors.
> 
> Signed-off-by: Kangjie Lu <kjlu@umn.edu>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

8da96730331d ath10k: fix missing checks for bmi reads and writes

-- 
https://patchwork.kernel.org/patch/10854069/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
