Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL7kV-0003fw-2p
 for ath10k@lists.infradead.org; Mon, 29 Apr 2019 14:59:20 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath: DFS JP domain W56 fixed pulse type 3 RADAR detection
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1551893771-22485-1-git-send-email-tamizhr@codeaurora.org>
References: <1551893771-22485-1-git-send-email-tamizhr@codeaurora.org>
Message-Id: <20190429145918.B155B607DF@smtp.codeaurora.org>
Date: Mon, 29 Apr 2019 14:59:18 +0000 (UTC)
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
To: Tamizh chelvam <tamizhr@codeaurora.org>
Cc: Anilkumar Kolli <akolli@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Tamizh chelvam <tamizhr@codeaurora.org> wrote:

> Increase pulse width range from 1-2usec to 0-4usec.
> During data traffic HW occasionally fails detecting radar pulses,
> so that SW cannot get enough radar reports to achieve the success rate.
> 
> Tested ath10k hw and fw:
> 	* QCA9888(10.4-3.5.1-00052)
> 	* QCA4019(10.4-3.2.1.1-00017)
> 	* QCA9984(10.4-3.6-00104)
> 	* QCA988X(10.2.4-1.0-00041)
> 
> Tested ath9k hw: AR9300
> 
> Tested-by: Tamizh chelvam <tamizhr@codeaurora.org>
> Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

d8792393a783 ath: DFS JP domain W56 fixed pulse type 3 RADAR detection

-- 
https://patchwork.kernel.org/patch/10841487/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
