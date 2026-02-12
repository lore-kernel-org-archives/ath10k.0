Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABD3EEA84C
	for <ath10k@archiver.kernel.org>; Thu, 12 Feb 2026 18:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPfqeMV2nd0ppVMg/dOI3P2KvgX5mKIRWuiHCpgGJ6s=; b=cOLL7QdmgVjZkrAnCDaJINc4lp
	xVC3xFJumvoLF5skJ+bTQnCxzdXcXHE2iv9PWXPQr/A2rW4mXlJSEJof7DMUfc9XoAcWgZ9aO0Jss
	b/n6IKEXqq5lsBit2AZbqQkE2tOJ3T229mRuuT6eC/THlbz7kaMHtaFQrHxVEL0jbIc98pcDs/HZE
	2Iw0TsVQk3ikkL4MlIfykjV6Bxy8vVTgvLeerTF62IJZuwn+uwjbHDx4TfCo869F1COGSf8O8uSZS
	Eqd57rJo+f/I7cHgOWsXjTx5tweAhBPwVCUGuvjJ5s1UoJLoFx+4I4ed/dlyTXXYGG7kG9Csv24mp
	xUBZeQTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqbYK-00000002Wcy-0a7N;
	Thu, 12 Feb 2026 18:36:36 +0000
Received: from mail.kaechele.ca ([54.39.219.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqbYE-00000002WcN-3hrG
	for ath10k@lists.infradead.org;
	Thu, 12 Feb 2026 18:36:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12A50AB8DA;
	Thu, 12 Feb 2026 13:36:23 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1770921386; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=EPfqeMV2nd0ppVMg/dOI3P2KvgX5mKIRWuiHCpgGJ6s=;
	b=S8uqfGPj4bU3tdJLXp/wQp78HiYiyZLCFiNqqcWb/DTjqeerKL59ylNgMvZJiH3HtcmhEx
	TDl77KZjI/Jf7rHyoYTXYHXAVzFUXmJ7cErNUCwB1/3ZOfyRS521ceRGapd9C3/N8EbwdL
	O0FrbFifu4vgQMOk8Mzg+Br4KcJT3js=
Message-ID: <ba5f35a4-d80b-4174-b583-e8cd2d125517@kaechele.ca>
Date: Thu, 12 Feb 2026 13:36:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] wifi: ath10k: only wait for response to SET_KEY
To: James Prestwood <prestwoj@gmail.com>,
 Richard Acayan <mailingradian@gmail.com>, Jeff Johnson
 <jjohnson@kernel.org>, Michal Kazior <michal.kazior@tieto.com>,
 Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org
References: <20260210021249.12132-1-mailingradian@gmail.com>
 <20260210021249.12132-3-mailingradian@gmail.com>
 <dd019903-f8d9-4bd3-a90d-b4d505f489f3@gmail.com>
Content-Language: en-US
From: Felix Kaechele <felix@kaechele.ca>
In-Reply-To: <dd019903-f8d9-4bd3-a90d-b4d505f489f3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_103631_102831_19BC8EA2 
X-CRM114-Status: UNSURE (   3.74  )
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

I also had some hopes that this patch would fix the issue for me on 
QCA9739 SDIO, but even with this patch I am still getting the warnings 
in dmesg.

Regards,
Felix


