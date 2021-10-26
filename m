Return-Path: <SRS0=WP6D=PO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EEDC433F5
	for <ath10k@archiver.kernel.org>; Tue, 26 Oct 2021 12:53:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F275160EDF
	for <ath10k@archiver.kernel.org>; Tue, 26 Oct 2021 12:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F275160EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tpwZepMt1lLk/3NXFN0CaXN9GcCMYwfXH8kmuRlvP/o=; b=cesmCGIpAV6+Xe
	ylmIokmNTzyI4sUgspjeTerQOFOehnqAruCB1zLb5k7W4ndJjAEkBSCXXstJA+1vs4xv3sGTtykad
	MOf+jFl52Qd9Aqi61zHucEyJbb8wVve4GhFy8C2kW+spus+m0npelEFNSTnM52C4Jh7kD1PmPSjBT
	7DqriRjXoeIL15fm/coNFAmDFmlHfRKFpsEzR8dJCiZ+0ZRI9akYnXVZTCJghBkDEIC4KMMUmQ2sA
	vy2OYEpSDVgl3jMzFWLuYkOCtLOvhth4sLf8XiJnX9u86tGaDJh0WvS5NqvFMga2DuddeMMr5G3wK
	dDgPUEZwxpH8ENPD5GoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfLxU-001pIT-PW; Tue, 26 Oct 2021 12:53:40 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfLxS-001pI6-7l
 for ath10k@lists.infradead.org; Tue, 26 Oct 2021 12:53:39 +0000
Received: by mail-oi1-f171.google.com with SMTP id w193so754535oie.1
 for <ath10k@lists.infradead.org>; Tue, 26 Oct 2021 05:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o0sKLuOigkZzRb9mIiQk8+FcI77ASATTLv5/Ga7FhFA=;
 b=xba7oSZvbjtq+CGNkYXhcOp/ghmG1pE1GXmJI5m355XJ4d7iAGGHf3rWLqivESm5qu
 os8iuYVr0XBZ72VWzson+fGBsLwo4//atpFYSRIms4FDhfzKC/TicVqKM30/ZQq10VF1
 DOp65IsofIrOqdjScSyfrDfeLrUWZO75PDJ/NTJh+NtUXKKGZPoiYyMnd89Gb2DmpLna
 beE1zNP9gc5usH2T3C+h4iXZTLirtYWgql9Bl2oUd7aT9y35Vewo26Wrx6SUTSQAEuUx
 BuDvjwJiNL9zXmBmdaz9X93XkHAhzj9UZI+Vt+czT9lSAdG96f1EEMGBks9MlCzPo5oL
 dq8w==
X-Gm-Message-State: AOAM530qqC3oNYmzeBZMGzcBKYgRq/PG9lJbpFWgxE5/A3td9UoDf4dQ
 QpopcKy5AOwQwMy6CCFatA==
X-Google-Smtp-Source: ABdhPJwP8phGmuV03HOFOfdE+cAf7lJnT51ZIqVF78khc0VQIqXv3RKQK4+vTgDjB/WIq+QnAMnzvA==
X-Received: by 2002:a05:6808:144d:: with SMTP id
 x13mr17653853oiv.132.1635252815289; 
 Tue, 26 Oct 2021 05:53:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j6sm3760099oot.18.2021.10.26.05.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 05:53:34 -0700 (PDT)
Received: (nullmailer pid 2444200 invoked by uid 1000);
 Tue, 26 Oct 2021 12:53:33 -0000
Date: Tue, 26 Oct 2021 07:53:33 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH v1 01/15] dt-bindings: add pwrseq device tree bindings
Message-ID: <YXf6TbV2IpPbB/0Y@robh.at.kernel.org>
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
 <20211006035407.1147909-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211006035407.1147909-2-dmitry.baryshkov@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_055338_305429_7785C46F 
X-CRM114-Status: GOOD (  17.64  )
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

On Wed, Oct 06, 2021 at 06:53:53AM +0300, Dmitry Baryshkov wrote:
> Add device tree bindings for the new power sequencer subsystem.
> Consumers would reference pwrseq nodes using "foo-pwrseq" properties.
> Providers would use '#pwrseq-cells' property to declare the amount of
> cells in the pwrseq specifier.

Please use get_maintainers.pl.

This is not a pattern I want to encourage, so NAK on a common binding.

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/power/pwrseq/pwrseq.yaml         | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/pwrseq/pwrseq.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/pwrseq/pwrseq.yaml b/Documentation/devicetree/bindings/power/pwrseq/pwrseq.yaml
> new file mode 100644
> index 000000000000..4a8f6c0218bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/pwrseq/pwrseq.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/pwrseq/pwrseq.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Power Sequencer devices
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +
> +properties:
> +  "#powerseq-cells":
> +    description:
> +      Number of cells in a pwrseq specifier.
> +
> +patternProperties:
> +  ".*-pwrseq$":
> +    description: Power sequencer supply phandle(s) for this node
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    qca_pwrseq: qca-pwrseq {
> +      #pwrseq-cells = <1>;
> +    };
> +
> +    bluetooth {
> +      bt-pwrseq = <&qca_pwrseq 1>;
> +    };
> +...
> -- 
> 2.33.0
> 
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
