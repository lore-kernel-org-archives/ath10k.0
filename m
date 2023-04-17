Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73215C77B70
	for <ath10k@archiver.kernel.org>; Mon, 17 Apr 2023 10:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5yn5da3JfrTfgLtg9++eor3n0W1nKpRQVza50CWDauw=; b=GE2b5138D6Xbpm
	8UJ2d+Jf0WQGEYvkXcd7Y7ythgeF1bfPqK2bm2MYOogOa7QNjBlux4omEn/XED+wCnMXDw6NI7BEK
	oXPKVcRgYbbAQsIQDu47jMROkjwwKP5uyUM2sZcyXe5U0+cIjw+2zwAOttQ7KmhdFaYvZmITsmsbb
	Pz82Yg/e3iF3/7Zz/573G5Nx+w4lDdWFe3Jn8RA+5KyWgekl2SixgwzAQab6lVQ9GoEqpxhzlvYON
	ojlsdEDfrc0eYhWMd+xl+Vl7v9MoR0pQbCDJsHyfVhJxiVwt1Pz3+FAJ8dHyCzyflMmj2yG6cjvpb
	bzlG/5X3wLUGoTYNYGQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poLqv-00Fh4j-1C;
	Mon, 17 Apr 2023 10:12:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poLqq-00Fh3d-0J
	for ath10k@lists.infradead.org;
	Mon, 17 Apr 2023 10:12:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0AC0C611E6;
	Mon, 17 Apr 2023 10:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC68C433D2;
	Mon, 17 Apr 2023 10:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681726366;
	bh=GRAa2RVEdoP6sWFZTaUzor42MJUN7cAoBncwKS2n97w=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tUaLe0MUroPoDEhW71YLn96ifF/ylQ2u0qpI06Wi+jenuZJ1Yu39UVc/9jX0B3pk/
	 bWnIC3Tlu3aRcrLzxjRcxVB0CXYgPUHh1c3tKwfPBHFXirI5lH7E5PVL6bLQs0uP6d
	 bTMvxjN/ikO0GS6PP59POWkGeyEkja8rmfTnG46HIk6Ri3JNAOevyl/59C9RfgeQGg
	 FR3zJ1e5M89rXAoD3wf5Y3tsdTNRI6mW/d+aSvpvvJHTfw6j+hmbOQD8ibVJ9kfOKC
	 OskbZ+jaXv5z5J8qurxK/M9V480VClSYqj3x9ODtaKYCHrnEtRX35sElQa4Zr0qjk1
	 iao4t/5D/nOkg==
From: Kalle Valo <kvalo@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Rob Herring <robh+dt@kernel.org>,  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Andy Gross <agross@kernel.org>,  Bjorn Andersson <andersson@kernel.org>,  Marijn Suijten <marijn.suijten@somainline.org>,  ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,  linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: net: Convert ATH10K to YAML
References: <20230406-topic-ath10k_bindings-v4-1-9f67a6bb0d56@linaro.org>
Date: Mon, 17 Apr 2023 13:12:39 +0300
In-Reply-To: <20230406-topic-ath10k_bindings-v4-1-9f67a6bb0d56@linaro.org>
	(Konrad Dybcio's message of "Tue, 11 Apr 2023 20:19:22 +0200")
Message-ID: <87pm82x1ew.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_031248_192156_A483FBD0 
X-CRM114-Status: GOOD (  17.54  )
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

> Convert the ATH10K bindings to YAML.
>
> Dropped properties that are absent at the current state of mainline:
> - qcom,msi_addr
> - qcom,msi_base

Very good, thanks. Clearly I had missed that those were unused during
the review.

> qcom,coexist-support and qcom,coexist-gpio-pin do very little and should
> be reconsidered on the driver side, especially the latter one.

I'm curious, what do you mean very little? We set ath10k firmware
parameters based on these coex properties. How would you propose to
handle these?

> Somewhat based on the ath11k bindings.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

[...]

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
> @@ -0,0 +1,358 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies ATH10K wireless devices

[...]

> +  wifi-firmware:
> +    type: object
> +    additionalProperties: false
> +    description: |
> +      The ATH10K Wi-Fi node can contain one optional firmware subnode.
> +      Firmware subnode is needed when the platform does not have Trustzone.

Is there a reason why you write ath10k in upper case? There are two case
of that in the yaml file. We usually write it in lower case, can I
change to that?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
