Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivf6b-0002TV-GK
 for ath10k@lists.infradead.org; Sun, 26 Jan 2020 10:25:28 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k: Add optional qdss clk
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191223054855.3020665-2-bjorn.andersson@linaro.org>
References: <20191223054855.3020665-2-bjorn.andersson@linaro.org>
Message-Id: <20200126102521.BC7FFC433CB@smtp.codeaurora.org>
Date: Sun, 26 Jan 2020 10:25:21 +0000 (UTC)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>, ath10k@lists.infradead.org, linux-arm-msm@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Bjorn Andersson <bjorn.andersson@linaro.org> wrote:

> The WiFi firmware found on sm8150 requires that the QDSS clock is
> ticking in order to operate, so add an optional clock to the binding to
> allow this to be specified in the sm8150 dts and add the clock to the
> list of clocks in the driver.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

57a3b60ddbfa ath10k: Add optional qdss clk

-- 
https://patchwork.kernel.org/patch/11307779/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
