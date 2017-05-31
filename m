Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dG31e-0006BX-O8
 for ath10k@lists.infradead.org; Wed, 31 May 2017 12:47:00 +0000
MIME-Version: 1.0
Subject: Re: [3/3] ath10k: Log when longer bmi cmds happen.
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1494883540-18558-3-git-send-email-greearb@candelatech.com>
References: <1494883540-18558-3-git-send-email-greearb@candelatech.com>
Message-ID: <1397d1d690d84c178290b6e06f92bf27@euamsexm01a.eu.qualcomm.com>
Date: Wed, 31 May 2017 14:46:31 +0200
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
Cc: ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> wrote:

> This lets one have a clue that maybe timeouts are happening
> when we just aren't waiting long enough.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

I did some cosmetic changes and ret is now initialised after the loop:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=13e31da60b738512ab1ac4429789d79a983ae5be

-- 
https://patchwork.kernel.org/patch/9727991/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
