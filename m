Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCJjz-0006KH-Df
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 08:30:40 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix memory leak
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190920013632.30796-1-navid.emamdoost@gmail.com>
References: <20190920013632.30796-1-navid.emamdoost@gmail.com>
Message-Id: <20190923083038.AE7F26074F@smtp.codeaurora.org>
Date: Mon, 23 Sep 2019 08:30:38 +0000 (UTC)
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
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Cc: linux-wireless@vger.kernel.org, kjlu@umn.edu, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, emamd001@umn.edu, smccaman@umn.edu, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Navid Emamdoost <navid.emamdoost@gmail.com> wrote:

> In ath10k_usb_hif_tx_sg the allocated urb should be released if
> usb_submit_urb fails.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

b8d17e7d93d2 ath10k: fix memory leak

-- 
https://patchwork.kernel.org/patch/11153699/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
