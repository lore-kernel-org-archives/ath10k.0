Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75156C6FD1F
	for <ath10k@archiver.kernel.org>; Tue,  2 Apr 2024 18:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13vOsyn8jFuJJVMC+4Atlj55N5nsRCUlWW0T7qTrNg8=; b=TV7dosBCVsMCPJI/6NOnnBFPDZ
	W6ptSn4R2PRA1PiugcKkxDXyhBpuBd1cI7SHeRSHzO0TQcCUvGqziAoTW8DBveAw+sjdAeufpLJSZ
	zDFYfcwiJxNIycEBvweq8yPQyldvZCQm0Dh2QrxipRREJV1ixMahfHwR5uQcTtGzVKPgBreO6opyD
	+BAN8F/mIadh1nB3qLfM0KXhLWsm3BMpu6bC587meqqbGBA05by+3+8Ibr1nKoR5q/YVnDXhsTgoU
	mqmfh/BMDN0ffBXKh7DObyex+oTMH/WDtXRnh6yjZa4CkPASDeYji4SKpEq6+10IY+zRwKFJd9ZrN
	Gyqw3uog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrip0-0000000CM9G-1rue;
	Tue, 02 Apr 2024 18:25:22 +0000
Received: from out-185.mta1.migadu.com ([2001:41d0:203:375::b9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rriox-0000000CM8T-3pN6
	for ath10k@lists.infradead.org;
	Tue, 02 Apr 2024 18:25:21 +0000
Message-ID: <8ef4f56c-83a3-4b26-877e-f1c7a0307e98@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1712082313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=13vOsyn8jFuJJVMC+4Atlj55N5nsRCUlWW0T7qTrNg8=;
	b=L1YX9URNDTPG3WJg1YPeki9iW+icQqF/wO8w6tDN5qRGkXxsVo7KMH/3lxaGVUhsqZKmQ9
	wmPPAeMujqXYSapmG6fxxMT9zMDfzOlPt+MKcwkHFHQGTdh3Wn64YJeUb0Zo/4Fk5HipeA
	UWRH3tOlCKJ2p0bBQ7VYVu2lTefGPc/N8P7UpmDrkyxPlQZiH7T+xUPdp44u1938AOvTJu
	mQuYg5BVd/z/41+OupC/5nmXZWc7hzri/MLpnIXE5tkWzWOWV1pCLzcZcIo2WKso9OqzLA
	Tbaa/vrLutQv9wJG/EoZamdgO0ywhVJlPiPwxvMlSWidZJ34vUeCUnwV1S+SYg==
Date: Tue, 2 Apr 2024 21:25:08 +0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>,
 wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
 <5cdad89c-282a-4df5-a286-b8404bc4dd81@freebox.fr>
 <252618e8-9e80-4774-a96c-caa7f838ef01@linaro.org>
 <502322f1-4f66-4922-bc4e-46bacac23410@linaro.org>
 <0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
 <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
In-Reply-To: <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_112520_266496_92267D51 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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



On 02.04.2024 18:55, Dmitry Baryshkov wrote:
> I'd say, we should take a step back and actually verify how this was
> handled in the vendor kernel.


AFAIK there is no such thing in vendor kernel driver for this, as
this startup procedure is likely handled entirely in userspace in
cnss_daemon.

By the way this workaround is needed also for Wi-Fi in sdm630/660,
so no not only msm8998 suffers from this.

 > This sounds more like a firmware feature, not a hardware feature

 > having this property in DT does not look right

I agree with these 2 points above. This can be handled more nicely
as firmware feature encoded in firmware-5.bin using ath10k-fwencoder
and not involve any new DT compatibles or properties.

-- 
Regards,
Alexey Minnekhanov

