Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202A6C25B78
	for <ath10k@archiver.kernel.org>; Tue, 28 May 2024 10:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiDUxp5bZ7YR9qKbWl4fDXV6ZYiiT1pT+U1YYHWx+qQ=; b=BRjtrwkmhRpZa7wlAUQMTqb/kl
	GE5QiGzpD+pjtw18qX0/E9EDE9xRxNHV8k1/NsGFfBLiBp0wkUcm0+ojgc41SXRCLqXqk3Lpbq+4H
	XMYc/6Lmkf4qoxjjoShEytGI1i8O47uRa+wwl5M9li6Qmuq1pF63AoCybrZ9f3gztGFF/NO29ZCEG
	iqcMbbrT1RrBg4zpjJWsvMYsaI1GmZwc1esWxhIkx0W3PeDnG77YR7LA4PkW00w1b5IdNC5swtEHE
	rAwBigOrv4yXOYIXmc6g5djukt0eCl31aomPD2L2iVyvVwszGixGoN0sPRXonb3ODjZUei8BXVBMD
	ChcxNSUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBtnd-00000000AA4-2wWu;
	Tue, 28 May 2024 10:11:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBtnb-00000000A9a-0GSz
	for ath10k@lists.infradead.org;
	Tue, 28 May 2024 10:11:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1B842CE11EA;
	Tue, 28 May 2024 10:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3848C3277B;
	Tue, 28 May 2024 10:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716891076;
	bh=3ri47Jw8bG0xrz0cHD1t6SSVNIySHKS61lpPF53h+3s=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=UcNq45MmR80f7cpnqo6wlB59u/UPMXeA2qZWe17HnnDwofjLwb/jyu2ucUmG7HrwR
	 TVdIYyKpguUruLYx1B5gLFLhlivJLKRFJxq9x9BaX3I+nqDvSS6eePT3x6sdVpys2U
	 61tAs6AUmhpT8QdvpUpyiZVk3DGgeF/MnqpsUHDEcnN6pIN2mvUGyNfPK9XN8+N/w0
	 5SstgHQlBn6qvkiI037eeAf3eqgMtJY0bHE+7X8zlpYXIn/lQwkFHrqVnCbk8Vkqud
	 TPhhPW0qrnj6esSfQRQzzfJlP+BN+uoyS7w++RpTtPK2QGto3g1mRAAmVABGNBtVnu
	 7kzjDGhmLq8Fg==
From: Kalle Valo <kvalo@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Bjorn Andersson <andersson@kernel.org>,  Jeff Johnson
 <quic_jjohnson@quicinc.com>,  ath10k <ath10k@lists.infradead.org>,
  wireless <linux-wireless@vger.kernel.org>,  DT
 <devicetree@vger.kernel.org>,  MSM <linux-arm-msm@vger.kernel.org>,  Rob
 Herring <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
  Pierre-Hugues Husson <phhusson@freebox.fr>,  Arnaud Vrac
 <avrac@freebox.fr>,  Konrad Dybcio <konrad.dybcio@linaro.org>,  Jami
 Kettunen <jamipkettunen@gmail.com>,  Jeffrey Hugo
 <quic_jhugo@quicinc.com>,  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
  Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
References: <54ac2295-36b4-49fc-9583-a10db8d9d5d6@freebox.fr>
	<171560975908.1690511.498631481702370762.kvalo@kernel.org>
	<3464a980-36a7-4ed2-b2dc-be8fd9091b06@freebox.fr>
Date: Tue, 28 May 2024 13:11:10 +0300
In-Reply-To: <3464a980-36a7-4ed2-b2dc-be8fd9091b06@freebox.fr> (Marc
	Gonzalez's message of "Tue, 28 May 2024 11:54:37 +0200")
Message-ID: <87zfsa6ybl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_031119_468502_29587A69 
X-CRM114-Status: GOOD (  14.46  )
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

> On 13/05/2024 16:16, Kalle Valo wrote:
>
>> Marc Gonzalez wrote:
>> 
>>> The ath10k driver waits for an "MSA_READY" indicator
>>> to complete initialization. If the indicator is not
>>> received, then the device remains unusable.
>>>
>>> cf. ath10k_qmi_driver_event_work()
>>>
>>> Several msm8998-based devices are affected by this issue.
>>> Oddly, it seems safe to NOT wait for the indicator, and
>>> proceed immediately when QMI_EVENT_SERVER_ARRIVE.
>>>
>>> Jeff Johnson wrote:
>>>
>>>   The feedback I received was "it might be ok to change all ath10k qmi
>>>   to skip waiting for msa_ready", and it was pointed out that ath11k
>>>   (and ath12k) do not wait for it.
>>>
>>>   However with so many deployed devices, "might be ok" isn't a strong
>>>   argument for changing the default behavior.
>>>
>>> Kalle Valo first suggested setting a bit in firmware-5.bin to trigger
>>> work-around in the driver. However, firmware-5.bin is parsed too late.
>>> So we are stuck with a DT property.
>>>
>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>> Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>>> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> 
>> 2 patches applied to ath-next branch of ath.git, thanks.
>> 
>> 71b6e321e302 dt-bindings: net: wireless: ath10k: add
>> qcom,no-msa-ready-indicator prop
>> 6d67d18014a8 wifi: ath10k: do not always wait for MSA_READY indicator
>
> Hello Kalle,
> What version of Linux will these be included in?
> (I don't see them in v6.10-rc1. Are they considered
> a new feature, rather than a fix, and thus 6.11?)

Yeah, these commits will go to v6.11. Because of the multiple trees
involved (ath-next -> wireless-next -> net-next -> linus) we need to
have ath.git pull request ready well before the merge window opens and
these commits missed the last pull request.

Yes, we are slow :)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

