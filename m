Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga1mO-0003c6-AR
 for ath10k@lists.infradead.org; Thu, 20 Dec 2018 17:06:37 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Move non-fatal warn logs to dbg level
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20181129042522.11767-1-govinds@codeaurora.org>
References: <20181129042522.11767-1-govinds@codeaurora.org>
Message-Id: <20181220170624.646E0602CB@smtp.codeaurora.org>
Date: Thu, 20 Dec 2018 17:06:24 +0000 (UTC)
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Govind Singh <govinds@codeaurora.org> wrote:

> During driver load below warn logs are printed in the console.
> Since driver may not implement all wmi events sent by fw and
> all of them are non-fatal, move this log to debug level to
> remove un-necessary warn message on console.
> 
> [  361.887230] ath10k_snoc a000000.wifi: Unknown eventid: 16393
> [  361.907037] ath10k_snoc a000000.wifi: Unknown eventid: 237569
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

bd085be6ba95 ath10k: move non-fatal warn logs to dbg level

-- 
https://patchwork.kernel.org/patch/10703901/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
