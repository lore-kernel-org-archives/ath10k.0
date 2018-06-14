Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTTs9-0004Mv-AX
 for ath10k@lists.infradead.org; Thu, 14 Jun 2018 15:09:14 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Support use of channel 173
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1514940661-13590-1-git-send-email-greearb@candelatech.com>
References: <1514940661-13590-1-git-send-email-greearb@candelatech.com>
Message-Id: <20180614150902.DF8A260116@smtp.codeaurora.org>
Date: Thu, 14 Jun 2018 15:09:02 +0000 (UTC)
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> wrote:

> The India regulatory domain allows CH 173, so add that to the
> available channel list.  I verified basic connectivity between
> a 9880 and 9984 NIC.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

38441fb6fcbb ath10k: support use of channel 173

-- 
https://patchwork.kernel.org/patch/10141515/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
