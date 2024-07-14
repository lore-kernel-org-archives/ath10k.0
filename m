Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E895C3DA42
	for <ath10k@archiver.kernel.org>; Sun, 14 Jul 2024 21:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:To:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SbuiSfGPo1LU4RgG1oIHrw+mQTBo/fZ70XDbOZMqdg=; b=e9eAQUtumT2xkOFNzlXpVYkED1
	wsX9LHrR3FUJgFP+R7ZBO9TUqTkHMlG/vOpgVBe4zcgmeqE4kJujUUBSdL90S+LKCV/2L4exWmbBa
	zjwYT4jAGlpZgvObJGe84SAfS6nXp2PBPI4t7Lm7vCCDURbnrc4yx4AuIfip6eaZ7NwzPn5Ccih1P
	VUQOPpfSNLO85iXS4mtcrD+lE9iAEEOtAILTmmdXa+FHmYvS6IuztX0MknXNnaX9f10BF4HAa9CBj
	T+jXbCtn1b1rc0BMlk3zpYh+vHxj6741Y46smko0ABTW+rGf1HsOLG9xTRBiC8CjBbipYtnEQhFo1
	PxUruHyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT6ZU-00000005BBI-0Y20;
	Sun, 14 Jul 2024 21:15:52 +0000
Received: from mail.kaechele.ca ([2607:5300:60:7a38::25:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT6ZR-00000005BAO-29iC
	for ath10k@lists.infradead.org;
	Sun, 14 Jul 2024 21:15:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FC86C005F
	for <ath10k@lists.infradead.org>; Sun, 14 Jul 2024 17:18:06 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1720991890; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5SbuiSfGPo1LU4RgG1oIHrw+mQTBo/fZ70XDbOZMqdg=;
	b=Y8T/1Ohu+atqtC2M47ubUSPvUCHVDImQBq7KeTRCkTcgqeUYL00uLtaJ2el1UaamGFcwP1
	19GU5GeS/usmxiQYFFHdWuuduri0wAielqj5nxFfs6dom1cob/RC24pdPk5cPO/ezI/bfB
	hl14glq6MWdz+XE92WALEgEBywqmKOI=
Message-ID: <4b3e8f88-9957-4eff-9c28-2ba284a6c0cf@kaechele.ca>
Date: Sun, 14 Jul 2024 17:15:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ath10k@lists.infradead.org
References: <e780560a-86eb-4189-ab5d-3bed3ee5825e@gmail.com>
Subject: Re: ath10k "failed to install key for vdev 0 peer <mac>: -110"
Content-Language: en-US
From: Felix Kaechele <felix@kaechele.ca>
In-Reply-To: <e780560a-86eb-4189-ab5d-3bed3ee5825e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_141549_777216_EB30B6D8 
X-CRM114-Status: UNSURE (   3.87  )
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

I'm not sure if it is related, but I'm seeing the same "failed to 
install key for vdev 0 peer <mac>: -110" message in a few scenarios on a 
QCA9379-3. This is using Ubiquiti nanoHD APs.

1. Group Re-keying

wlan0: deauthenticating from 76:ac:b9:xx:xx:xx by local choice (Reason: 
2=PREV_AUTH_NOT_VALID)
ath10k_sdio mmc1:0001:1: failed to install key for vdev 0 peer 
76:ac:b9:xx:xx:xx: -110
wlan0: failed to remove key (0, 76:ac:b9:xx:xx:xx) from hardware (-110)

followed by a complete reassociation.

2. Roaming / Band Steering

ath10k_sdio mmc1:0001:1: failed to install key for vdev 0 peer 
76:ac:b9:xx:xx:xx: -110
wlan0: failed to set key (2, ff:ff:ff:ff:ff:ff) to hardware (-110)
wlan0: deauthenticating from 76:ac:b9:xx:xx:xx by local choice (Reason: 
1=UNSPECIFIED)
ath10k_sdio mmc1:0001:1: Got RX ind from invalid peer: 50
ath10k_sdio mmc1:0001:1: Got RX ind from invalid peer: 50

Felix

