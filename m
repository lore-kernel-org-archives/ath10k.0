Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfl42-0008W9-QB
 for ath10k@lists.infradead.org; Tue, 25 Jun 2019 13:00:48 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Change the warning message string
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190509121500.4730-1-festevam@gmail.com>
References: <20190509121500.4730-1-festevam@gmail.com>
Message-Id: <20190625130045.57209606DC@smtp.codeaurora.org>
Date: Tue, 25 Jun 2019 13:00:45 +0000 (UTC)
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
To: Fabio Estevam <festevam@gmail.com>
Cc: andreyknvl@google.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, gregkh@linuxfoundation.org

Fabio Estevam <festevam@gmail.com> wrote:

> The "WARNING" string confuses syzbot, which thinks it found
> a crash [1].
> 
> Change the string to avoid such problem.
> 
> [1] https://lkml.org/lkml/2019/5/9/243
> 
> Reported-by: syzbot+c1b25598aa60dcd47e78@syzkaller.appspotmail.com
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

265df32eae58 ath10k: Change the warning message string

-- 
https://patchwork.kernel.org/patch/10937077/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
