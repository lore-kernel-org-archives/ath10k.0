Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BB1C4345F
	for <ath10k@archiver.kernel.org>; Thu, 25 Apr 2024 15:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7U+v1cKnmE3oDLepdzvub24AjJltDNS2b3NPRX3EvwY=; b=qDS6mpTMHDI8w3bGtBuJaM6Dz2
	7GCBvlNB5usVF9cZg7maNpxZqAQ7000Bi2FwUN4qrWONqBennwdJbCIavM9UpuTlONY/SjBWLlIu+
	41vDcTVOw/++PE7ehNHTB823q7GxPMGaveJiw92dRGgwP9hgW5lYyNnZWOXzmDcKyL8hTtjCzd8Bi
	7oz4n3Nw9yBXfSVZTWxx27aGjhfHcHHfmfS39yr/viv/hIaJObFKUlR8928TL+h4M1ATcEJQAI0YU
	/+bKzfBh4juZpx/f0pLxF6n7F2+NvJVioUtbRJtDSkWl9RCCxoxfOJ3WWsV89adJjg/1zk4Ezp2mw
	OxLUSxdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s01Ff-00000009DKT-300h;
	Thu, 25 Apr 2024 15:43:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s01Fd-00000009DK2-1A6z
	for ath10k@lists.infradead.org;
	Thu, 25 Apr 2024 15:43:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A931261E61;
	Thu, 25 Apr 2024 15:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D18C113CC;
	Thu, 25 Apr 2024 15:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714059786;
	bh=We7CJBcpFiTtuiJw0bxly1Y/yD2hktd8wy5CjSTeJeU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=UeQ9XnqBfcEo2PV4stOWd1PCCqh5xB4NHBt3bBNcHrIBiaG8peGRoBKHDpPaZ5xLG
	 NI7BEOx1O/wrU9eUXBEGrvT1XJbP5FUsfd74cNbqEJ3sSwC09/OHxJMvx0QU3u83tt
	 NsxCbA3FhIq7gI/MOXnZ7M3MB+ny7HXB+OI7r9qHNpJd+cPl/k9QsOpSN0OzjnQXve
	 Yss8pXytw1pkIIDvisiQmOR1ykgmeX0nD9mRfN24NjAJ28AQDwXpzjTlSsllLJSnYw
	 t1/6J8VUrHyfEcTzpwzTTa4uB0+H+FGlwpwRAJvONsx997XLo4so9htaP7J88B+MPP
	 ZQkwHvkzZFSqA==
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
	<871q6tu6bn.fsf@kernel.org>
	<de65290c-0f67-4499-ba28-a460e6d6e419@freebox.fr>
Date: Thu, 25 Apr 2024 18:42:16 +0300
In-Reply-To: <de65290c-0f67-4499-ba28-a460e6d6e419@freebox.fr> (Marc
	Gonzalez's message of "Thu, 25 Apr 2024 13:48:50 +0200")
Message-ID: <87msphsb3b.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_084309_382010_1C76F78A 
X-CRM114-Status: GOOD (  11.86  )
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

> On 25/04/2024 11:42, Kalle Valo wrote:
>
>> Marc Gonzalez wrote:
>> 
>>> Do you prefer:
>>>
>>> Option A = never waiting for the MSA_READY indicator for ANYONE
>>> Option B = not waiting for the MSA_READY indicator when
>>> qcom,no-msa-ready-indicator is defined
>>> Option C = not waiting for the MSA_READY indicator for certain
>>> platforms (based on root compatible)
>>> Option D = some other solution not yet discussed
>> 
>> After firmware-N.bin solution didn't work (sorry about that!) my
>> preference is option B.
>
> Actually, Option B is this patch series.
> Could you formally review it?

I'm happy with this series and would take it to ath.git, just need an
ack from DT maintainers:

https://patchwork.kernel.org/project/linux-wireless/patch/84f20fb5-5d48-419c-8eff-d7044afb81c0@freebox.fr/

> Perhaps one thing I could do slightly differently is to NOT call
> ath10k_qmi_event_msa_ready() a second time if we DO receive the
> indicator later.

Good point. And maybe add an ath10k_warn() message so that we notice if
there's a mismatch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

