Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE97FCD1284
	for <ath10k@archiver.kernel.org>; Thu,  4 Apr 2024 11:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZvwwuffk4C6vYsqh7OWkc/SEkgm20qcGxPxeQ+jE7U=; b=F9vUIOYlbDNTjYw8BfQPOx8/Ze
	isC2MjGLfv2WP3b8fL/OY/mCFz2d95wPGRp0b1Ilp4mCUyjnrzpS9ko9ZT6bxKvdwkc10t21kxYSs
	JJXxwPqkIdVzQzEh2tTWwz6JaTCPLoBHFK01OtDfgZuT7yvo6QfgU8UkpNC3EJhFpJV4GSqmLnvOk
	+nvKU8yzR34rGJiSqflD7IE+hFSRbSRefynwS4YCbhZpYGrhTVeT+K2cxSv7VFu7IQ7IuzlOVwWXb
	9ZfDmzIG6LTDxd5n2eg7O8rWgD5vFwIaVFbHQNFT2M5xxD4lvw78HAfy5tlCqpD3izY8YvdxM5sbE
	nlIf25vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLjA-00000002Tb7-3Zxk;
	Thu, 04 Apr 2024 11:57:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsLj8-00000002TZm-1Tfv
	for ath10k@lists.infradead.org;
	Thu, 04 Apr 2024 11:57:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AF440CE3131;
	Thu,  4 Apr 2024 11:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77253C43394;
	Thu,  4 Apr 2024 11:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712231871;
	bh=oyPatv7PBt0holfVUYukJP8QPI1R/fKA+cCRZYJIaig=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Tinh7T1dpbBAZFIvgHQsGQjt/0I1nrX4iqfeXu6jrWUyo0+9kaF8XGmmZlRy6aOC5
	 Zmwd/1oVr0T/Kg9Nn2oSMiHafCk4mhUXyd+luoCFjq467AEyDpYcK7iDtXUsPiNuNL
	 8Xw+aNrCE0jUfDUCFdk9Khq/JW4SGqYWP57ZJNTi9Qr4RCiTJ+CzRlcDK20UGnTwSS
	 ob3QmPFqAUTKh2ettqurQvj4LdISg/4YfTfbTQ5wR0iOc4KfVCYkZ4gU1yVcKBDI9G
	 XXN/KsC5vZ7EEiMcW5YxK64qwoTJsXGt87SloFje7xCrntHwidNNeOyVbXW1njOb1D
	 yMiaOE4OIyNbQ==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>,  Konrad Dybcio
 <konrad.dybcio@linaro.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,  Jeff Johnson
 <quic_jjohnson@quicinc.com>,  ath10k <ath10k@lists.infradead.org>,
  wireless <linux-wireless@vger.kernel.org>,  DT
 <devicetree@vger.kernel.org>,  MSM <linux-arm-msm@vger.kernel.org>,  Rob
 Herring <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
  Pierre-Hugues Husson <phhusson@freebox.fr>,  Arnaud Vrac
 <avrac@freebox.fr>,  Bjorn Andersson <andersson@kernel.org>,  Jami
 Kettunen <jamipkettunen@gmail.com>,  Jeffrey Hugo
 <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
	<5cdad89c-282a-4df5-a286-b8404bc4dd81@freebox.fr>
	<252618e8-9e80-4774-a96c-caa7f838ef01@linaro.org>
	<502322f1-4f66-4922-bc4e-46bacac23410@linaro.org>
	<0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
	<CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
Date: Thu, 04 Apr 2024 14:57:45 +0300
In-Reply-To: <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
	(Dmitry Baryshkov's message of "Tue, 2 Apr 2024 18:55:56 +0300")
Message-ID: <87ttkh49xi.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_045754_733398_89388502 
X-CRM114-Status: GOOD (  10.04  )
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

>> 3) ADD that compatible to the wifi node in msm8998.dtsi
>>    compatible = "qcom,wcn3990-wifi", "qcom,msm8998-wifi";
>> 4) In the driver, set qmi->fake_msa_ready_indicator to true if we
>> detect "qcom,msm8998-wifi"
>>
>> And this approach would be acceptable to both ath10k & DT maintainers?
>
> I'd say, we should take a step back and actually verify how this was
> handled in the vendor kernel.

One comment related to this: usually vendor driver and firmware branches
go "hand in hand", meaning that a version of driver supports only one
specific firmware branch. And there can be a lot of branches. So even if
one branch might have a check for something specific, there are no
guarantees what the other N+1 branches do :/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

