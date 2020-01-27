Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iw9JQ-0000a7-1l
 for ath10k@lists.infradead.org; Mon, 27 Jan 2020 18:40:41 +0000
MIME-Version: 1.0
In-Reply-To: <20191223054855.3020665-1-bjorn.andersson@linaro.org>
References: <20191223054855.3020665-1-bjorn.andersson@linaro.org>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 0/2] ath10k: Enable QDSS clock on sm8150
Date: Mon, 27 Jan 2020 10:40:36 -0800
Message-Id: <20200127184037.3BFB620CC7@mail.kernel.org>
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
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2019-12-22 21:48:53)
> On SM8150 the WiFi firmware depends on the QDSS clock ticking, or the system
> will reset due to an NoC error. So this adds an optional clock to the ath10k
> binding and makes sure it's enabled while the WiFi firmware needs it.

Hopefully this isn't a requirement in production firmware? Seems
wasteful to keep the debug clk enabled in the field when nobody is
debugging anything.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
