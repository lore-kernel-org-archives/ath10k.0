Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from gateway30.websitewelcome.com ([192.185.148.2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWXrB-0000eJ-JZ
 for ath10k@lists.infradead.org; Thu, 07 May 2020 04:09:59 +0000
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway30.websitewelcome.com (Postfix) with ESMTP id 0625BB217
 for <ath10k@lists.infradead.org>; Wed,  6 May 2020 23:09:36 -0500 (CDT)
Subject: Re: [PATCH] ath10k: Replace zero-length array with flexible-array
References: <20200504201108.GA32136@embeddedor>
 <20200505075126.86A73C432C2@smtp.codeaurora.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <b61af6d1-7ea8-a3a0-cb76-23d16b8ca321@embeddedor.com>
Date: Wed, 6 May 2020 23:13:58 -0500
MIME-Version: 1.0
In-Reply-To: <20200505075126.86A73C432C2@smtp.codeaurora.org>
Content-Language: en-US
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org

Kalle,

On 5/5/20 02:51, Kalle Valo wrote:

> 
> Fails to apply, please rebase on top of ath.git master branch.
> 
> error: patch failed: drivers/net/wireless/ath/ath10k/pci.h:182
> error: drivers/net/wireless/ath/ath10k/pci.h: patch does not apply
> stg import: Diff does not apply cleanly
> 
> Patch set to Changes Requested.
> 

Sorry for the late reply. I've had some troubles with my email
settings and LKML, recently.

I've just sent v2:

https://lore.kernel.org/lkml/20200507041127.GA31587@embeddedor/

Thanks
--
Gustavo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
