Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE43CD1288
	for <ath10k@archiver.kernel.org>; Thu,  4 Apr 2024 21:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFgK3fO75BY37OtT8czBHMRoUNEQvj+ylMhip6Sz/uU=; b=mmNjj0nVYUnxoZdukHWUbhpABu
	aj+zxLq/nc0EHL3b768XyGKF8902rVU3v31n/6fRN5YHlnrq4kaSeMeVKsVD6Ufd9TVZkUJzRGBwN
	JS84LHYeR79OkgeHIgaT0ihgsx+Iqe7jcMZBUwffrA7jw0GdOzm935+CKM551ktr7KtMIvuvYf8FE
	Jl9cDhp9z4yWxIcqTNe8fc0pjrQx7JXp1dPiWPnfihhcAF+KV/wyjZOLh9wFV1X9wdsFO/h+F4MH5
	kQM1ooQlOMyzNXdRWRNOj6BvwJ50dScRMg5gJSJd2LBwEwdEwLjLZI8KM8UPRH6n8dw5+7kC2krhO
	8kcqPrAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsUYN-00000004Ixs-46XG;
	Thu, 04 Apr 2024 21:23:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsUYL-00000004Iwz-0uZ9
	for ath10k@lists.infradead.org;
	Thu, 04 Apr 2024 21:23:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC13D61776;
	Thu,  4 Apr 2024 21:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBA8C433B2;
	Thu,  4 Apr 2024 21:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712265800;
	bh=qK1WJ95y942nDqpYdpVd7M8hb2SED2//IBpTA+Bn1jk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bxXkHXMUcDgf0qA/6DQ54jxDBHsNtUX+npjVi2MY81OYCdFL9w0n63mg8WPFWdfzg
	 B6rv9bcAKBwRGzqZ0cwdEzAJqdQeAZyI4bk5DBp2wJ1NuriKQBmKJ3lPt2H5MvE2w5
	 UBo+OtNqDOla4UYFYKYV+7iqNdDtK11TrJCqrkVPAOeyj+Z8iFpCdxcSPY78nqDJNd
	 J+wUnPMiQr/egEIVprE4o17wyc+qRKjCpEijMA6Aa5uJAQnMVl1pB6D8saKlaIMu76
	 S6fXC3gQ+VPpXXXNQIXxJFESad2msjSNQpyrSBOyb80n0uNOEjvLExVJ0D8O8R91jC
	 AZu6UpS6dZlvQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8150-hdk: enable WiFI support
Date: Thu,  4 Apr 2024 16:22:49 -0500
Message-ID: <171226578698.615813.10917637974157146735.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240403-sm8150-hdk-wifi-v1-1-8da3063829c2@linaro.org>
References: <20240403-sm8150-hdk-wifi-v1-1-8da3063829c2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_142321_323476_8585E928 
X-CRM114-Status: UNSURE (   6.96  )
X-CRM114-Notice: Please train this message.
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


On Wed, 03 Apr 2024 20:10:12 +0300, Dmitry Baryshkov wrote:
> Enable modem DSP and WiFI devices on the SM8150 HDK device. The HDK is
> manufactured by Lantronix, but it attributed to Qualcomm, so the
> calibration string uses Qualcomm as manufacturer.
> 
> For reference:
> 
> ath10k_snoc 18800000.wifi: qmi chip_id 0x30224 chip_family 0x4001 board_id 0x55 soc_id 0x40060000
> ath10k_snoc 18800000.wifi: qmi fw_version 0x32040163 fw_build_timestamp 2019-10-08 05:42 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.3.2.0-00355-QCAHLSWMTPLZ-1
> ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
> ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 0 tracing 0 dfs 0 testmode 0
> ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
> ath10k_snoc 18800000.wifi: htt-ver 3.73 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
> ath10k_snoc 18800000.wifi: invalid MAC address; choosing random
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8150-hdk: enable WiFI support
      commit: e5fd6512f6e842d8c5883b9fa4d72c8a5295efdc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

