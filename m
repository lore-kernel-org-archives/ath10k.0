Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E432C77B73
	for <ath10k@archiver.kernel.org>; Wed, 19 Apr 2023 14:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/Ouo7V37h/9ZFFjP6cKeCt4DuuvTpp5jmm8ejQUnv4=; b=qeDf0fPSuKFJFq
	3rhLxxcLxGc6HoYLRWripfWsO9vi4951GlGQ9xoefs9j/YQmELW8sJRckdDQLfZJFHoDHiPOLNRX9
	pl1V7YQAqn3zqNG57MqQAzPPE5A/bdVjaA5kh/LvvXnJOYflJb1PBJclsHtvVQiXlW+VB1UTc9Dco
	oUzdcAgv/qZdQfh2UKGIuywERt2vC3mX0iyOSyZ9gQl/PgnsyfiHOTwbJtSNr4RFHfg6EtYwomvxn
	qgjhDv8dBqK1D1RqIux0dscFbKN3W2LrXj5yXu84dVzDmEfcir9fbi2y02ZImQlvWXrGhLOzdtbKP
	BJ6LyAzSHzMz2Jcxq4Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8hA-005dbz-0Y;
	Wed, 19 Apr 2023 14:22:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8h6-005daM-29
	for ath10k@lists.infradead.org;
	Wed, 19 Apr 2023 14:22:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 15E1963FB6;
	Wed, 19 Apr 2023 14:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6BDC433EF;
	Wed, 19 Apr 2023 14:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681914117;
	bh=nIxVJXKZO4/TDitsa4jzrFVfLDv159DQSkCKOdIpB0c=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=pCWFjT8w1e1FtVFS79reBADBdHc9lJs9/7ePM9XCRlBEJ8xI0cUVFiw4OGF7L334i
	 6B+rhR7xPVVqVhBWzccI/LoGk6B3tKjJVtM8hwfGymlWPUmps4WTzBDEwAJlEMI/tM
	 8U/uz9E5sCP09PVSTfBBIIip0iJmAC8wyyJL65JIRKpU5FAOUv82IsdMyUGGvFA5Xl
	 NMGsR8TDFwK6g4/JvkzxKJNcefX/WE6HorpFh/HJFA8oYpOQ7hgPhS4X5q5yi/AQZS
	 e936xu5m2OMXKvIguqkcV8WUi5asmWLLsZ5h++elxO+wS7/iZOzZOlU8eVIbU9MguJ
	 TNOZxECqUKwzA==
MIME-Version: 1.0
Subject: Re: [PATCH v4] dt-bindings: net: Convert ATH10K to YAML
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230406-topic-ath10k_bindings-v4-1-9f67a6bb0d56@linaro.org>
References: <20230406-topic-ath10k_bindings-v4-1-9f67a6bb0d56@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168191411174.18451.3212029330615566766.kvalo@kernel.org>
Date: Wed, 19 Apr 2023 14:21:53 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_072200_772331_9B302E93 
X-CRM114-Status: UNSURE (   9.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Konrad Dybcio <konrad.dybcio@linaro.org> wrote:

> Convert the ath10k bindings to YAML.
> 
> Dropped properties that are absent at the current state of mainline:
> - qcom,msi_addr
> - qcom,msi_base
> 
> Somewhat based on the ath11k bindings.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

ed09c61eb19d dt-bindings: net: Convert ath10k to YAML

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230406-topic-ath10k_bindings-v4-1-9f67a6bb0d56@linaro.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
