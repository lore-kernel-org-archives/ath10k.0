Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AEFFF8875
	for <ath10k@archiver.kernel.org>; Thu, 30 Apr 2026 09:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eh+lkWpKx/z0IJ5BNsNbbnUci4/0XKjjO5lPZvCQBRQ=; b=45CLGwX0KNAxq6vrVwG+38uj0o
	x9H04GJckb35M27Gy9A1isPRoXvqbHSsVMJwgqdBJGzO0hO1cEkaUh9NGZZvqTPsj30szKAlLUbOX
	lrQ2tyCU+l+HK2pX0HN414/iSgAzc+EOZYsCC1GwM+w6/MA/ijry+b9nTMs0tD7I9N5H3z8z+N0/g
	Efn+5mex+E4nAAnGrqDz/k7ht5yInD1VOsmZeI6I14Oe6J2Yh+s2/a5adS/mrRT9F6njyy+mmAr2K
	vzlneReHd/RxOkTp5uPCf4LYdJ3AF3rdRgs7A+lUTNozHPX4UcDu3B8684lC+rvJRVE808T6Fl/SM
	AHjEb/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wINwC-000000056vC-48nq;
	Thu, 30 Apr 2026 09:44:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wINwA-000000056ue-0l6p
	for ath10k@lists.infradead.org;
	Thu, 30 Apr 2026 09:44:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4811E44122;
	Thu, 30 Apr 2026 09:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F83C2BCB3;
	Thu, 30 Apr 2026 09:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777542241;
	bh=pjD4a8rJ5wy6WIWFMXc/dMRwPE2lWwOkl+wfhS2cIxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bplODJU/7ooHDNPIO3jofxmXUudXii8FNNlM4cLlKsg2xa1rzkJtzGIaCQEE5PtlT
	 k2X2s+mFd8BHQrw+yditg9/oAb2mOFnydZHwRjIeFD0D5um8JnTMBeGiyY0lIqzu8A
	 1dkEpe7x9CySs76qPyfav4wXZJZ33CEYe0VOX2WxMb4kdeR5izyJ4N7QuOfKzD+DYH
	 OdTB2zDSzpq/JKsvbnZADUyziLCEVZsv4jiGSpL+Rn0Cub486PPITbtdu63OuNPubA
	 cOL0/bXqyVZSeTcBqQGrpC11wIezKJWt6LrGGRX7T3O57Xmkl/hs+yrorqRVZFkcrf
	 jmBwyEe1LL1xQ==
Date: Thu, 30 Apr 2026 11:43:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	daniel@makrotopia.org
Subject: Re: [PATCH 2/9] arm64: dts: qcom: arduino-imola: Describe boot1
 NVMEM layout
Message-ID: <20260430-famous-meek-dinosaur-edacc6@quoll>
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
 <20260428-block-as-nvmem-v1-2-6ad23e75190a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428-block-as-nvmem-v1-2-6ad23e75190a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_024402_282908_C36D046E 
X-CRM114-Status: GOOD (  18.66  )
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

On Tue, Apr 28, 2026 at 04:23:07PM +0200, Loic Poulain wrote:
> On Arduino Uno-Q, the eMMC boot1 partition is factory provisioned
> with device-specific information such as the WiFi MAC address
> and the Bluetooth BD address. This partition can serve as an
> alternative to additional non-volatile memory, such as a
> dedicated EEPROM.
> 
> The eMMC boot partitions are typically good candidates, as they
> are realively small, read-only by default (and can be enforced
> as hardware read-only), and are not affected by board reflashing
> procedures, which generally target the eMMC user or GP partitions.
> 
> Describe the corresponding nvmem-layout for the WiFi and
> Bluetooth addresses.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> index bf088fa9807f040f0c8f405f9111b01790b09377..dc85cf94f71cac8666cab30ccf37cc2d2f8fd941 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> @@ -409,7 +409,31 @@ &sdhc_1 {
>  	no-sdio;
>  	no-sd;
>  
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
>  	status = "okay";
> +
> +	card@0 {
> +		compatible = "mmc-card";
> +		reg = <0>;

> +
> +		partitions-boot1 {
> +			nvmem-layout {

This should not be a separate patch. You add the layout AND you use it.

> +				compatible = "fixed-layout";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +
> +				wifi_mac_addr: mac-addr@4400 {
> +					reg = <0x4400 0x6>;
> +				};
> +
> +				bd_addr: bd-addr@5400 {
> +					reg = <0x5400 0x6>;
> +				};
> +			};
> +		};
> +	};
>  };
>  
>  &spi5 {
> 
> -- 
> 2.34.1
> 

