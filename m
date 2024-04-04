Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412A3CD1292
	for <ath10k@archiver.kernel.org>; Thu,  4 Apr 2024 15:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4t6qwx3MonSiI0Uo3aG8eZwujx8xTZ8Ih7oIW0g68U=; b=5FBqyIMh5MBjMfOmP+JPK0YoHB
	tIsv8OShpbus5s017fO3BCv3N4+T3dXZGPOXLki0WirtJQqaiZxVfcL+190q9lC3XoSE05NNnHVyr
	LUkpjKpg4SBjsPha9xI75cd28MgIj2ISCNHNWzKZt6EsVF1hv3zuvuyGqwMwgF8X+dwx5tGfNo5TO
	8+z1AOeSIqzBZlp42Cgk6SWg3NE6MwAr4mnMV0ucjh0R5Swt7IK4yiB+p1gSMYcEkRg9zWBKbOyFf
	UXNmAD39nw3WqeiMw/gVlNmac3RAa2dD9HvqeXVKhYs4QRku9/JqqxsJpi6U0IydbsKX/R9nTB+d9
	zGd0ty2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsP0j-00000003F8k-2YyJ;
	Thu, 04 Apr 2024 15:28:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsP0g-00000003F7X-11DK
	for ath10k@lists.infradead.org;
	Thu, 04 Apr 2024 15:28:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D73A961200;
	Thu,  4 Apr 2024 15:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143BAC433C7;
	Thu,  4 Apr 2024 15:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712244492;
	bh=kFnpx5tB/cOSNRhheZ9+fj6gL/PgrOpF3Q++o3JjWqk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=B4ZyxnWRY6QDwGCgzRK4sS9Yr2ohJAEihjYC01BJTA4XOv0BmXoLAISwpDGrqqnTv
	 4rsINRdWvn358oQM52XmkKPAG4zc6Z6p+UlPKTvWKQtYj/r4MPYi5N3rcNnywlovgx
	 SJrZCysgn21LtHWb07jv2DT0xovACa/ctMomGNZO82crfF1SZgMiv5qax8V7A85vZS
	 vyOF1P2Fm2/Ez+cz9cYKGXKFOLH0/9tYkxDwEEcjBgASsHcAUIhom7iGM8gXdT+j4Q
	 5ufnKF2//xDq5kDV0176Xn0N827UWHzbpg/Vp/waZ6sXnXO4UFCgoFdA1tARewulLw
	 aqe68yIK0sG2Q==
From: Kalle Valo <kvalo@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,  Konrad Dybcio
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
	<87ttkh49xi.fsf@kernel.org>
	<e804b257-4dc0-45f1-a5c5-66bda51cf296@freebox.fr>
Date: Thu, 04 Apr 2024 18:28:07 +0300
In-Reply-To: <e804b257-4dc0-45f1-a5c5-66bda51cf296@freebox.fr> (Marc
	Gonzalez's message of "Thu, 4 Apr 2024 14:30:40 +0200")
Message-ID: <87h6gh406w.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_082814_455442_630040AA 
X-CRM114-Status: GOOD (  17.82  )
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

> On 04/04/2024 13:57, Kalle Valo wrote:
>
>> Dmitry Baryshkov wrote:
>> 
>>> I'd say, we should take a step back and actually verify how this was
>>> handled in the vendor kernel.
>> 
>> One comment related to this: usually vendor driver and firmware branches
>> go "hand in hand", meaning that a version of driver supports only one
>> specific firmware branch. And there can be a lot of branches. So even if
>> one branch might have a check for something specific, there are no
>> guarantees what the other N+1 branches do :/
>
> The consequences and ramifications of the above comment are not clear to me.
>
> Does this mean:
> "It is pointless to analyze a given version (or even several versions)
> of the vendor driver downstream, because there are exist a large number
> of variations of the code." ?

I was trying to say that because the design philosophy between vendor
drivers and upstream drivers is very different, we can't 100% trust
vendor drivers. It's a very good idea to check what vendor drivers do
but we just need to be careful before making any conclusions. Testing
real hardware (and corresponding firmware) is the most reliable way to
know how different products/firmware work, unfortunately.

> And thus, "it is nonsensical to try to "align" the mainline driver to
> "the" vendor driver, as there is no single "vendor driver"" ?

No no, I'm not saying that. I have suffered this "N+1 different firmware
branches behaving slighly differently" problem since ath6kl days so for
me this is business as usual, sadly. I'm sure we can find a solution for
ath10k.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

