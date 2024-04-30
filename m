Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AC8C10F16
	for <ath10k@archiver.kernel.org>; Tue, 30 Apr 2024 04:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIhuQ3BiYotNR1EhiANviRSW2G6PoogSSK6+92T7fAA=; b=QfvB9V1ZExQxZrA7Fa8CD9TX4u
	WcVWCO8yqIJmYccTpkmbdkHvw5YLfE2UZAgxdKmcZS/TVvNgTzCkEDUqXXQae1cxl0+ml0ldNuxgF
	XNIZqYTONenI+Z862jK5Qdk7Dm+TRAwFJ0JDQGdypDLLEKgMT+FBdORPf1qqGV49r8LEKwhYahgIF
	8iwm8dGkQ+AF+Olihkctd8GADWgYvbO2OiMeIpjAPLiCiVgjH+c8jt+xz7XTtWCTA+RjgNbWsm29P
	t7g9Um4d5oFFXIG2ehpAQ5xsQ2cubjnnP7G7hGHF4YiDfA3p7sBBO0L43GvDNBKWgI+KgImqlBoL0
	L7bJ/mSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1elg-00000004zq2-1FaK;
	Tue, 30 Apr 2024 04:07:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1eld-00000004zpL-2DVa
	for ath10k@lists.infradead.org;
	Tue, 30 Apr 2024 04:06:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 01DEB60C1C;
	Tue, 30 Apr 2024 04:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4EACC2BBFC;
	Tue, 30 Apr 2024 04:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714450015;
	bh=iBhXqbeiDrU6vv91AowziuD116kMDvclTlVrNyh/zr8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=GtE4DjU8iLxl3H9D5LkIqL2GVzZMxFBhLgElWpKzFjUA+HP4I5n/m2Mqhs4sBRFn9
	 ZEc1QwHnrDz7HicN+VzY7aGfWyMOOAOb8sNTHN2MxU+gT+V3pOmchYFK9tDzeQa21I
	 TaAjfFWhGtpruZUeMHNCtMjuvOjZVlGdBXDU1Z+Iu0Q1yZswRm1XrM2EbMwoOouT7h
	 0a4mHArM756gqH5aiaiN379suahUH/hZurVx6W6dl3dTaZYn77qo3ORr4BjROJyuVO
	 24titcThvMTOsg7+N5TKcamLmNyjIoVcA5RoRm/YsCbS5oEPLLhCOPh6SAy04xvIhv
	 xf+urDRscN3pg==
From: Kalle Valo <kvalo@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>,  Jeff Johnson
 <quic_jjohnson@quicinc.com>,  ath10k <ath10k@lists.infradead.org>,
  wireless <linux-wireless@vger.kernel.org>,  DT
 <devicetree@vger.kernel.org>,  MSM <linux-arm-msm@vger.kernel.org>,  Rob
 Herring <robh+dt@kernel.org>,  "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
  Pierre-Hugues Husson <phhusson@freebox.fr>,  "Arnaud Vrac"
 <avrac@freebox.fr>,  Bjorn Andersson <andersson@kernel.org>,  "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,  Jami Kettunen
 <jamipkettunen@gmail.com>,  Jeffrey Hugo <quic_jhugo@quicinc.com>,  Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,  Alexey Minnekhanov
 <alexeymin@postmarketos.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
References: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
	<54ac2295-36b4-49fc-9583-a10db8d9d5d6@freebox.fr>
	<ZjBV+th9DmnNLhnN@hu-bjorande-lv.qualcomm.com>
Date: Tue, 30 Apr 2024 07:06:49 +0300
In-Reply-To: <ZjBV+th9DmnNLhnN@hu-bjorande-lv.qualcomm.com> (Bjorn Andersson's
	message of "Mon, 29 Apr 2024 19:22:50 -0700")
Message-ID: <8734r3qysm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_210657_684537_ECA5DAD6 
X-CRM114-Status: GOOD (  19.87  )
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

Bjorn Andersson <quic_bjorande@quicinc.com> writes:

> On Mon, Apr 29, 2024 at 04:04:51PM +0200, Marc Gonzalez wrote:
>
>> The ath10k driver waits for an "MSA_READY" indicator
>> to complete initialization. If the indicator is not
>> received, then the device remains unusable.
>> 
>> cf. ath10k_qmi_driver_event_work()
>> 
>> Several msm8998-based devices are affected by this issue.
>> Oddly, it seems safe to NOT wait for the indicator, and
>> proceed immediately when QMI_EVENT_SERVER_ARRIVE.
>> 
>> Jeff Johnson wrote:
>> 
>>   The feedback I received was "it might be ok to change all ath10k qmi
>>   to skip waiting for msa_ready", and it was pointed out that ath11k
>>   (and ath12k) do not wait for it.
>> 
>>   However with so many deployed devices, "might be ok" isn't a strong
>>   argument for changing the default behavior.
>> 
>> Kalle Valo first suggested setting a bit in firmware-5.bin to trigger
>> work-around in the driver. However, firmware-5.bin is parsed too late.
>> So we are stuck with a DT property.
>> 
>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>
> This says "Pierre-Hugues certifies the origin of the patch" then "Marc
> certifies the origin of the patch". This would have to imply that
> Pierre-Hugues authored the patch, but you're listed as the author...
>
> Perhaps a suitable answer to this question would be to add
> "Co-developed-by: Pierre-Hugues ..." above his s-o-b, which implies that
> the two of you jointly came up with this and both certify the origin.

BTW I can add that in the pending branch, no need to resend because of
this. Just need guidance from Marc.

> Other than that, I think this looks good, so please upon addressing this
> problem feel free to add my:
>
> Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Thanks, I'll then add this as well.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

