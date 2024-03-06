Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796DFC54E41
	for <ath10k@archiver.kernel.org>; Wed,  6 Mar 2024 09:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VP4WQu0On1VZDEXhanMmGvZTr1q+uufLBm9r8ASe2dc=; b=eDNP+3au2nAmH51BNrL5d/8+c9
	PLI/cX0EWej3TPNhbAMzTapf+TfHHS4AAJcFgqy68nzHOTvMTMej73KdxcBCBTMjA15LLqNxAWGLw
	e6SDK1Cqdmq0koj3lIeLJKQNC2p3T/DCyXBtqcNJhNyWhKmXhWCFCyCflQ7JKwkhqQKQx9lI0xZUF
	3Hp4EUhWlYMzjlYnUhILdJwXF6BmGytPC4PSApdyK93PTNksrp2LJW0pw2skgHYBtqvfBdBZUPrus
	Mg0voCAtznTAlRa8WYeeepVQjSZIHp/PAKvnHoQSHL7LDxE0tmofXZPOc0HyDZDVyMiWT5pBC7iWr
	c3je8AmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhnCl-0000000H407-0OD1;
	Wed, 06 Mar 2024 09:04:51 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhnCh-0000000H3yl-4AbI
	for ath10k@lists.infradead.org;
	Wed, 06 Mar 2024 09:04:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DCE0BCE1939;
	Wed,  6 Mar 2024 09:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B44C433F1;
	Wed,  6 Mar 2024 09:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709715885;
	bh=lT33D1r8s/bp6Ix6+DW7nrWJQkFQLEVIK0tbhV5W6to=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=dOQzvOQJcuEDCF6tN2LV7H9G3ueiQJusbfWn68WYM5n1djQNg52Y/R/+N7keo8rWr
	 dIrTZo8a3+NEaCpaeNwpsJhC3WmWcFc/HR7XtOEKC4B7M+CoyTfjhgpZSNuOVRpexz
	 DWDMI8Dw2lXV3u/RnIm29NibdLsQ1Ym8nodHA4gLGW7DFDtGjJV2zGGftagY/d+PNN
	 h5jxqBWVgq9XUVUJ6DfjIVVeFcImFBRQ5+Xuzi2yCddr+LG84wgiAbszA8eFF9xdKP
	 xNxCE8LXSt/+DGDMXlT0MCcfLGs8ZrQx5/RiLOL5spnBj/5DHxUQzzf3qucbYcM/UE
	 GVMRl6szltttg==
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
  devicetree@vger.kernel.org,  linux-arm-msm@vger.kernel.org,  Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RFC v2 0/4] wifi: ath10k: support board-specific
 firmware overrides
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
Date: Wed, 06 Mar 2024 11:04:39 +0200
In-Reply-To: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
	(Dmitry Baryshkov's message of "Wed, 06 Mar 2024 10:16:44 +0200")
Message-ID: <87plw7hgt4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_010448_243887_A101A1E9 
X-CRM114-Status: GOOD (  15.46  )
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

> On WCN3990 platforms actual firmware, wlanmdsp.mbn, is sideloaded to the
> modem DSP via the TQFTPserv. These MBN files are signed by the device
> vendor, can only be used with the particular SoC or device.
>
> Unfortunately different firmware versions come with different features.
> For example firmware for SDM845 doesn't use single-chan-info-per-channel
> feature, while firmware for QRB2210 / QRB4210 requires that feature.
>
> Allow board DT files to override the subdir of the fw dir used to lookup
> the firmware-N.bin file decribing corresponding WiFi firmware.
> For example, adding firmware-name = "qrb4210" property will make the
> driver look for the firmware-N.bin first in ath10k/WCN3990/hw1.0/qrb4210
> directory and then fallback to the default ath10k/WCN3990/hw1.0 dir.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Fixed the comment about the default board name being NULL (Kalle)
> - Expanded commit message to provide examples for firmware paths (Kalle)
> - Added a note regarding board-2.bin to the commit message (Kalle)
> - Link to v1: https://lore.kernel.org/r/20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org

From my point of view this looks good now but let's see what others say.
Is there a specific reason why you marked this as RFC still?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

