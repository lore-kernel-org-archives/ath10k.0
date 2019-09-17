Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAE61-0000dW-OH
 for ath10k@lists.infradead.org; Tue, 17 Sep 2019 14:04:47 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath10k: snoc: skip regulator operations
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190725174755.23432-2-bjorn.andersson@linaro.org>
References: <20190725174755.23432-2-bjorn.andersson@linaro.org>
Message-Id: <20190917140445.4BB4661424@smtp.codeaurora.org>
Date: Tue, 17 Sep 2019 14:04:45 +0000 (UTC)
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
Cc: Govind Singh <govinds@codeaurora.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, linux-arm-msm@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Bjorn Andersson <bjorn.andersson@linaro.org> wrote:

> The regulator operations is trying to set a voltage to a fixed value, by
> giving some wiggle room. But some board designs specifies regulator
> voltages outside this limited range. One such example is the Lenovo Yoga
> C630, with vdd-3.3-ch0 in particular specified at 3.1V.
> 
> But consumers with fixed voltage requirements should just rely on the
> board configuration to provide the power at the required level, so this
> code should be removed.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath-next branch of ath.git, thanks.

b003e7f1974e ath10k: snoc: skip regulator operations
c56c7f24d7f8 ath10k: Use standard regulator bulk API in snoc
f93bcf0ce6a1 ath10k: Use standard bulk clock API in snoc

-- 
https://patchwork.kernel.org/patch/11059507/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
