Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF670C67861
	for <ath10k@archiver.kernel.org>; Fri,  5 Apr 2024 12:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6Z8Cb67nj5J7F6bkUok1MvFqZL6ZDfVHI59g0sNQgk=; b=lFKNMhZ3FTYiMnR3JHvIVM81wj
	PmWiGR/bvUKWCkhQQFQv5Y6DyqO48hcEv9bDexLCHXNKqUhHW4DQ7apAN57eZn4UL6z9su5+M3+G0
	JshiIm6FMa/qOlUOQ3bHSaealE4yaDMj7QfWnExNpMNLynEiMUCnbQ63g8yarlZ6mIcykteQXVVvr
	rh2IH8wK/344m398M4/OBrFPUZhm4nC9X3TDZbcEIrsjKbBYsvtd5ZMMWHQGG7rvZgLJmwsxu1JIs
	NtIlPoRckYWA7Ejjv4kmkCRbRhJLzjWDHWWxOR9SMdFRkHjQtwZACtemx9Q315VzOiaYJYM8+hPWb
	3N4Kyzjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiJ2-00000006oQf-0s6i;
	Fri, 05 Apr 2024 12:04:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiIz-00000006oPn-1XfH
	for ath10k@lists.infradead.org;
	Fri, 05 Apr 2024 12:04:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A0331613DC;
	Fri,  5 Apr 2024 12:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8C5C433C7;
	Fri,  5 Apr 2024 12:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712318664;
	bh=AWVqdr9JP3qgtTgixeT9P1xElXTV4mYyJSYRInZNQCY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ZsXmEvwbfAkT+FRrggPYFIQ9O3Ecnjbo59bRGcIti7C/nghaRp/T7BLdkqzQMOyhR
	 dMYqhyflDx1dFoM3CWhH2Z9E8ypQXkkEK6iEjRs52ReTqmkn5VAHXj+RVIkL5Ae6t8
	 AlQDCO6wMsg+6TCzCfMTLARnphwwuUr+mbZ5lHqy+4921HojVqG1D763/Z4lHh2tJM
	 iPdl5M0tKlCbf3Y3+PTFenMnYx2U+QSia7nmgO1Ime+IR0pP2basrURGIU6tPzMABF
	 HqNZUpk66dKkxKYHsR7ztVdIM8hBFISeiys4dKCyce6wbZLCu6ZOh/lJozGwwuvIb8
	 NVl5e33jMgViA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC v2 1/4] dt-bindings: net: wireless: ath10k: describe
 firmware-name property
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240306-wcn3990-firmware-path-v2-1-f89e98e71a57@linaro.org>
References: <20240306-wcn3990-firmware-path-v2-1-f89e98e71a57@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171231865932.2186783.159747685882106713.kvalo@kernel.org>
Date: Fri,  5 Apr 2024 12:04:20 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_050425_495229_00EC8384 
X-CRM114-Status: UNSURE (   7.40  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> For WCN3990 platforms we need to look for the platform / board specific
> firmware-N.mbn file which corresponds to the wlanmdsp.mbn loaded to the
> modem DSP via the TQFTPserv. Add firmware-name property describing this
> classifier.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

158fff51b4c3 dt-bindings: net: wireless: ath10k: describe firmware-name property
5abf259772df wifi: ath10k: support board-specific firmware overrides

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240306-wcn3990-firmware-path-v2-1-f89e98e71a57@linaro.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


