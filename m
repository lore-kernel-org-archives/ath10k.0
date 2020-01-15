Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iroCj-0004ce-8J
 for ath10k@lists.infradead.org; Wed, 15 Jan 2020 19:19:53 +0000
Received: by mail-pg1-x544.google.com with SMTP id l24so8656096pgk.2
 for <ath10k@lists.infradead.org>; Wed, 15 Jan 2020 11:19:48 -0800 (PST)
Date: Wed, 15 Jan 2020 11:19:45 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/2] ath10k: Enable QDSS clock on sm8150
Message-ID: <20200115191945.GM1214176@minitux>
References: <20191223054855.3020665-1-bjorn.andersson@linaro.org>
 <87zhevsrwk.fsf@codeaurora.org>
 <87r201xf8p.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r201xf8p.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

On Wed 15 Jan 01:04 PST 2020, Kalle Valo wrote:

> Kalle Valo <kvalo@codeaurora.org> writes:
> 
> > Bjorn Andersson <bjorn.andersson@linaro.org> writes:
> >
> >> On SM8150 the WiFi firmware depends on the QDSS clock ticking, or the system
> >> will reset due to an NoC error. So this adds an optional clock to the ath10k
> >> binding and makes sure it's enabled while the WiFi firmware needs it.
> >>
> >> Bjorn Andersson (2):
> >>   ath10k: Add optional qdss clk
> >>   arm64: dts: qcom: sm8150: Specify qdss clock for wifi
> >>
> >>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt          | 2 +-
> >>  arch/arm64/boot/dts/qcom/sm8150.dtsi                          | 4 ++--
> >>  drivers/net/wireless/ath/ath10k/snoc.c                        | 2 +-
> >>  3 files changed, 4 insertions(+), 4 deletions(-)
> >
> > Via which tree are these supposed to go? I'll take patch 1 and arm
> > mantainers take patch 2, or what?

That sounds good (you take the ath10k and we'll take the dts).

> 
> No reply, so I'm planning to take patch 1. Please holler if I
> misunderstood.
> 

Sorry.

Regards,
Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
