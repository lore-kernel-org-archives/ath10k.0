Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHQPj-0006Zw-Dv
 for ath10k@lists.infradead.org; Sat, 12 May 2018 09:02:04 +0000
MIME-Version: 1.0
Subject: Re: ath10k: add quiet mode support for QCA6174/QCA9377
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1525327285-15392-2-git-send-email-yyuwang@codeaurora.org>
References: <1525327285-15392-2-git-send-email-yyuwang@codeaurora.org>
Message-Id: <20180512090152.DBF4C6079C@smtp.codeaurora.org>
Date: Sat, 12 May 2018 09:01:52 +0000 (UTC)
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
To: Yu Wang <yyuwang@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Yu Wang <yyuwang@codeaurora.org> wrote:

> To enable thermal throttling for QCA6174 and QCA9377,
> implement gen_pdev_set_quiet_mode for them.
> With this change, quiet period for QCA6174/QCA9377 can
> be also set/get via debugfs.
> Usage:
> To set quiet period:
>  echo <period> > /sys/kernel/debug/ieee80211/phyX/ath10k/quiet_period
> To get the current quiet period:
>  cat /sys/kernel/debug/ieee80211/phyX/ath10k/quiet_period
> 
> This change has been verified with
> QCA6174 hw3.2(fw: WLAN_RM.4.4.1-00102-QCARMSWP-1).
> 
> Signed-off-by: Yu Wang <yyuwang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

cfb353c0dc05 ath10k: add quiet mode support for QCA6174/QCA9377

-- 
https://patchwork.kernel.org/patch/10377083/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
