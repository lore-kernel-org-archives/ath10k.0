Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAD0C77B76
	for <ath10k@archiver.kernel.org>; Mon, 17 Apr 2023 14:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FD4wz4JJmxh9lRo2DoOPL9aQsc71/H6s0s38B9LXjHo=; b=Ii37rHvVHHMaXf
	TnLGsB4AGwd4nUCU2LC3bZSeVMD/P+uJPDhH5TOEORaBFSalJ62jtg12WSQ58N1WSnjWS4UNGai6p
	8k8xIf8N2GhjZ2Zmeuh/v6L7ZY/HIfByRo9U4/WdwVlPw41oJJCi3f6hFXzdOYPYDV1Qzn+F1qF91
	Nvv0In2B7+Kb9Wtz1JDx5TmNQE5KnnXdJ9Ttsui294UDK4lN1mD2AoO9J0SnFRWOu1mNcXUyxqOtR
	AkHejl2jXhpIUryCRV0Vr9FoxVxi7Jno9pTeibtHQ15L56FsWYK6hx5zI/V8zkhioYk5JMF20+krB
	Csu225LRlNOw+XP3FrSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poPtl-00Gdcd-1c;
	Mon, 17 Apr 2023 14:32:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poPti-00Gdbl-2Y
	for ath10k@lists.infradead.org;
	Mon, 17 Apr 2023 14:32:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3522E625FC;
	Mon, 17 Apr 2023 14:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56642C433D2;
	Mon, 17 Apr 2023 14:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681741921;
	bh=qZwGgXwj74zjmmmG+1bRkrLbz6C/n830VkCa80+0q3k=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=JQmlZNPpvZPotgMsSrI/tmK/cig3Ot4xYX5389aGKCX/PiT5jEjrKfCv8Jm+uDMWI
	 c422Xpq/411fGx3ag+rZGXz4KCg9ggPtmB1Xh+WdYAcgCZ8t+EzRBFDPUuMXi8uHj2
	 KdQuFpfBcnP558W9jb0B5KV4DctWHI2P9Gd0qJxS9y24usT+Ep/sas5ERx0nSwctks
	 udSDeGzoN/IBqVsTpyRUGnTo18pMz4V7E0Q+dlXBABP6OA4e/U/guFB8Q+vCr7iocD
	 pGdeL594bigrJ629aefx4p2wViv2KD7udJQKqpsJ41slSlIhFseUxdFTvz2LPorUlZ
	 0XUk0YPJYVRCQ==
From: Kalle Valo <kvalo@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Rob Herring <robh+dt@kernel.org>,  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Andy Gross <agross@kernel.org>,  Bjorn Andersson <andersson@kernel.org>,  Marijn Suijten <marijn.suijten@somainline.org>,  ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,  linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: net: Convert ATH10K to YAML
References: <20230406-topic-ath10k_bindings-v4-1-9f67a6bb0d56@linaro.org>
	<87pm82x1ew.fsf@kernel.org>
	<8a6834d6-8e5a-3c48-8a04-8d9c4d160408@linaro.org>
Date: Mon, 17 Apr 2023 17:31:56 +0300
In-Reply-To: <8a6834d6-8e5a-3c48-8a04-8d9c4d160408@linaro.org> (Konrad
	Dybcio's message of "Mon, 17 Apr 2023 15:36:59 +0200")
Message-ID: <878reqwper.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_073202_902544_F5A89B9A 
X-CRM114-Status: GOOD (  16.94  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Konrad Dybcio <konrad.dybcio@linaro.org> writes:

> On 17.04.2023 12:12, Kalle Valo wrote:
>> Konrad Dybcio <konrad.dybcio@linaro.org> writes:
>> 
>>> qcom,coexist-support and qcom,coexist-gpio-pin do very little and should
>>> be reconsidered on the driver side, especially the latter one.
>> 
>> I'm curious, what do you mean very little? We set ath10k firmware
>> parameters based on these coex properties. How would you propose to
>> handle these?
>
> Right, I first thought they did nothing and then realized they're
> sent to the fw.. I never amended the commit message though..

Ok, I can remove that sentence before I commit the patch.

>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
>>> @@ -0,0 +1,358 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm Technologies ATH10K wireless devices
>> 
>> [...]
>> 
>>> +  wifi-firmware:
>>> +    type: object
>>> +    additionalProperties: false
>>> +    description: |
>>> +      The ATH10K Wi-Fi node can contain one optional firmware subnode.
>>> +      Firmware subnode is needed when the platform does not have Trustzone.
>> 
>> Is there a reason why you write ath10k in upper case? There are two case
>> of that in the yaml file. We usually write it in lower case, can I
>> change to that?
>
> No particular reason, my brain just implicitly decided that it
> should be this way.. Please unify it (or LMK if you want me to
> perform another resend)!

No need to resend. I already changed these to lower case in my pending
branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=ca448a93d8669a3af5aa644725444aa61b4ca255

I'll remove the coex sentence later.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
