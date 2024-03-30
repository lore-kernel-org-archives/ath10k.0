Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022CBC6FD1F
	for <ath10k@archiver.kernel.org>; Sat, 30 Mar 2024 04:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQUNU9HstbNDcHNvryhhTFYLom8Nu8/8eMQ1j/SNHfY=; b=p4Kb2H/zeNUBPO5M5TkC00KJ//
	SoF3nPb4kiA/GTI9WS2n0l4qlldwQ3E/ruQaEL0gfbVQeK7DfRMtLS+ohlYt1ZyNXuODrldZyHnRP
	6qwZFrGuvr231ojWd+r/q+BKwzoSEjFqP98bKh6SP0tdyPFh+Fy1z6VduBTuaoBhi4mxWLs7IkALn
	f40YR5TMqZPdprgpmMN6Vj5FioJaL9qw04QpBXj+XslHEUd4jkEGwY6RJyofbR3Hu62nLDAl8DJo1
	vOxFtH1ZjG9JiXT5FsjKUYEyv/wsdtqrmxKkUCHf9ZVwcF+QIhjDwmy6RLZNK0g62NQF2tjzI1Qor
	2sp4f4TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqQdZ-00000002n0W-2byQ;
	Sat, 30 Mar 2024 04:48:13 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqQdU-00000002mzb-47Jw
	for ath10k@lists.infradead.org;
	Sat, 30 Mar 2024 04:48:12 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso2517436276.3
        for <ath10k@lists.infradead.org>; Fri, 29 Mar 2024 21:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711774083; x=1712378883; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dQUNU9HstbNDcHNvryhhTFYLom8Nu8/8eMQ1j/SNHfY=;
        b=thYlpYul1iang84x9bust1UuqA7BdnJvnQUWu16XMKcFnQHSAvyHmg7UoN7rD16lQv
         f1Hgm24nmAs58gJE3x51JiVYzIthB6WAF+ARuARoWYX3kyhlfF6ZxAcyq/KqTgtsTBfH
         MgpRHBec5RSLjNt/QUTQu4GARVMcBacD9FQMAMOOLJCCq+qdrAJJef/WHEgBjrFnTUmu
         y8BNrQJZRp8oMlS/KKD0lBynednVguNVpI83tDTo69cYGLgegeHSzweqKIcD/5vtmVj6
         469DN5AmPktLn/yYXu6ksUYMg30wY0dOJFOqFiFE4/rJtwEWcrYQbN8mp5DOmp3oBODs
         ya9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711774083; x=1712378883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQUNU9HstbNDcHNvryhhTFYLom8Nu8/8eMQ1j/SNHfY=;
        b=UrrZw90RI19jDK9NRMo+I/Ler3kjBLK9dWHcc6mlyEl6im454Nme9H8eMzyLvnmc5e
         QxPUpUWftzUBZBM+uG+vmDfLGcEf0HImy/Fy8bpcmpsinBy0vfEM04qP0LIat09DkgBB
         uxTgyzOnann3+o9ZQFqYmzMkM9Nn3SuOdxtLTOzAAHxvv0HVsH6HBQvN1wCqrPLBDcq/
         45nfAGwEuUCBuj5FwoobPW7butZn05DpOYyU6W6ETumJXLcuZ/3i9we2BO2yQE9pnfYY
         UZzrpWaKr7MQVKQlq2W/Xj/d/Taa57KwXiQi16U3TpEEKiWxZBylMxYH7ZB/K3dbtapZ
         ixyw==
X-Gm-Message-State: AOJu0YzkMQfXTZ+61aNeJDwyAR4OxNWy39hmRBsDFhYIyNwIxoGw8ElB
	8TWeOyfOs8d9wTDD+TkhlTmZ0FVyHDx8A7hO6XKDtJ4S7z9kusUy/aH45d3oVhG9Z9RW2Wbl/nR
	0Fd8j5TLwryfPtpkJF2Rx7zCr9hcxup4qaSfZiA==
X-Google-Smtp-Source: AGHT+IFWm8FRcfrc1FaMw38a0VeaKMDMlu7uCNCYORdT1l9V5pI2sSVpSQMKObFG5zVf0CeqF6rlwAr3XTYwJkWkMCE=
X-Received: by 2002:a25:10c4:0:b0:dd1:7a16:7b4 with SMTP id
 187-20020a2510c4000000b00dd17a1607b4mr3520574ybq.31.1711774083391; Fri, 29
 Mar 2024 21:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
In-Reply-To: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Mar 2024 06:47:52 +0200
Message-ID: <CAA8EJprpmC6+ePxw_G6y9YEszndq1VonS1HP=aP9OVHNm42LLw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/4] wifi: ath10k: support board-specific firmware overrides
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_214809_133933_CF9DFE5A 
X-CRM114-Status: GOOD (  15.84  )
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

On Wed, 6 Mar 2024 at 10:16, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
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
>
> ---
> Dmitry Baryshkov (4):
>       dt-bindings: net: wireless: ath10k: describe firmware-name property
>       wifi: ath10k: support board-specific firmware overrides
>       arm64: dts: qcom: qrb2210-rb1: add firmware-name qualifier to WiFi node
>       arm64: dts: qcom: qrb4210-rb1: add firmware-name qualifier to WiFi node

Kalle, Jeff, is there anything pending on me on this series?

-- 
With best wishes
Dmitry

