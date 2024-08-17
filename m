Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55ED2C3DA4A
	for <ath10k@archiver.kernel.org>; Sat, 17 Aug 2024 00:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65ox8uJ/RGg4OUccZkQBwsIw3G2kyJQ+60meEiFHu3U=; b=DJG6yA+QVcL8bW0YnRNPVWn86F
	WrJRPBMHVVsAf1esU9amVogi/KVWMMFKfXJLOJHLwjHYLMeut/lGSR1SJFWV4rgQXzLEOyMqrsoFU
	kbfBZSalYiQ6CTSxt2oX4IjASF2Nj3pb2HKSVpgOhrlJZGCmfg/hfnVdqee3jyoJid5DnteCtqqmT
	CJ15jCGVNlymmShFnuqVfTjbx2mbGEJHy/ynVZBhgv+1G15qrETJ7AYP1OFaVnbisv6bCbaRO2hwN
	fBJ03mAKR0uM0ke9yy3R1c1yqUntw7in2IpfXGHhJgeIdNefTEfCuJU3vxbpdhagxCAC/qk79vBUH
	coide85A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf7hD-0000000EPPE-0GJJ;
	Sat, 17 Aug 2024 00:53:31 +0000
Received: from mail.kaechele.ca ([2607:5300:60:7a38::25:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf7h9-0000000EPOI-3ELE
	for ath10k@lists.infradead.org;
	Sat, 17 Aug 2024 00:53:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7948C005F;
	Fri, 16 Aug 2024 20:54:05 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1723856048; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=65ox8uJ/RGg4OUccZkQBwsIw3G2kyJQ+60meEiFHu3U=;
	b=QTX7qDQtswjk4HLypiq3ROfp1fuyHwOaCPZgDG7vAFfxdfVVl4u/zMf31rMzbRaWAE28CP
	Cutat57ff2Zm2mUy5q9O1ENqtb+vt98NMqgqza4R0AjDVghBBG3ynrL3THR+dupA+hBq5A
	CVyLcNHd74SgJNkRxfN5R9bNT00jIVI=
Message-ID: <10435420-4f1f-4a56-aacd-41866ae7dac3@kaechele.ca>
Date: Fri, 16 Aug 2024 20:53:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/1] wifi: ath10k: improvement on key removal failure
To: James Prestwood <prestwoj@gmail.com>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org
References: <20240814164507.996303-1-prestwoj@gmail.com>
Content-Language: en-US
From: Felix Kaechele <felix@kaechele.ca>
In-Reply-To: <20240814164507.996303-1-prestwoj@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_175328_109973_3B522D99 
X-CRM114-Status: UNSURE (   3.79  )
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

I was somewhat hoping that it could fix the issues I'm having with my 
QCA9379 as well, but it seems that's not the case.
Still getting

[ 7660.485652] ath10k_sdio mmc1:0001:1: failed to install key for vdev 0 
peer 76:ac:b9:xx:xx:xx: -110
[ 7660.485679] wlan0: failed to set key (2, ff:ff:ff:ff:ff:ff) to 
hardware (-110)
[ 7660.509935] wlan0: deauthenticating from 76:ac:b9:xx:xx:xx by local 
choice (Reason: 1=UNSPECIFIED)
[ 7661.836653] wlan0: authenticate with b2:8b:a9:xx:xx:xx (local 
address=de:56:bb:xx:xx:xx)
[ 7661.836685] wlan0: send auth to b2:8b:a9:xx:xx:xx (try 1/3)
[ 7661.849449] wlan0: authenticated
[ 7661.853884] wlan0: associate with b2:8b:a9:xx:xx:xx (try 1/3)
[ 7661.902242] wlan0: RX AssocResp from b2:8b:a9:xx:xx:xx (capab=0x1111 
status=0 aid=2)
[ 7661.913192] wlan0: associated
[ 7662.187718] wlan0: Limiting TX power to 24 (24 - 0) dBm as advertised 
by b2:8b:a9:xx:xx:xx

once every hour.

That's unfortunate.

Regards,
Felix

