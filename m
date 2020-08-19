Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8S15-0001eF-M1
 for ath10k@lists.infradead.org; Wed, 19 Aug 2020 17:36:52 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/2] ath10k: add bus type for each layout of coredump
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1569310030-834-2-git-send-email-wgong@codeaurora.org>
References: <1569310030-834-2-git-send-email-wgong@codeaurora.org>
Message-Id: <20200819173649.B3A7AC433CA@smtp.codeaurora.org>
Date: Wed, 19 Aug 2020 17:36:49 +0000 (UTC)
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> wrote:

> For some hw version, it has more than one bus type, it need to add bus
> type to distinguish different chip.
> 
> Tested-on: QCA6174 SDIO WLAN.RMH.4.4.1-00018-QCARMSWP-1
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

c796d513c6ae ath10k: add bus type for each layout of coredump
3c45f21af84e ath10k: sdio: add firmware coredump support

-- 
https://patchwork.kernel.org/patch/11158043/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
