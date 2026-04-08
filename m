Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0300FD5F75
	for <ath10k@archiver.kernel.org>; Wed,  8 Apr 2026 06:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOY4cQPwsvW5FOClGTuUoB1lq0emOpGANTeimNj0MLQ=; b=Gx3unXRzApz1i1gZmH+5A/OapM
	b+Jw6GHKbyAb/znQSicF45+PtEodLy0iBHRq4mF/BI3bLNlStJXmqtG1/WuY+77hMjhaxI7UUa8KP
	AwzYpl0iAW7g1hn9GcsEGUt8pe0MRqvAA51K7TG8SAPUZmRa+wVTWsayqggo554eu2Hake3p87teO
	YFvO/M8uaY+k/kYA9VQ0tSS/00ZLBsiym6HCay2dDIC6Z4ZcRNkmWxa0I9SO0zf2GtSoZRVn36lFm
	YYlRfEwJxW4uRSFG4ot082t++51myiqdomTMn+QLupsWp9V8fnSCYHgsbci45fDYYKS/spFFCoztC
	hXFRm8Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMso-00000008Nfm-23jg;
	Wed, 08 Apr 2026 06:59:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMsn-00000008Nfg-0haP
	for ath10k@lists.infradead.org;
	Wed, 08 Apr 2026 06:59:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FA166012B;
	Wed,  8 Apr 2026 06:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547D5C19425;
	Wed,  8 Apr 2026 06:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775631563;
	bh=kKyU9sr3o2SV3j0SPapHhJD4cURrV9YyzTUTD8I1+Io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X5OaCXadVAFldWzWUCHs81OSnx6ONq7YXinra3UnH6hoO4AywCVdfJV0OIUJIcjic
	 Kw1kYtd/YROrfivQXnxJHechljGv4j2CUWN4s/pkCo1b/8WfMQxfvCdriMI88MNNiE
	 suIQ5a9VJk/rIWtOzOkxSFfmMMu+FFDNdOrBdd1m7E/RKulkiTiZr+uHJuK/LGkVQg
	 DgXWqTKZ8JKyHwCGgwLjLHEebwgZvvfkndf4NygBg4UoS6rfOM9GI2hdndoYLDK98D
	 4wmv9+NWkCMQKMIvdB1R5ZGMF2u1VSwXReYU+f1kEFkajC+F6gWjQzYyNVwHUguMVN
	 OA/ZI8+5znDug==
Date: Wed, 8 Apr 2026 08:59:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Paul Sajna <sajattack@postmarketos.org>, Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: wireless: ath10k: Add quirk to skip
 host cap QMI requests
Message-ID: <20260408-hypersonic-enthusiastic-fox-bb7df4@quoll>
References: <20260407-skip-host-cam-qmi-req-v5-0-dfa8a05c6538@ixit.cz>
 <20260407-skip-host-cam-qmi-req-v5-1-dfa8a05c6538@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407-skip-host-cam-qmi-req-v5-1-dfa8a05c6538@ixit.cz>
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

On Tue, Apr 07, 2026 at 08:43:54AM +0200, David Heidelberg wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> Some firmware versions do not support the host-capability QMI request.
> Since this request occurs before firmware and board files are loaded,
> the quirk cannot be expressed in the firmware itself and must be described
> in the device tree.
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/net/wireless/qcom,ath10k.yaml         | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


