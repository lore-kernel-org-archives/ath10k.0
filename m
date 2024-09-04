Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C458ACD4F38
	for <ath10k@archiver.kernel.org>; Wed,  4 Sep 2024 21:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RwY1dW+08MhtUJy3S0XONrTRDp9cFdcHkRJdf+d3TA=; b=Lj2nQYhPlD2SJr/1RfNg0GsP94
	46QRDT0Wl9MWwcolTu0m8UmMv1GmOp30RLpR/hy+ntsmyatqamlNrdwoKs0e3Y6GxpKBV6Rk0WWGb
	N34+qraNnLlaOYnX048GZQUaZUuGtIsiZUTxXche0/idCxFe39Yd9bIFCWc0qXxRAuFsuATJPWBnG
	0FeHCaByIaOj14ztyDrQcv6hSJmUuhW60WYBNqxM9FZu1PjHoHhIvXavSJLdMqKX3V10lUlYIjWUi
	aEUNLs4HT9iZVjhZMt2NXdjSouvQlc5RInKeedlBbOP3v/5wuUDQwc6Y0W0r5IXEwoRGCD0AAJbKT
	NedXIAqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slxn0-000000069kd-2jDT;
	Wed, 04 Sep 2024 21:43:46 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slxm7-000000069ar-0SwO
	for ath10k@lists.infradead.org;
	Wed, 04 Sep 2024 21:42:54 +0000
Received: from [10.62.3.196] (unknown [24.40.161.210])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 83A7661E5FE05;
	Wed,  4 Sep 2024 23:42:36 +0200 (CEST)
Message-ID: <00dfdaab-4d26-45f6-b69d-049ae489b2bd@molgen.mpg.de>
Date: Wed, 4 Sep 2024 23:42:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: failed to remove key (0, ce:ce:1e:27:bb:e0) from hardware (-110)
 (ETIMEDOUT)
To: Kalle Valo <kvalo@kernel.org>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
 James Prestwood <prestwoj@gmail.com>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
References: <d8253ab3-f4f0-40fd-a550-d75eef121b56@molgen.mpg.de>
 <87bk13jwzv.fsf@kernel.org>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <87bk13jwzv.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_144251_323511_CB02B6D1 
X-CRM114-Status: UNSURE (   9.62  )
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

Dear Kalle,


Thank you for your reply.


Am 04.09.24 um 16:48 schrieb Kalle Valo:
> Paul Menzel writes:

>> Linux 6.11-rc6+ logged the warning below when resuming from ACPI S3
>> (or unloading and loading the `ath10k_core`/`ath10k_pci` modules)
>> having been connected to an AVM network:
>>
>>      wlp58s0: failed to remove key (0, ce:ce:1e:27:bb:e0) from hardware (-110)
>>
>> Error code 110 is the value for ETIMEDOUT. I saw James patch [1], and
>> applied it, and the error is still there (as expected).
>>
>> Can the warning be improved so the user know, which component is at fault?
> 
> The warning comes from mac80211 and it already contains your network
> interface name (wlp58s0). What else would you want to see?

As an ignorant user, I do not know what to do with the warning. I’d like 
to see a suggestion how to get rid of the warning. Maybe:

     wlp58s0: failed to remove key (0, ce:ce:1e:27:bb:e0) from hardware 
in X s (-110), please report it to the vendor firmware


Kind regards,

Paul

