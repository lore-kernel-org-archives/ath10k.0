Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL7Uw-0005vl-VT
 for ath10k@lists.infradead.org; Mon, 29 Apr 2019 14:43:17 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix incorrect multicast/broadcast rate setting
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1544504171-19810-1-git-send-email-pradeepc@codeaurora.org>
References: <1544504171-19810-1-git-send-email-pradeepc@codeaurora.org>
Message-Id: <20190429144314.857BD608CC@smtp.codeaurora.org>
Date: Mon, 29 Apr 2019 14:43:14 +0000 (UTC)
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: Zhi Chen <zhichen@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> wrote:

> Invalid rate code is sent to firmware when multicast rate value of 0 is
> sent to driver indicating disabled case, causing broken mesh path.
> so fix that.
> 
> Tested on QCA9984 with firmware 10.4-3.6.1-00827
> 
> Sven tested on IPQ4019 with 10.4-3.5.3-00057 and QCA9888 with 10.4-3.5.3-00053
> (ath10k-firmware) and 10.4-3.6-00140 (linux-firmware 2018-12-16-211de167).
> 
> Fixes: cd93b83ad92 ("ath10k: support for multicast rate control")
> Co-developed-by: Zhi Chen <zhichen@codeaurora.org>
> Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> Tested-by: Sven Eckelmann <sven@narfation.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

93ee3d108fc7 ath10k: fix incorrect multicast/broadcast rate setting

-- 
https://patchwork.kernel.org/patch/10723033/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
