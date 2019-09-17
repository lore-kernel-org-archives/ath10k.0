Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iA7iy-0002Po-CA
 for ath10k@lists.infradead.org; Tue, 17 Sep 2019 07:16:34 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Use ARRAY_SIZE instead of dividing sizeof array
 with sizeof an element
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1567582878-18739-1-git-send-email-zhongjiang@huawei.com>
References: <1567582878-18739-1-git-send-email-zhongjiang@huawei.com>
Message-Id: <20190917071631.DC02F6156F@smtp.codeaurora.org>
Date: Tue, 17 Sep 2019 07:16:31 +0000 (UTC)
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
To: zhong jiang <zhongjiang@huawei.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, davem@davemloft.net

zhong jiang <zhongjiang@huawei.com> wrote:

> With the help of Coccinelle, ARRAY_SIZE can be replaced in ath10k_snoc_wlan_enable.
> 
> Signed-off-by: zhong jiang <zhongjiang@huawei.com>

I already got an identical patch so dropping this one.

error: patch failed: drivers/net/wireless/ath/ath10k/snoc.c:976
error: drivers/net/wireless/ath/ath10k/snoc.c: patch does not apply
stg import: Diff does not apply cleanly

-- 
https://patchwork.kernel.org/patch/11129531/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
