Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD740C4345F
	for <ath10k@archiver.kernel.org>; Thu, 25 Apr 2024 16:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3bOTElGxiJTR29dsA35gyujjmJyhhjllcERJQUooz58=; b=wPaNbyvXXyHqZH+Nwqj/P0yBM+
	T/+ted7w0sstJ3Pu42WVID8j+2j04Pdzer74TCvCFQPpilzxV1s2AcujiqfWjPeRtn43h7VWckEZY
	1mEwVzB9QTNAh/vqNSjz46mNMzotsJJRCUV5w5qhQsWtp/40+R39J7K7sOWveUgn8UkLVIs/Ns7xS
	0itDvnCa1Ila+YpKN13KAeXFFLXgjr9Oto5DXaJPnd5t2BmYdccA10/ybabTrVpaTXwGMQbHPT63R
	6tOwtBmnWdQ5i6wm1Nly9UVMvVh0kxW+iYiZPI1CPwsJy97U8huTHImfYm3oOVm6ff3WFt4IInk36
	hrkA/kLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s028q-00000009Q7W-1V2c;
	Thu, 25 Apr 2024 16:40:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s028n-00000009Q5c-0zWl
	for ath10k@lists.infradead.org;
	Thu, 25 Apr 2024 16:40:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E2765CE1AF2;
	Thu, 25 Apr 2024 16:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AFEEC113CE;
	Thu, 25 Apr 2024 16:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714063204;
	bh=LbSqadMzoFjsuXSnWvEu/tPbSTkv0wSi5qeCjW/x/YA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=kpCGPsNPtizwkRXzbbBOisqIxYXAYDvBURByNuPNU7j+hAZaM3rY4zD9QvWJosW68
	 iC0L8DM0TP4KnXEx4C3MICMMVEH9a6cqbEgZ7ANWMYOYB6nyRMCg2jexrQAtQQNaO4
	 sS+tAVTrBYCPA95XjLgyBzehFuUM7HqoFrvJ4I1FAjXyN03+BjI2hp4QK/8bHTh7sz
	 CA0JgVVrA7XGz3fZ5GjYINhkpDAI3n3XxKqZtHGVMLXXrpq0YuSbeaa7K2SaZn/zPI
	 ed2bP4EbknrklmiDXJLJCsNer2VxtXL2JV3xQkOXT7D3dMuzr4kwowbBdy2W06/FNN
	 Re8OsFDjeHi7w==
From: Kalle Valo <kvalo@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>,  Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,  Konrad Dybcio <konrad.dybcio@linaro.org>,
  Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,  Jeff Johnson
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
References: <502322f1-4f66-4922-bc4e-46bacac23410@linaro.org>
	<0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
	<CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
	<87ttkh49xi.fsf@kernel.org>
	<e804b257-4dc0-45f1-a5c5-66bda51cf296@freebox.fr>
	<87h6gh406w.fsf@kernel.org>
	<ad5e178b-cd64-4a87-8994-f917993f3bbb@freebox.fr>
	<871q6tu6bn.fsf@kernel.org>
	<de65290c-0f67-4499-ba28-a460e6d6e419@freebox.fr>
	<87msphsb3b.fsf@kernel.org> <20240425-monopoly-barn-45608dae0996@spud>
Date: Thu, 25 Apr 2024 19:39:34 +0300
In-Reply-To: <20240425-monopoly-barn-45608dae0996@spud> (Conor Dooley's
	message of "Thu, 25 Apr 2024 17:02:56 +0100")
Message-ID: <87il05s8ft.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_094009_702710_91554600 
X-CRM114-Status: GOOD (  15.98  )
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

Conor Dooley <conor@kernel.org> writes:

> On Thu, Apr 25, 2024 at 06:42:16PM +0300, Kalle Valo wrote:
>
>> Marc Gonzalez <mgonzalez@freebox.fr> writes:
>> 
>> > On 25/04/2024 11:42, Kalle Valo wrote:
>> >
>> >> Marc Gonzalez wrote:
>> >> 
>> >>> Do you prefer:
>> >>>
>> >>> Option A = never waiting for the MSA_READY indicator for ANYONE
>> >>> Option B = not waiting for the MSA_READY indicator when
>> >>> qcom,no-msa-ready-indicator is defined
>> >>> Option C = not waiting for the MSA_READY indicator for certain
>> >>> platforms (based on root compatible)
>> >>> Option D = some other solution not yet discussed
>> >> 
>> >> After firmware-N.bin solution didn't work (sorry about that!) my
>> >> preference is option B.
>> >
>> > Actually, Option B is this patch series.
>> > Could you formally review it?
>> 
>> I'm happy with this series and would take it to ath.git, just need an
>> ack from DT maintainers:
>
> As far as I can tell, Krzysztof wanted a commit message update for
> 1/3.

That's my understanding as well, I assume Marc will submit v3. I marked
this patchset as 'Changes Requested' in patchwork.

> Usually this dts patch would go via the qcom dts tree, so presumably
> there's a need for an Ack from Bjorn or Konrad?

Thanks pointing this out. What I meant to say earlier that I'm happy to
take patches 1-2 to ath.git but I prefer that patch 3 goes via qcom dts
tree.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

