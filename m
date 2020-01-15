Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irebP-0004Zz-JG
 for ath10k@lists.infradead.org; Wed, 15 Jan 2020 09:04:43 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 0/2] ath10k: Enable QDSS clock on sm8150
References: <20191223054855.3020665-1-bjorn.andersson@linaro.org>
 <87zhevsrwk.fsf@codeaurora.org>
Date: Wed, 15 Jan 2020 11:04:22 +0200
In-Reply-To: <87zhevsrwk.fsf@codeaurora.org> (Kalle Valo's message of "Fri, 10
 Jan 2020 09:16:11 +0200")
Message-ID: <87r201xf8p.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Kalle Valo <kvalo@codeaurora.org> writes:

> Bjorn Andersson <bjorn.andersson@linaro.org> writes:
>
>> On SM8150 the WiFi firmware depends on the QDSS clock ticking, or the system
>> will reset due to an NoC error. So this adds an optional clock to the ath10k
>> binding and makes sure it's enabled while the WiFi firmware needs it.
>>
>> Bjorn Andersson (2):
>>   ath10k: Add optional qdss clk
>>   arm64: dts: qcom: sm8150: Specify qdss clock for wifi
>>
>>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt          | 2 +-
>>  arch/arm64/boot/dts/qcom/sm8150.dtsi                          | 4 ++--
>>  drivers/net/wireless/ath/ath10k/snoc.c                        | 2 +-
>>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> Via which tree are these supposed to go? I'll take patch 1 and arm
> mantainers take patch 2, or what?

No reply, so I'm planning to take patch 1. Please holler if I
misunderstood.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
