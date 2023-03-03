Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757A2C64EC4
	for <ath10k@archiver.kernel.org>; Fri,  3 Mar 2023 12:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mo/+Li+eUKm3q+Sx3BPMllVJspI8D0Rmu8It5er/M9U=; b=ey9py34ZyLABft
	rETKFsKLLKTiYmcLPEePt1doUpH8leeNj0pGHEF+9LVaXra2zdfrnfOiBUq9I580GlOhOkCBzofhz
	PtLWxybXC75Qk1XF5OTNP58cv2TN94vli+jc/CQZdGxLupEE1PFGHKyvWxEZ2b/V+Ul+3nNInUvRk
	FNFw4Sh2WLc6o2kF+g20ZqhpS2CP4MWO1BxmsAL+jlItDBqigufJ2kRFBYvIYKOAuCL0XQW0a4yIO
	HWp+DXtbCi5m7JZthkw9zZ7UBT4dudv/Y1z6qSaje9QcbvSrs8POqevWA7EinFAV1j4cLqkjyBfF3
	VtcdwvmO2viWVMSUw8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY4xu-006NDj-UY; Fri, 03 Mar 2023 12:56:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY4xs-006NCy-Dy
	for ath10k@lists.infradead.org; Fri, 03 Mar 2023 12:56:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4DAE4617F0;
	Fri,  3 Mar 2023 12:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C0A9C433D2;
	Fri,  3 Mar 2023 12:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677848206;
	bh=+b8VhHcKMAf5AlRnGJugTeQ8FLmcJRwHbHLB2Me/d0Q=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=K5f/zp+h6k4W5qp3yW46hJu0292vk2WgBvLP0LSDar561Y18RqRCAqtIamAqCNlIh
	 6vzY2NhmQ7bb2QSXtIQ1CoM+iT7BNp4ei+wE4uebPF3RHAY/gzlkkFQlHPW9yJg5lB
	 Vst1998vixy+qVvhpEWwdaSaPG0XlPG2R2p4J3DSSigFwybKqQZMDjKq/6UIvfq7sO
	 5faVefergO6ULYEzBmILazHWwBIX8bDHHhv7WrMYUWynKgG+4Sa3O1PLQFNpLY1b8z
	 jp+2+S+tV/ps5L+VldD5MnDq4nCofjPZQJLOXg4B2EY+m0RyuwWe06FSjBFfhjRpU5
	 qnVjCNvoaW5GQ==
From: Kalle Valo <kvalo@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,  linux-arm-msm@vger.kernel.org,  andersson@kernel.org,  agross@kernel.org,  marijn.suijten@somainline.org,  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Rob Herring <robh+dt@kernel.org>,  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: ath10k: Add vdd-smps supply
References: <20230303024246.2175382-1-konrad.dybcio@linaro.org>
	<8e695c64-6abd-3c1e-8d80-de636d950442@linaro.org>
	<41665c73-1647-2cb2-bd33-8dc281a97ee5@linaro.org>
Date: Fri, 03 Mar 2023 14:56:36 +0200
In-Reply-To: <41665c73-1647-2cb2-bd33-8dc281a97ee5@linaro.org> (Konrad
	Dybcio's message of "Fri, 3 Mar 2023 12:28:21 +0100")
Message-ID: <87o7payovv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_045648_545765_E01F0AA0 
X-CRM114-Status: GOOD (  12.01  )
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

> On 3.03.2023 08:12, Krzysztof Kozlowski wrote:
>> On 03/03/2023 03:42, Konrad Dybcio wrote:
>>> Mention the newly added vdd-smps supply.
>> 
>> There is no explanation here, but looking at your driver change it
>> suggests name is not correct. You named it based on regulator (so the
>> provider), not the consumer.

Yeah, it would be nice to have more than just one sentence in the commit
log.

> Right, I admit this could have been posted with an RFC tag.
> Maybe Kalle knows more.

Unfortunately not, but maybe Bjorn knows?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
