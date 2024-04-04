Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A709DCD1292
	for <ath10k@archiver.kernel.org>; Thu,  4 Apr 2024 11:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1rJbeHcV+RoSXpw2HtEQrLKyGhvfFlclGP72hV6Bag=; b=tttCcB/eSjByAVokNXU34mRr82
	eyC6QlQwivptDZVeEJny1EHNa4lfWjNOQTDYRciAgr+at2Ek0bE0DBZ1CcK0F/XVRCipgFODZvTes
	GAubbEj6I1134pNSue1G06X5U4SyPaIAjSbK+k65/nSTh2b/HX4iPubialXfUrELWb4W/qA/w+fUD
	FsdmiVdhWBK0rKoP65v7iCcaKlNcpQLl9C7dZIhehVFSkRFfb4fD/1x4qLaUmlmMGPngTrIN+pE/q
	/NyDQgq7CG8kQKoOOf9FSsHP1mLjIe29vrtFXWz170EcWsSPX5bOv89zcSkFXGaIPfyXV3Z7xFA9Y
	7VzNqcMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLa3-00000002Qmn-2oil;
	Thu, 04 Apr 2024 11:48:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLZz-00000002QiI-2iML
	for ath10k@lists.infradead.org;
	Thu, 04 Apr 2024 11:48:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 677D3CE3132;
	Thu,  4 Apr 2024 11:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A850C433C7;
	Thu,  4 Apr 2024 11:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712231304;
	bh=dAhTmkzD/Nmh0C2TGZh+xAa7rrEqwqkaz/GvQ75Pxgk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=oZ3ysiRJDSYt/kN9hfKEvbX+lYFhMkuZPFEjeLM1IaNtVCP2RO4mgUpMVciE8KRga
	 065MjFV57yg9nErRgKXpwZ9OvAYKvJEDWryQwve7yNEupWPEU3KY50zCX1Ec0Eib4u
	 B4+w8CyWSMmI6ZEJ2hyQtb83sa2yjAsy7lNyHSTvydru95AwCfhz3xZ8eyjL6oV2Qj
	 E9ts3COC0a+/R4KGw87uNxJzApcCR7tn6iifhs6gGz/olk6KiBoaYezIU4KvGd1W5D
	 btUrI0dUPOKAmKuHIE3mRpMemLR/aI6wgJoUjUF6c1qhLMj9HqzAZpALXW9SFSN9vu
	 5x/IM/wXbFCSQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Rob Herring
 <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
  Bjorn Andersson <andersson@kernel.org>,  Konrad Dybcio
 <konrad.dybcio@linaro.org>,  <ath10k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  <netdev@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-arm-msm@vger.kernel.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RFC v2 0/4] wifi: ath10k: support board-specific
 firmware overrides
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
	<CAA8EJprpmC6+ePxw_G6y9YEszndq1VonS1HP=aP9OVHNm42LLw@mail.gmail.com>
	<c2bd01d1-8ddf-44b8-b5bc-860cc9754b76@quicinc.com>
Date: Thu, 04 Apr 2024 14:48:19 +0300
In-Reply-To: <c2bd01d1-8ddf-44b8-b5bc-860cc9754b76@quicinc.com> (Jeff
	Johnson's message of "Tue, 2 Apr 2024 16:40:57 -0700")
Message-ID: <87y19t4ad8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_044828_216231_20D12E1F 
X-CRM114-Status: GOOD (  14.62  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 3/29/2024 9:47 PM, Dmitry Baryshkov wrote:
>
>> On Wed, 6 Mar 2024 at 10:16, Dmitry Baryshkov
>> <dmitry.baryshkov@linaro.org> wrote:
>>>
>>> On WCN3990 platforms actual firmware, wlanmdsp.mbn, is sideloaded to the
>>> modem DSP via the TQFTPserv. These MBN files are signed by the device
>>> vendor, can only be used with the particular SoC or device.
>>>
>>> Unfortunately different firmware versions come with different features.
>>> For example firmware for SDM845 doesn't use single-chan-info-per-channel
>>> feature, while firmware for QRB2210 / QRB4210 requires that feature.
>>>
>>> Allow board DT files to override the subdir of the fw dir used to lookup
>>> the firmware-N.bin file decribing corresponding WiFi firmware.
>>> For example, adding firmware-name = "qrb4210" property will make the
>>> driver look for the firmware-N.bin first in ath10k/WCN3990/hw1.0/qrb4210
>>> directory and then fallback to the default ath10k/WCN3990/hw1.0 dir.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>> Changes in v2:
>>> - Fixed the comment about the default board name being NULL (Kalle)
>>> - Expanded commit message to provide examples for firmware paths (Kalle)
>>> - Added a note regarding board-2.bin to the commit message (Kalle)
>>> - Link to v1:
>>> https://lore.kernel.org/r/20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org
>>>
>>> ---
>>> Dmitry Baryshkov (4):
>>>       dt-bindings: net: wireless: ath10k: describe firmware-name property
>>>       wifi: ath10k: support board-specific firmware overrides
>>>       arm64: dts: qcom: qrb2210-rb1: add firmware-name qualifier to WiFi node
>>>       arm64: dts: qcom: qrb4210-rb1: add firmware-name qualifier to WiFi node
>> 
>> Kalle, Jeff, is there anything pending on me on this series?
>> 
> Nothing from me -- this is outside my area of expertise so I'm deferring to Kalle.

I was on Easter vacation and now catching up, that's why the delay.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

