Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C879C5475B
	for <ath10k@archiver.kernel.org>; Fri,  1 Mar 2024 08:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKepha/jX1ZniHttNKLse1SAbC+yOgtDNlN9Q72sK+E=; b=t/k9armoRrnycILjlQQwuvfblI
	3kx4j5Q1cmw9Qzn8ISu1MJsf3yhSjkneO7x5u3Cq0I1P3EXc850UucxA+vVR2TweR3+03SjXT4ppk
	NU4W2fcJIg/qtPmLWgO2q1XrN9qNOHzW8VZpTYdCbtWUl/bbaAQ8cszitO3dnc3j9sL9gH40O0NCh
	Dwj16lkdf+lcHmAHVBsqOOkhNdqJ07+QYs7MkcT0BJ8SsxCAqUDbnxdQkQbqVDTys4+tASHrl/wWV
	LtbAO9r3SDjIww5kF/eGAKutsxzDuHiXzjlx2DIn0kG09/AfhWFISL4AZU3ROngv6K1xWPLHG8V/p
	K8QnStxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfxya-0000000GqZ3-3Ubj;
	Fri, 01 Mar 2024 08:10:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfxyX-0000000GqYE-0sD0
	for ath10k@lists.infradead.org;
	Fri, 01 Mar 2024 08:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5FD16CE24C9;
	Fri,  1 Mar 2024 08:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F44C433F1;
	Fri,  1 Mar 2024 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709280633;
	bh=X72NJCeGEpyO5TljCIfKuVss8NrQT972LEnQW9Au8jM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Q1dp3Nk59WBXj18jqNBXspTsq5n0O4AOx0Og1H93g0tbsS+tbBCzrVB+pjBRHSE4g
	 9IHoheYQ6qlctQ+vd9fsnFDXQyr6OHSi6J+zttT/c3C5oZ9+zG+HLFeHRzsAWAqyw/
	 RslBzZcW+LJmGH74iLKKYXK1ddG5eizTYw9jorCkKEiXBqrs2OwlziLQEggpSZWmwc
	 HFahnW+dpjO4+AQCBkVO70s9VDffgevfO1Q/X5AlYreZGjz7VZ5uObFt7hhR55F0gg
	 LUjpdfO4qkKlsjfwPh9YdqYFhrbzI9wuKofxuRzHU6AnJ7ZYRVCbDq+tj+NToO/MyF
	 hQFY+Cog5LBUg==
From: Kalle Valo <kvalo@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  ath10k
 <ath10k@lists.infradead.org>,  wireless <linux-wireless@vger.kernel.org>,
  DT <devicetree@vger.kernel.org>,  Rob Herring <robh+dt@kernel.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Pierre-Hugues Husson <phhusson@freebox.fr>,  Jami
 Kettunen <jamipkettunen@gmail.com>,  Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
	<b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr>
	<871q8wk7o3.fsf@kernel.org>
	<3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr>
	<87wmqoilzf.fsf@kernel.org>
	<c58e67e6-6a7f-4963-86b9-580165bf05ba@freebox.fr>
Date: Fri, 01 Mar 2024 10:10:29 +0200
In-Reply-To: <c58e67e6-6a7f-4963-86b9-580165bf05ba@freebox.fr> (Marc
	Gonzalez's message of "Wed, 28 Feb 2024 18:19:03 +0100")
Message-ID: <87cyse8j9m.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_001037_620582_2445378C 
X-CRM114-Status: GOOD (  18.14  )
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

Marc Gonzalez <mgonzalez@freebox.fr> writes:

>> Here's one example where in ath10k we use a feature bit as a workaround:
>> 
>> 	/* Don't trust error code from otp.bin */
>> 	ATH10K_FW_FEATURE_IGNORE_OTP_RESULT = 7,
>> 
>>         ....
>> 
>> 	if (!(skip_otp || test_bit(ATH10K_FW_FEATURE_IGNORE_OTP_RESULT,
>> 				   ar->running_fw->fw_file.fw_features)) &&
>> 	    result != 0) {
>> 		ath10k_err(ar, "otp calibration failed: %d", result);
>> 		return -EINVAL;
>> 	}
>> 
>> BTW for modifying firmware-N.bin files we have a script here:
>> 
>> https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath10k/ath10k-fwencoder
>
> If I understand correctly, you are saying that there is
> (maybe... probably) a bug in the FW, so it makes sense to
> tag that specific FW file with a special bit which the kernel
> will interpret as "this FW is broken in a specific way;
> and here's how to work around the issue."
>
> So this bit would serve the same purpose as my proposed
> "qcom,no-msa-ready-indicator" bit (that bit existed instead
> in my board's device tree).
>
> The problem I see is that the firmware files are signed.
> Thus, changing a single bit breaks the verification...
> UNLESS the FW format allows for a signed section ALONG-SIDE
> an unsigned section?

firmware-N.bin is ath10k specific container file format and we (the
Linux community) have full access to it using ath10k-fwencoder, there's
no signing or anything like that. One of the major reasons why it was
designed was to handle differences between firmware branches, just like
in this case.

Of course plan A should be to fix the firmware but if that doesn't work
out then plan B could be using the feature bit in firmware-N.bin.

BTW related to this Dmitry is extending firmware-N.bin handling for
WCN3990, you will most likely need to use that:

https://patchwork.kernel.org/project/linux-wireless/cover/20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

