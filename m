Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC902C0219B
	for <ath10k@archiver.kernel.org>; Tue, 11 Feb 2025 19:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EE+yQbl5Ke4mLQFpG396YSrcPFiCdV/YSH73c0REjKM=; b=jF1FSGRvQghxd0nRNsTz4TMboa
	gXLauWZ2rFKQNVkvOL+t8guGn0WDITLxks/yd2HAo1veUa8MQQ9iHMVTeDdVCD7iBuXNnj5pY4S5V
	IgyawskvGlcse8xYLhpCC4A3sn3SVJOVbbW3sp5dCr4AeAUtL5KJHST28z3YlIeXnM2yzqr1afPzQ
	pyY+97N1rSahoT+ufjrnmpPD1BjBGEmYCB0uQBJAVT4Nv/sWgRIOGafQi2gUhec6+omI/QY+YqIal
	bY8YVxYz3drJjPyo3yICiP8lz4sAboRZAbPJLhmikttH73ONlAiYHqCXodG31Ta/WclwKjd/Tq2v8
	16zw2pKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvng-00000004zB9-1vFc;
	Tue, 11 Feb 2025 19:20:04 +0000
Received: from mail.kaechele.ca ([54.39.219.105])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thvne-00000004z9z-0vFK
	for ath10k@lists.infradead.org;
	Tue, 11 Feb 2025 19:20:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5781EC005F;
	Tue, 11 Feb 2025 14:19:51 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1739301596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EE+yQbl5Ke4mLQFpG396YSrcPFiCdV/YSH73c0REjKM=;
	b=bX5qbcsR19xAof89llQ7c3ZqM3nDLPHc9zZWMR9qAUrguW73tvt0OTqWdtsRsW8DLbiBl6
	2XN95rRCAwX58VoRv8cvLwNFPDOjF8lzEiX4T+r6qUtogNroJ3JnEpmbt1w/M0orbstS80
	6HjoH3eUM2qVhHseCdE6dDv4LbVT7hc=
Date: Tue, 11 Feb 2025 20:19:48 +0100
From: Felix Kaechele <felix@kaechele.ca>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org,
 Kalle Valo <kvalo@kernel.org>
CC: linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 2/2] wifi: ath10k: add support for QCA9379 hw1.0 SDIO
User-Agent: Thunderbird for Android
In-Reply-To: <4ac25dfb-ab59-4909-a717-41a6e752295d@quicinc.com>
References: <20240908013244.496382-1-felix@kaechele.ca> <20240908013244.496382-3-felix@kaechele.ca> <c1385aa1-0d41-4ed7-a00c-e40c69bafeaa@kaechele.ca> <06bf90a5-db29-46b4-b983-439c2b32b143@quicinc.com> <4ac25dfb-ab59-4909-a717-41a6e752295d@quicinc.com>
Message-ID: <ADED7904-C9B4-4E03-95C1-E74359638BB7@kaechele.ca>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_112002_446552_36EBD8B9 
X-CRM114-Status: UNSURE (   8.79  )
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



On February 11, 2025 7:57:25=E2=80=AFp=2Em=2E GMT+01:00, Jeff Johnson <qui=
c_jjohnson@quicinc=2Ecom> wrote:
>
>Now that Kalle has stepped down, I've inherited this series=2E
>

Thanks for picking this up!

>I have one question: what firmware & board file does this use?
>

It uses a firmware and board file that I extracted from the original Andro=
id image=2E It did not come with licensing information, so I am not sure if=
 it can be redistributed=2E But it works fine with ath10k using this patch=
=2E

>It seems strange to enable the driver unless there is also firmware and a
>board file in linux-firmware=2E

I tend to agree which is why I inquired about it here: https://lore=2Ekern=
el=2Eorg/ath10k/96597f1d-5072-4915-be5a-e685dc85614a@kaechele=2Eca/

I don't know who to reach out to at Qualcomm to get clarification on this=
=2E

>/jeff

Thanks!=20
Felix

