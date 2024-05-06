Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE5CC25B10
	for <ath10k@archiver.kernel.org>; Mon,  6 May 2024 12:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gE2ebgFVhhbC9iludj4+l8uxjQ9uRjvNyIZnM7ChN5o=; b=5BdJml+c50b/z6jiqfniDGtRg0
	m9wfYm2fi2+NFuZPU2O6jDL/jLmNbHwUv60huojcH32uLZb4jcTQJrPjM3ADEYZ0O0HqHvcqbRAiQ
	D0f4ATafhaqWkk0dAVgAwX59mb4U+OmjFmshYXWk5QqLjXSMRXP3l8mluMwpR1RlpiffaV6z5VMHs
	th9ETc5W/ZlJ1dLoFTDVp05rUxlCJbs9szR57C3zOBpg2qUgpmBRS5wgWRzx6fb0EwIUoTJ7QiXc9
	Enq9l1VOYb98WITfaVlqSKtIRP7ONBgjoLVIZf4uOmgnQcnQCRFyqFrMMoUcrKlimVKXFoyrHNt4i
	hFHJ8/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3xH2-00000007Eie-2DP7;
	Mon, 06 May 2024 12:16:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3xH0-00000007EhM-1HON
	for ath10k@lists.infradead.org;
	Mon, 06 May 2024 12:16:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 81F30CE0D01;
	Mon,  6 May 2024 12:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB935C116B1;
	Mon,  6 May 2024 12:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714997807;
	bh=imW+tOmQLVq8kGToLptxFdeea7wI9xfeY1vCN4uPZuw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=qIffkB5CzbpmgYvIlqOZw40xo0i/2sgi+EIaWIL/LDuqWYhPeMgtVXR0uJQb77FCZ
	 Fc+luNUhSVsdItlyHjU+Y9ZOiouUgwpCUtdeggTEecnvjcMOzqrbMoyib3IzQp3yQV
	 nsTdrAak3IUZe5De9szGwODR59R3C1Y4u8IQaRhjTZw3OuPPILRQRT9EEkbJcUJHYu
	 iqwO7fGrg9puWWbUfX658Tqf0b/koh/V6yKK36CpjjFc0s+0skyEibCEFKliJFtGO4
	 woQf8dAkmVFx4NTsmz0CkBws16hddpjW6CQGpqPzXxBjGsPIfVVKbyJfx4ZekDlN1h
	 jWxiNdkZy83uQ==
From: Kalle Valo <kvalo@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>,  Jeff Johnson
 <quic_jjohnson@quicinc.com>,  ath10k <ath10k@lists.infradead.org>,
  wireless <linux-wireless@vger.kernel.org>,  DT
 <devicetree@vger.kernel.org>,  MSM <linux-arm-msm@vger.kernel.org>,  Rob
 Herring <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
  Pierre-Hugues Husson <phhusson@freebox.fr>,  Arnaud Vrac
 <avrac@freebox.fr>,  Bjorn Andersson <andersson@kernel.org>,  Konrad
 Dybcio <konrad.dybcio@linaro.org>,  Jami Kettunen
 <jamipkettunen@gmail.com>,  Jeffrey Hugo <quic_jhugo@quicinc.com>,  Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,  Alexey Minnekhanov
 <alexeymin@postmarketos.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
References: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
	<54ac2295-36b4-49fc-9583-a10db8d9d5d6@freebox.fr>
	<ZjBV+th9DmnNLhnN@hu-bjorande-lv.qualcomm.com>
	<8734r3qysm.fsf@kernel.org>
	<b6a1eadf-477d-48a8-bf39-ac3c3191e929@freebox.fr>
Date: Mon, 06 May 2024 15:16:41 +0300
In-Reply-To: <b6a1eadf-477d-48a8-bf39-ac3c3191e929@freebox.fr> (Marc
	Gonzalez's message of "Tue, 30 Apr 2024 13:10:45 +0200")
Message-ID: <87fruvm8ye.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_051650_722536_F73017D8 
X-CRM114-Status: GOOD (  20.49  )
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

> On 30/04/2024 06:06, Kalle Valo wrote:
>
>> Bjorn Andersson wrote:
>> 
>>> On Mon, Apr 29, 2024 at 04:04:51PM +0200, Marc Gonzalez wrote:
>>>
>>>> The ath10k driver waits for an "MSA_READY" indicator
>>>> to complete initialization. If the indicator is not
>>>> received, then the device remains unusable.
>>>>
>>>> cf. ath10k_qmi_driver_event_work()
>>>>
>>>> Several msm8998-based devices are affected by this issue.
>>>> Oddly, it seems safe to NOT wait for the indicator, and
>>>> proceed immediately when QMI_EVENT_SERVER_ARRIVE.
>>>>
>>>> Jeff Johnson wrote:
>>>>
>>>>   The feedback I received was "it might be ok to change all ath10k qmi
>>>>   to skip waiting for msa_ready", and it was pointed out that ath11k
>>>>   (and ath12k) do not wait for it.
>>>>
>>>>   However with so many deployed devices, "might be ok" isn't a strong
>>>>   argument for changing the default behavior.
>>>>
>>>> Kalle Valo first suggested setting a bit in firmware-5.bin to trigger
>>>> work-around in the driver. However, firmware-5.bin is parsed too late.
>>>> So we are stuck with a DT property.
>>>>
>>>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>>
>>> This says "Pierre-Hugues certifies the origin of the patch" then "Marc
>>> certifies the origin of the patch". This would have to imply that
>>> Pierre-Hugues authored the patch, but you're listed as the author...
>>>
>>> Perhaps a suitable answer to this question would be to add
>>> "Co-developed-by: Pierre-Hugues ..." above his s-o-b, which implies that
>>> the two of you jointly came up with this and both certify the origin.
>> 
>> BTW I can add that in the pending branch, no need to resend because of
>> this. Just need guidance from Marc.
>
> I typed this patch all by myself with my grubby little paws.
> You can drop PH's S-o-b.
>
>>> Other than that, I think this looks good, so please upon addressing this
>>> problem feel free to add my:
>>>
>>> Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>> 
>> Thanks, I'll then add this as well.
>
> Cool. Almost there :)

All I need is an ack from DT maintainers for this patch.

DT maintainers: I think this is the best option and I can't think of any
other solution so I would prefer to take this approach to our ath.git
tree if it's ok for you.

IIRC someone suggested testing for firmware version string but I suspect
that has the same problem as the firmware-N.bin approach: ath10k gets
the firmware version too late. And besides it's difficult to maintain
such a list in ath10k, it would always need kernel updates when there's
a new firmware etc.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

