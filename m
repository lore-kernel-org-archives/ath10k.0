Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6312EC4345F
	for <ath10k@archiver.kernel.org>; Fri, 12 Apr 2024 13:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8DuGsoSqYZPjczFjR6YJavLINd+xtiCh8KcU4BWLn0=; b=TC3FgCePjPVswJlAKoMIbCyG7r
	5Xmmm1fs/vZ0VnG1HlX28i+8+31/rLUc6Ri4aDzWEFoNVwleGSWLvackOdghMfB/SB6RDJD7Vsw9j
	vopu66duxBtcuTFY+ARWhzCSV9sxLbp3Zdc1dhCBtYEiRVqShic+sCJBKCR++WHUM49hD1rqt0RXC
	AixdLGm1MrMgQnBqAGRSKgZAgiQYE+KRAihfCwVDrCFfghP1izv1WfOu+nkAAGSG+DKVDOWPYQrsp
	wdVJK/2RsmX1YSBUzIiK6BJHp7kOxkYZuc/SupnGOZt5EAqNhEtn3u18zVh9LDtbWjD5U66hNS5R2
	w/aJbZ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvH9d-0000000HNiR-2oLg;
	Fri, 12 Apr 2024 13:41:21 +0000
Received: from mail.kaechele.ca ([54.39.219.105])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvH9Z-0000000HNhB-1krj
	for ath10k@lists.infradead.org;
	Fri, 12 Apr 2024 13:41:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35E0AC006A;
	Fri, 12 Apr 2024 09:42:13 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1712929335; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=A8DuGsoSqYZPjczFjR6YJavLINd+xtiCh8KcU4BWLn0=;
	b=fooL5cw8cJ8VfU6+2J269qWLCJCPMWuK+ObmecjTxvzffzV0LLs8yiy9a5ytuqzr8XcH6i
	mEJOtp5MomXZ3UVRRN2xEz9M3kW1VB2veWYvCQrSNKtRK6e3fbcV1WdxNPveTvlcB8Djyp
	QnVm48SPc2CsyFs6oEq/ej3+W/StaUM=
Message-ID: <43686c6f-f801-4344-9e1c-676969c0ada0@kaechele.ca>
Date: Fri, 12 Apr 2024 09:41:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Issue with ATH10K driver on sunxi platform using sdio
To: Lukas Schmid <lukas.schmid@netcube.li>, ath10k@lists.infradead.org
References: <c6d50711d4970747aae8e088e5f7c99e@netcube.li>
Content-Language: en-US
From: Felix Kaechele <felix@kaechele.ca>
In-Reply-To: <c6d50711d4970747aae8e088e5f7c99e@netcube.li>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_064117_767709_5A4D2E36 
X-CRM114-Status: UNSURE (   7.37  )
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

Hi Lukas,

On 2024-04-11 16:17, Lukas Schmid wrote:

> The modules are loaded correctly, the module is detected and scanning 
> for networks works. However when trying to connect to a network, I get 
> the following message about an unaligned scatterlist.
> 
> ----------------------------------------------------------------------------------
> 
[...]
> [   56.217995] sunxi-mmc 1c10000.mmc: unaligned scatterlist: os 4c0 
> length 11
> [   56.218020] sunxi-mmc 1c10000.mmc: map DMA failed
[...]
> 
> ----------------------------------------------------------------------------------
> 
> Has anyone maybe got an idea as to how this could be fixed?

sunxi-mmc could implement a bounce buffer to gracefully handle these 
unaligned DMA operations. This is what other architectures do.

Here's an example from STM32: 
https://patches.linaro.org/project/linux-mmc/patch/20220328145114.334577-1-yann.gautier@foss.st.com/

Regards,
Felix

