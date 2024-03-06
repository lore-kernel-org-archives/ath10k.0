Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650FDC54E41
	for <ath10k@archiver.kernel.org>; Wed,  6 Mar 2024 09:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WcNDbMiDRaFRZjIoKWGwCgVzRzsBJPXDZkV/USE+tmQ=; b=NOpavBOheWdiYdfSy6/s+DmsJC
	9i95Qib5Oyypy17j7Dy7ZTbqqJkoRvDef1E6Zg11zsXG1tVCvrrLqTzGo9cIBEOQrGxTLpxurXFi9
	c0tLaP9iYSp1UNjekGQbSv5X5SM3wcHv/dD8m+1K2NI10PH6czFvL4XQIG0yB6NVX4V7KOQyD0TQg
	rQdGGpHS26sIHY6ifWwq9JKPTQneZfNWrHZYzRuA3WosY8B5lBXF49cFhlSNQv3OgeBuAY+U40fJT
	Q4T5CDmREW+QKfvRz1qRxZ1+EQv7h2jVWQjDWM5LGvBXGhY63xNAt6Po9skKg5ZiSEZqhFC4M52YC
	JAHnEfDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhnAU-0000000H302-0Kqo;
	Wed, 06 Mar 2024 09:02:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhnAQ-0000000H2y8-1R1F
	for ath10k@lists.infradead.org;
	Wed, 06 Mar 2024 09:02:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 67AD7CE2145;
	Wed,  6 Mar 2024 09:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56649C43390;
	Wed,  6 Mar 2024 09:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709715743;
	bh=pr7f95H/+sMoxZtOtUu1wtvZwxTvJ5iV+D3khX3JPOo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VqRh2GP2Zlsd0Xikqogu0ime1ENHl2Scd6+UzEEnqS5uA15yPn+RZz8rK4wrYJp72
	 t3JSYr4q6nGhf3IGKJGB13HrvzUZ94qBRHHHFIrbwFPanUE6WWH5NiEoGyFLAfgv7d
	 Gm1cGJw7eCsGEfkH8jQx6PwAYoXFZSRX1sSIVRP/S/8AMjJLcdvQYZKjeGr9XVrlfQ
	 QAGFqchvVZ7vLvGvDxDaAEGPrs4MvZOJJvdTv0PuTWtKLHVnjTPgEZx3wXVvxUFmkA
	 DoKuJmJx1E8+rpYbeqY7Ct5joqoYXYRZ1Dc+LbEHNi2l2CeLcyZ6iQ493j3b7yPqZP
	 eDGIQCRk5P8og==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Rob Herring
 <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
  Bjorn Andersson <andersson@kernel.org>,  Konrad Dybcio
 <konrad.dybcio@linaro.org>,  ath10k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/4] wifi: ath10k: support board-specific
 firmware overrides
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
	<20240306-wcn3990-firmware-path-v2-2-f89e98e71a57@linaro.org>
Date: Wed, 06 Mar 2024 11:02:18 +0200
In-Reply-To: <20240306-wcn3990-firmware-path-v2-2-f89e98e71a57@linaro.org>
	(Dmitry Baryshkov's message of "Wed, 06 Mar 2024 10:16:46 +0200")
Message-ID: <87ttljhgx1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_010226_730752_AAF0AFC0 
X-CRM114-Status: GOOD (  13.65  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Different Qualcomm platforms using WCN3990 WiFI chip use SoC-specific
> firmware versions with different features. For example firmware for
> SDM845 doesn't use single-chan-info-per-channel feature, while firmware
> for QRB2210 / QRB4210 requires that feature. Allow board DT files to
> override the subdir of the fw dir used to lookup the firmware-N.bin file
> decribing corresponding WiFi firmware.
>
> For example:
>
> - ath10k/WCN3990/hw1.0/wlanmdsp.mbn,
>   ath10k/WCN3990/hw1.0/firmware-5.bin: main firmware files, used by default
>
> - ath10k/WCN3990/hw1.0/qcm2290/wlanmdsp.mbn,
>   ath10k/WCN3990/hw1.0/qcm2290/firmware-5.bin: SoC specific firmware
>     with different signature and feature bits

Thanks, this looks good now.

> Note, while board files lookup uses the same function and thus it is
> possible to provide board-specific board-2.bin files, this is not
> required in 99% of cases as board-2.bin already contains a way to
> provide board-specific data with finer granularity than DT overrides.

After thinking more about this I agree, we want to have just one
board-2.bin file for WCN3990 as it makes easier to share board files
across all variants.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

