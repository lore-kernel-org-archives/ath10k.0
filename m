Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D0AC5478C
	for <ath10k@archiver.kernel.org>; Wed, 28 Feb 2024 16:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZfVRjgILXxkCU1rWf9gopkgf4faRsfhyMHCAuYu+Mo=; b=Ezoffxn21MyYwgJ8rhA/0gL4hg
	IaV7ij1SHlnZVN0bGkoSHXGF4nq5VuPB+6Xk3+PgvHUkYX19TOrLK+jM8A0xqBhWaV+xQqZ2VCKMi
	z90tURtIfPQpqOTh3h5A+KBuJ5koiLMw8PX2uxrBk4i3r8fl7RwWSoMcQs8sewxFZNijdGtyAfu/E
	+1OUcq+ELRSt8oG53TWnaatcrRYlbxpHyoJL9GMQdE+u0YCO/vAETxpkw72ZbQVJ4vVgbXecGjrR6
	RT15sP4H26dz2zQbQSdCR6b0NqRQ4Ai2MZuEgXLAjRXDhU+Xbomh7MiKEErr1EbSSN4ykd0dmZ2Q/
	pk2RKNDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfMvl-0000000A9R7-479X;
	Wed, 28 Feb 2024 16:37:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfMvj-0000000A9Q6-1Q9J
	for ath10k@lists.infradead.org;
	Wed, 28 Feb 2024 16:37:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9BB56CE2197;
	Wed, 28 Feb 2024 16:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84AA9C433F1;
	Wed, 28 Feb 2024 16:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709138232;
	bh=yTUJ/M+wPQ4gGvQ4fFiBLW29NKAcpRhcIEmVc20oTGU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=JvQtUCy5wIC4CYR7yEIggs//wBz5ppRanFCwof2wNmEuFGGgkcRQk4SPfFiBUr9kH
	 giYdCseTJJbm0gk+v9nBWkRFiSzf32fCJ0lXlWrN4Wxkjtk3MLMgHxvMYmmkdsALIR
	 qAaeYy2RjNw6ONwnV5+yoP8uWQ5MIjY9Zb9ytVW1YSUx+ZmjD2JhxSKIaWj64bJqf8
	 STcpseRiS+7hpOs1o2K5n5U2Mq/+bG1MwZtKtZT9S6vdEIUog/+Opxp1tOezaQJYQg
	 BSXKClCnEEYtlNYAROrVsHX4s3IyAi78EwMLMIL4Y1yv9VGZ3Fnn4GugqciLgD4EEM
	 iIJQ0Xd+mTzgA==
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
Date: Wed, 28 Feb 2024 18:37:08 +0200
In-Reply-To: <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr> (Marc
	Gonzalez's message of "Wed, 28 Feb 2024 17:12:11 +0100")
Message-ID: <87wmqoilzf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_083715_856893_9900EE77 
X-CRM114-Status: GOOD (  18.55  )
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

> On 28/02/2024 15:03, Kalle Valo wrote:
>
>> Marc Gonzalez writes:
>> 
>>> +  qcom,no-msa-ready-indicator:
>>> +    type: boolean
>>> +    description:
>>> +      The driver waits for this indicator before proceeding,
>>> +      yet some WCNSS firmwares apparently do not send it.
>>> +      On those devices, it seems safe to ignore the indicator,
>>> +      and continue loading the firmware.
>> 
>> This sounds more like a firmware feature, not a hardware feature. What
>> about having a flag in enum ath10k_fw_features in firmware-2.bin?
>
> Are you using the word "feature" as in "it was done purposefully" ?

No, there's no bigger meaning like that. It's more like ath10k has to do
something differently when a certain bit is enabled in the firmware. I
just had to pick a word for the enum and from my limited vocabulary I
chose "feature" :)

> Is enum ath10k_fw_features also supposed to include work-arounds?

Yes, and we already use.

> Sorry, I've grepped over the entire Linux source code,
> and I cannot find where ath10k_fw_features is used,
> other than in ath10k_core_get_fw_feature_str().

Here's one example where in ath10k we use a feature bit as a workaround:

	/* Don't trust error code from otp.bin */
	ATH10K_FW_FEATURE_IGNORE_OTP_RESULT = 7,

        ....

	if (!(skip_otp || test_bit(ATH10K_FW_FEATURE_IGNORE_OTP_RESULT,
				   ar->running_fw->fw_file.fw_features)) &&
	    result != 0) {
		ath10k_err(ar, "otp calibration failed: %d", result);
		return -EINVAL;
	}

BTW for modifying firmware-N.bin files we have a script here:

https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath10k/ath10k-fwencoder

> As mentioned in my other reply, there are several msm8998-based
> devices affected by this issue. Is it not appropriate to consider
> a kernel-based work-around?

Sorry, not following you here. But I'll try to answer anyway:

I have understood that Device Tree is supposed to describe hardware, not
software. This is why having this property in DT does not look right
place for this. For example, if the ath10k firmware is fixed then DT
would have to be changed even though nothing changed in hardware. But of
course DT maintainers have the final say.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

