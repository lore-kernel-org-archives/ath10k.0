Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gt4pw-00024U-IA
 for ath10k@lists.infradead.org; Mon, 11 Feb 2019 06:13:02 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 wireless-drivers-next tree
References: <20190211072814.7428f192@canb.auug.org.au>
Date: Mon, 11 Feb 2019 08:12:52 +0200
In-Reply-To: <20190211072814.7428f192@canb.auug.org.au> (Stephen Rothwell's
 message of "Mon, 11 Feb 2019 07:28:14 +1100")
Message-ID: <87lg2m7t0b.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Govind Singh <govinds@codeaurora.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Wireless <linux-wireless@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org

+ ath10k

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Commit
>
>   768ec4c012ac ("ath10k: update HOST capability qmi message")
>
> is missing a Signed-off-by from its author.

Oh, I had missed that. Thanks for reporting.

Unfortunately it would be difficult to rebase wireless-drivers-next so I
can't (easily) fix this. But v1 had s-o-b so at least we have the sign
off publically available:

https://patchwork.kernel.org/patch/10688563/

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
