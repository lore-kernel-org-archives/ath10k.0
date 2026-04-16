Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EBDF8A154
	for <ath10k@archiver.kernel.org>; Thu, 16 Apr 2026 10:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StUmw+VWigYj7b9CbzCzolN8uC+xmf43R5kKEaP2dK4=; b=4+uI/SFcZgXPRHHzjpLI8RhH/Y
	j75afGKkuFx9Mlxd0IuEm1aQnP0qp05bKWKsHD1ydlvto4VkKTPW9H3hAf/07EjysSdKk9czkkzuv
	hEfkyRxdMtKKK9WrG7JXI4h4N5n6hW7hIPcB1YmV1arzYCbSVKmXvidNcxDDhLwHx2OF8D6tvUwtf
	AW7k4E33EcATuEgRMppNJ0qEd78+sgo+Fp0x1XCFtkbTRWijHjp8T0+YkHd1UeV6zVXkSYdZbX/ot
	p+S75eEnb6w5qoiJsZZ77hiOxVB3Rw6eMn0FzKPsYb/on2U0h3+1X9ZocwDlwUx3w4H+0OV67xTN2
	b6cKeV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJc5-00000002HYS-2elU;
	Thu, 16 Apr 2026 10:06:21 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJc2-00000002HY1-1rCa
	for ath10k@lists.infradead.org;
	Thu, 16 Apr 2026 10:06:19 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-671d60ef9c6so4005694a12.2
        for <ath10k@lists.infradead.org>; Thu, 16 Apr 2026 03:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776333976; x=1776938776; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StUmw+VWigYj7b9CbzCzolN8uC+xmf43R5kKEaP2dK4=;
        b=qNFaGSTXDdR6nRKxsxWZ6Z49eBnJ84X4xAAv5OjNawnhaUT+VUrZvmMHaN6qWy1CT6
         6F4Ioux1wsw0+xREvznVgsfEJ4tPnAejo/4sCYCUV6P+CDY+KgJjZDEVwh2XKXdmcKdA
         s8TmerrZtzoTW/s5521PPJi0OJGE5Lc83De4Dh8k/jbqyfFb9jG6mz7vzH0UAmA1RXjO
         4tCEda742NwgC3o/nPAYTBTYmy/j86z2Sua9PXFPQ7SgReJTwWMHq0RkmiyR/thIgv1N
         6b3TBIpAykBUUMd3EtLvQ0cgZu9HuQDUO8pzTLRg8jf3SW6sel8/ZGWXNmkF5hJhYYWy
         7oSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776333976; x=1776938776;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=StUmw+VWigYj7b9CbzCzolN8uC+xmf43R5kKEaP2dK4=;
        b=BplP1eQbq4JmUXOims7LRX/sntG5m248b2r7NNV8Zg/VMmBzBc7qnlabaO9JiOWYYS
         eUAHZKXIQwdM4CZUQZm6XGodL73b8lHr58B4JVDad2i1xBYUDmkl7a7MuRYmMqacz5aZ
         DN7PLDZmqzUdlNJITfEye/IcvCCQYY72orD3aXZwk4L0fl+4bzPAEsr4duNB+o8qJcxj
         TP/chjsGgdc+iHwl9MhsEk11KuAnFKEqEMGmOCzRgwl038SXOdoyXWynqbhZHKYuODIR
         a2IztjByHCbr/X47dTDy0WKOTFpEz3oOxyxDuxP/mrl3WSEjwmo42kW19NJHkX0CtR7+
         tpiw==
X-Forwarded-Encrypted: i=1; AFNElJ+9LYI4s5EGXwuBKUkhaHLOCZRXFHv26Jnn8H3QnSckUS/ptS31t3vQaHzsU5xn5rO7nQskM/M=@lists.infradead.org
X-Gm-Message-State: AOJu0YyKMDiyEoeMq6nkLUpkYQ+H5jNKHYjuzQdXXzarQnjmK5pxlHEQ
	iWOQyfF42pnG0LpA3UogicTXX1Uv7TOv8xH9CtD64mP4WYfC9jUV1au34caoOveEVBE=
X-Gm-Gg: AeBDieuxl/vHqsHlS4mXJpGYwDe9KqVVjOkVbj33CRijh+09tVVcuLVuK7XBtzPD77O
	B3XbPQD/4V+QidhEqcV1n8yx3Q4eOhiTH7K7maNFEDuFLHkaf9F8+p0zhsXZTjg8bVmm0HRcXIv
	hsmi4+JP91grb79N8oSUJOI4z4vO1nfTPkM58oR2+5wK4r+ofm/hyJEcfd6fleIebAhLccZI4O4
	aqESi8kBpQwyQHrmGmTbRgEIH/wsBFNDXnQaQ1W4IPSx3ENjQ79Nh+zAaJ/hObVdzyTENuH1bgy
	Bog0k3IgmKyzIZqLFIHWrExyotDCL49XcxMyDPDT9yjPcwOvBBKzxWBf7RHTIA/jxIuEkDB5SkW
	QTTtsZ1Tvmsro/kg7dNagoZt795NfISWFcyoZGSXn4RtCQ9NPrbPx1zVnSc1UMQafJ+5XsvtDXw
	W16e1hxsPy0IkvXADDfpI5KOW8xACdpbpsFJN9vl9e3WMnlU8VBjkUjLKWqAvMFiOVbiFDRAwjl
	0qoDnU=
X-Received: by 2002:a05:6402:548c:b0:66e:f4c0:c348 with SMTP id 4fb4d7f45d1cf-6707898ffc1mr11228460a12.7.1776333975499;
        Thu, 16 Apr 2026 03:06:15 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237d79258sm1152533a12.4.2026.04.16.03.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 03:06:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Apr 2026 12:06:09 +0200
Message-Id: <DHUHU7UIT487.139L3KIVRVREU@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-bluetooth@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <ath10k@lists.infradead.org>,
 <linux-pm@vger.kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/8] wifi: ath10k: snoc: support powering on the
 device via pwrseq
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>,
 "Marcel Holtmann" <marcel@holtmann.org>, "Luiz Augusto von Dentz"
 <luiz.dentz@gmail.com>, "Jeff Johnson" <jjohnson@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Manivannan Sadhasivam" <mani@kernel.org>, "Vinod
 Koul" <vkoul@kernel.org>, "Balakrishna Godavarthi"
 <quic_bgodavar@quicinc.com>, "Matthias Kaehlcke" <mka@chromium.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
 <20260119-wcn3990-pwrctl-v3-3-948df19f5ec2@oss.qualcomm.com>
In-Reply-To: <20260119-wcn3990-pwrctl-v3-3-948df19f5ec2@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_030618_624852_BF0ECAB0 
X-CRM114-Status: GOOD (  26.88  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi Dmitry,

On Mon Jan 19, 2026 at 6:07 PM CET, Dmitry Baryshkov wrote:
> The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
> voltages over internal rails. Implement support for using powersequencer
> for this family of ATH10k devices in addition to using regulators.
>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c | 53 ++++++++++++++++++++++++++++=
++++--
>  drivers/net/wireless/ath/ath10k/snoc.h |  3 ++
>  2 files changed, 53 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireles=
s/ath/ath10k/snoc.c
> index b3f6424c17d3..f72f236fb9eb 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: ISC
>  /*
>   * Copyright (c) 2018 The Linux Foundation. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
> =20
>  #include <linux/bits.h>
> @@ -11,6 +12,7 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/remoteproc/qcom_rproc.h>
>  #include <linux/of_reserved_mem.h>
> @@ -1023,10 +1025,14 @@ static int ath10k_hw_power_on(struct ath10k *ar)
> =20
>  	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power on\n");
> =20
> -	ret =3D regulator_bulk_enable(ar_snoc->num_vregs, ar_snoc->vregs);
> +	ret =3D pwrseq_power_on(ar_snoc->pwrseq);
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D regulator_bulk_enable(ar_snoc->num_vregs, ar_snoc->vregs);
> +	if (ret)
> +		goto pwrseq_off;
> +
>  	ret =3D clk_bulk_prepare_enable(ar_snoc->num_clks, ar_snoc->clks);
>  	if (ret)
>  		goto vreg_off;
> @@ -1035,18 +1041,28 @@ static int ath10k_hw_power_on(struct ath10k *ar)
> =20
>  vreg_off:
>  	regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
> +pwrseq_off:
> +	pwrseq_power_off(ar_snoc->pwrseq);
> +
>  	return ret;
>  }
> =20
>  static int ath10k_hw_power_off(struct ath10k *ar)
>  {
>  	struct ath10k_snoc *ar_snoc =3D ath10k_snoc_priv(ar);
> +	int ret_seq =3D 0;
> +	int ret_vreg;
> =20
>  	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power off\n");
> =20
>  	clk_bulk_disable_unprepare(ar_snoc->num_clks, ar_snoc->clks);
> =20
> -	return regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
> +	ret_vreg =3D regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs)=
;
> +
> +	if (ar_snoc->pwrseq)
> +		ret_seq =3D pwrseq_power_off(ar_snoc->pwrseq);
> +
> +	return ret_vreg ? : ret_seq;
>  }
> =20
>  static void ath10k_snoc_wlan_disable(struct ath10k *ar)
> @@ -1762,7 +1778,38 @@ static int ath10k_snoc_probe(struct platform_devic=
e *pdev)
>  		goto err_release_resource;
>  	}
> =20
> -	ar_snoc->num_vregs =3D ARRAY_SIZE(ath10k_regulators);
> +	/*
> +	 * devm_pwrseq_get() can return -EPROBE_DEFER in two cases:
> +	 * - it is not supposed to be used
> +	 * - it is supposed to be used, but the driver hasn't probed yet.
> +	 *
> +	 * There is no simple way to distinguish between these two cases, but:
> +	 * - if it is not supposed to be used, then regulator_bulk_get() will
> +	 *   return all regulators as expected, continuing the probe
> +	 * - if it is supposed to be used, but wasn't probed yet, we will get
> +	 *   -EPROBE_DEFER from regulator_bulk_get() too.
> +	 *
> +	 * For backwards compatibility with DTs specifying regulators directly
> +	 * rather than using the PMU device, ignore the defer error from
> +	 * pwrseq.
> +	 */
> +	ar_snoc->pwrseq =3D devm_pwrseq_get(&pdev->dev, "wlan");
> +	if (IS_ERR(ar_snoc->pwrseq)) {
> +		ret =3D PTR_ERR(ar_snoc->pwrseq);
> +		ar_snoc->pwrseq =3D NULL;
> +		if (ret !=3D -EPROBE_DEFER)
> +			goto err_free_irq;

I'm fairly sure this is now broken with CONFIG_POWER_SEQUENCING=3Dn since
then pwrseq_get() is returning ERR_PTR(-ENOSYS) which is not handled
here.

I'm observing my ath10k_snoc is now failing to probe "with error -38"
which definitely seems to be related, but I haven't debugged it further
yet.

Regards
Luca

