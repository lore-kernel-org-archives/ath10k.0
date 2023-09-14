Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8E7CA0EF3
	for <ath10k@archiver.kernel.org>; Thu, 14 Sep 2023 05:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B4sjY+o97AF+KtYIBgDdxg9iUG10qDNUYdmbDv+QAZE=; b=A/y2+sNcU2eDwv3Dav6IJWtawq
	iMIhcwylBQ8Cxauz0cR8wwQiqrS0teAJNMThDgpTjvcoyJ9TF1vxwKIqh1qvFJOmr1cNwm0twoOAX
	nhopKXZAC5kKXSPJksP52IZaybgUfODTU9GXZvMt22sIwQvdxyya7J4SZHL2DFy5HrFZv0cPTzToQ
	xKJKASzhWs/V3MrvPHFmUlIQMM2hWro2hfVgDyhf1JSus3vmPRrH0tFvokTqr3ZAob3h2DiZoe0Mb
	jRpJjg48jtg+j16r4OobKx0txGIxLxI1LGZKQwj/f9CqRTMhk4XZh4NUKKYhPoHY5FyrwTwCNmug4
	NRNYGDOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgehr-007PIq-0O;
	Thu, 14 Sep 2023 05:15:59 +0000
Received: from forward100b.mail.yandex.net ([178.154.239.147])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgehm-007PGz-2z
	for ath10k@lists.infradead.org;
	Thu, 14 Sep 2023 05:15:57 +0000
Received: from mail-nwsmtp-smtp-production-main-10.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-10.sas.yp-c.yandex.net [IPv6:2a02:6b8:c14:2481:0:640:e0:0])
	by forward100b.mail.yandex.net (Yandex) with ESMTP id 8797360089;
	Thu, 14 Sep 2023 08:15:42 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-10.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id fFYVPqGDTOs0-O6ZNxOco;
	Thu, 14 Sep 2023 08:15:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1694668542; bh=ox8S0AYBWW2vIsLEAJrgWtPvQJNpgJyGEPJ1NUjciHo=;
	h=Subject:From:Cc:To:Date:Message-ID;
	b=Lty76Epb2apKoBTQgFhWLobldjUD3msG7fyvF7qCxeCAkz9Tpv8TyDrYSrQa9k/KE
	 buwexGnydGTRmWH1/J8KH5z9DGs4whOhmVzTwvfQjIIix+OcvGDdWADku1V+LGDTgP
	 j482wHpKHAfJsE0wkIBj3DEf/zXNamUl7LPEoeqg=
Authentication-Results: mail-nwsmtp-smtp-production-main-10.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <9485af8e-3379-f592-0e8f-0eaebf4fbc05@yandex.ru>
Date: Thu, 14 Sep 2023 08:15:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org
From: Dmitry Antipov <dmantipov@yandex.ru>
Subject: On status handling in ath10k_htt_rx_tx_compl_ind()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_221555_445097_BBDA7FDD 
X-CRM114-Status: UNSURE (   4.91  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

In 'ath10k_htt_rx_tx_compl_ind()',

int status = MS(resp->data_tx_completion.flags, HTT_DATA_TX_STATUS);

actually is

int status = (((resp->data_tx_completion.flags) & 0x07) >> 0);

which can't be equal to HTT_DATA_TX_STATUS_DOWNLOAD_FAIL (128)
regardless of the 'data_tx_completion.flags' value. This is most
likely a weird (but I have no clue how serious it may be) bug.

Dmitry

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
