Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVVZP-0000aZ-3j
 for ath10k@lists.infradead.org; Fri, 15 Nov 2019 06:59:04 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: qmi: Sleep for a while before assigning MSA memory
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191113233558.4040259-1-bjorn.andersson@linaro.org>
References: <20191113233558.4040259-1-bjorn.andersson@linaro.org>
Message-Id: <20191115065902.BE89960FF0@smtp.codeaurora.org>
Date: Fri, 15 Nov 2019 06:59:02 +0000 (UTC)
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
Cc: govinds@codeaurora.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, linux-arm-msm@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Bjorn Andersson <bjorn.andersson@linaro.org> wrote:

> Unless we sleep for a while before transitioning the MSA memory to WLAN
> the MPSS.AT.4.0.c2-01184-SDM845_GEN_PACK-1 firmware triggers a security
> violation fairly reliably. Unforutnately recovering from this failure
> always results in the entire system freezing.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

b70b3a36ec33 ath10k: qmi: Sleep for a while before assigning MSA memory

-- 
https://patchwork.kernel.org/patch/11242883/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
