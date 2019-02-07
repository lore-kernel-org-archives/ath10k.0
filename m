Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grl5U-0005Td-QP
 for ath10k@lists.infradead.org; Thu, 07 Feb 2019 14:55:38 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: do not return invalid pointers as a *dentry
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190131131556.GB19807@kroah.com>
References: <20190131131556.GB19807@kroah.com>
Message-Id: <20190207145536.8595D60131@smtp.codeaurora.org>
Date: Thu,  7 Feb 2019 14:55:36 +0000 (UTC)
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
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> When calling debugfs functions, they can now return error values if
> something went wrong.  If that happens, return a NULL as a *dentry to
> the relay core instead of passing it an illegal pointer.
> 
> The relay core should be able to handle an illegal pointer, but add this
> check to be safe.
> 
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Cc: ath10k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

0b38b4b44516 ath10k: do not return invalid pointers as a *dentry

-- 
https://patchwork.kernel.org/patch/10790493/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
