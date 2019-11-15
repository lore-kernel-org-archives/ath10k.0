Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVVYe-0000Sr-8d
 for ath10k@lists.infradead.org; Fri, 15 Nov 2019 06:58:18 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Revert "ath10k: add cleanup in ath10k_sta_state()"
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191113202644.3673049-1-bjorn.andersson@linaro.org>
References: <20191113202644.3673049-1-bjorn.andersson@linaro.org>
Message-Id: <20191115065815.59CF46013C@smtp.codeaurora.org>
Date: Fri, 15 Nov 2019 06:58:15 +0000 (UTC)
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
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: wenwen@cs.uga.edu, jeffrey.l.hugo@gmail.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, linux-arm-msm@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Bjorn Andersson <bjorn.andersson@linaro.org> wrote:

> This reverts commit 334f5b61a6f29834e881923b98d1e27e5ce9620d.
> 
> This caused ath10k_snoc on Qualcomm MSM8998, SDM845 and QCS404 platforms to
> trigger an assert in the firmware:
> 
> err_qdi.c:456:EF:wlan_process:1:cmnos_thread.c:3900:Asserted in wlan_vdev.c:_wlan_vdev_up:3219
> 
> Revert the offending commit for now.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

f4fe2e53349f ath10k: Revert "ath10k: add cleanup in ath10k_sta_state()"

-- 
https://patchwork.kernel.org/patch/11242743/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
