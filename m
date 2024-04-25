Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA86C4345F
	for <ath10k@archiver.kernel.org>; Thu, 25 Apr 2024 09:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wecDW3pj/IVyIXE6OwD4lY7YJpef/4119ThUZrto40M=; b=ACVUc7f7Dtd5ou5hG3Ixsh0hl3
	e9kuZmTZXYdkSFWRb+KfSXkIuaYrKl0SzrMO5D0lRD11wTJxYed6cV+gBmlMsdEJ/+IILud0C+nfj
	aNa2RanJJ2sIHPruXhe7z0KRgrTDSBMeXzbq9yPzkZX6m73X4tEorMSD8mqVokpuywbBV1fOMU9ac
	cQdKdLH82/k5sN9ztwpCLCBrRTGbzsxZ6N7+FuvBoDrD7Qf8zzLg1B13LbSWTQIDj0m++PZpQEjFd
	3Zlz2rZRd999z6vbZVpVNICG6LwajTzJRDvuamggLFN2pmg0bSguswp+4fbOYAcchSy3pY8u5McFH
	qUW9uugQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzvce-00000007fTd-2Ajb;
	Thu, 25 Apr 2024 09:42:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzvcb-00000007fSg-37gD
	for ath10k@lists.infradead.org;
	Thu, 25 Apr 2024 09:42:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D16561D74;
	Thu, 25 Apr 2024 09:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD23C113CC;
	Thu, 25 Apr 2024 09:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714038146;
	bh=3T9FjsUymGNFdluw54Z0v54M1QVaVyL3oEp/dxeaIlg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=cC5k7vw8ltoalYvDhw0Jk6rN6jkchple0+rnrvgR+80LMeiwhC7qraCbaq5wl53v5
	 Xhw49PZ7Ulsh0qB7iFzNSR2Y7ziceOxydyqP7+hniRpox875fDZUJwqH1BMJHHPb/E
	 nUNiAR+NkWWY/MJuG/eLOTrdjCt/FHTRwLA7ZQZMawUjeA4GnPv0gaPBjal3nFaUm4
	 b8w1o8GCivxXCXnzE7l+qeVrErJH6vHFnwJIV9hsdhclc2+Lnkt/guc/I9hx8RfhTo
	 r1IYqbCKAZ7MtT40/G4seDFTQPsnLmED+pvHyzloW76OZrQGPReFfKsgCS+VgKTSSV
	 9LBhzNUN/C67A==
From: Kalle Valo <kvalo@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,  Konrad Dybcio
 <konrad.dybcio@linaro.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,  Jeff Johnson
 <quic_jjohnson@quicinc.com>,  ath10k <ath10k@lists.infradead.org>,
  wireless <linux-wireless@vger.kernel.org>,  DT
 <devicetree@vger.kernel.org>,  MSM <linux-arm-msm@vger.kernel.org>,  Rob
 Herring <robh+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Pierre-Hugues Husson <phhusson@freebox.fr>,  Arnaud Vrac
 <avrac@freebox.fr>,  Bjorn Andersson <andersson@kernel.org>,  Jami
 Kettunen <jamipkettunen@gmail.com>,  Marijn Suijten
 <marijn.suijten@somainline.org>,  Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
	<5cdad89c-282a-4df5-a286-b8404bc4dd81@freebox.fr>
	<252618e8-9e80-4774-a96c-caa7f838ef01@linaro.org>
	<502322f1-4f66-4922-bc4e-46bacac23410@linaro.org>
	<0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
	<CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
	<87ttkh49xi.fsf@kernel.org>
	<e804b257-4dc0-45f1-a5c5-66bda51cf296@freebox.fr>
	<87h6gh406w.fsf@kernel.org>
	<ad5e178b-cd64-4a87-8994-f917993f3bbb@freebox.fr>
Date: Thu, 25 Apr 2024 12:42:20 +0300
In-Reply-To: <ad5e178b-cd64-4a87-8994-f917993f3bbb@freebox.fr> (Marc
	Gonzalez's message of "Mon, 8 Apr 2024 17:53:01 +0200")
Message-ID: <871q6tu6bn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_024229_904141_AD040AE6 
X-CRM114-Status: GOOD (  22.60  )
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

> On 04/04/2024 17:28, Kalle Valo wrote:
>
>> Marc Gonzalez wrote:
>> 
>>> On 04/04/2024 13:57, Kalle Valo wrote:
>>>
>>>> Dmitry Baryshkov wrote:
>>>>
>>>>> I'd say, we should take a step back and actually verify how this was
>>>>> handled in the vendor kernel.
>>>>
>>>> One comment related to this: usually vendor driver and firmware branches
>>>> go "hand in hand", meaning that a version of driver supports only one
>>>> specific firmware branch. And there can be a lot of branches. So even if
>>>> one branch might have a check for something specific, there are no
>>>> guarantees what the other N+1 branches do :/
>>>
>>> The consequences and ramifications of the above comment are not clear to me.
>>>
>>> Does this mean:
>>> "It is pointless to analyze a given version (or even several versions)
>>> of the vendor driver downstream, because there are exist a large number
>>> of variations of the code." ?
>> 
>> I was trying to say that because the design philosophy between vendor
>> drivers and upstream drivers is very different, we can't 100% trust
>> vendor drivers. It's a very good idea to check what vendor drivers do
>> but we just need to be careful before making any conclusions. Testing
>> real hardware (and corresponding firmware) is the most reliable way to
>> know how different products/firmware work, unfortunately.
>> 
>>> And thus, "it is nonsensical to try to "align" the mainline driver to
>>> "the" vendor driver, as there is no single "vendor driver"" ?
>> 
>> No no, I'm not saying that. I have suffered this "N+1 different firmware
>> branches behaving slighly differently" problem since ath6kl days so for
>> me this is business as usual, sadly. I'm sure we can find a solution for
>> ath10k.
>
> Hello Kalle,
>
> I can spin a v3, no problem.
>
> Do you prefer:
>
> Option A = never waiting for the MSA_READY indicator for ANYONE
> Option B = not waiting for the MSA_READY indicator when
> qcom,no-msa-ready-indicator is defined
> Option C = not waiting for the MSA_READY indicator for certain
> platforms (based on root compatible)
> Option D = some other solution not yet discussed

After firmware-N.bin solution didn't work (sorry about that!) my
prerence is option B.

> Dmitry has tested Option A on 5 platforms, where it does not induce regressions.
> I worked on msm8998, where Option A (or any equivalent) unbreaks WiFi.

What do you mean here? Are you saying that option A works on all
devices? I'm guessing I'm misunderstanding something.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

