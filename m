Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F03C6FD1D
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 22:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNNH+zsOrtamWlCH6Yl0Fll1ik45aYAq1jJDq6P06ck=; b=BJEtlW0PXdRyzD
	pKvK/BVEGKmgnbsEou4Anl4Zyxw8mSAg42rePEq2eH9bNcE6hT7m5V2bEHT9fXx2CABOc+KitAxe5
	6iTFzoZDzHh46Zq715A6kdPILX3R8LHKAM8azYm80RPIz+LNpz9D9tiAkgF5MD8ARKxg4xUrgNjih
	lmwiZcxoCMKsdb8tEmCmMVs+9VfgskGKCOF0rAq9o2p9J6p5z03zQdQTpgAiCXz0X2CvXc99ibseK
	kEEOChe87XBL+w3noQJSIiSALKEmSz726z28V80RDEW6U658zIhcMKEZpUgox9k911uhw2RB5ZKM3
	NvILFPDILQbjAnBktBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdIWT-003ZRe-24;
	Fri, 17 Mar 2023 22:26:05 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdIWQ-003ZQM-2H
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 22:26:03 +0000
Received: by mail-ed1-x52b.google.com with SMTP id ek18so25818694edb.6
        for <ath10k@lists.infradead.org>; Fri, 17 Mar 2023 15:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679091960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0s6t+9RjEdrsp5YQYHkmbrJDFcm9COEbv7mGZ9wgzsU=;
        b=QUqnle+0EmUmhlKvgw/I8Bq1J1xWzYWEmh6yO2NeT7xRGGKs8I8iutPRm2UtOVvhzt
         uXbzA2k4fLC3/5TWUw/e0L6FilIeQ5L92QfwUQMaGcrOql3h/KHXqeqt93F6uVVs3IrY
         jUOikKxfgraE+Cupb8mT4+kJTYThLwqXE8F9PHTRSK6POsiULCIMjTPz/7FUFAN+/aMs
         m7dJlWpJ3KFQV/CsA6l9VEe9NsB0evvX2TTroX0BLK0n0/bygTdsMWA450M2jh27WErU
         87ZYIeveExa3z+UXGQXQ5o57zfMZkIqPQ3+c6OMA6U9WvVJlP+SU1XS2d0Fn55xI5tzV
         MjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679091960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0s6t+9RjEdrsp5YQYHkmbrJDFcm9COEbv7mGZ9wgzsU=;
        b=6WKOpwey5GZYE/GT9T7enfTcLFFqRY+9+jIXO50chtREWE+elL+bFgdd9L9F0vyCKf
         Mp0ybo6ajOSi0bSmj6ITD/AacP+JsPBGFGuHNH6H0UyVWzYfw8ueeE/W7FAFsADwIx3z
         IqKGdQ6khqKgB6WOLyHMURZjqujcV3oKSqDNDw9TzBH+a2Yr8Lu9c9jnk4i4FCUZy5Qr
         LKjrVn1UFgklyKjW8NM9gzugtj07pLM5rvuazfB4QkWdgCOZsJ6zSGn33aeu0drm2DyH
         4n6zt8Vmb6e1Y+ZR8OpAxJgNMx2nRsyFMQaurwC0oHjsoFwvmJlUpzQL7n+3eCDNTGuJ
         Bqlw==
X-Gm-Message-State: AO0yUKVYwbYXnhg/MjxW7YqVe46coWKwwFQylx1ilXX57zHMZ/eQakp2
	jFuPXEVlyv1O02LeYMGNV84=
X-Google-Smtp-Source: AK7set8SBVoNHV487uq5QN66184kD3eVgF4IfriJeM3zmo0G474Q9znhoup7+dw5vZUKchWSIRuW/A==
X-Received: by 2002:a17:907:77d4:b0:930:45ea:4a28 with SMTP id kz20-20020a17090777d400b0093045ea4a28mr1157114ejc.35.1679091960534;
        Fri, 17 Mar 2023 15:26:00 -0700 (PDT)
Received: from shift (p5b0d7c06.dip0.t-ipconnect.de. [91.13.124.6])
        by smtp.gmail.com with ESMTPSA id sd13-20020a170906ce2d00b008e09deb6610sm1408963ejb.200.2023.03.17.15.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:25:59 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift with esmtp (Exim 4.96)
	(envelope-from <chunkeey@gmail.com>)
	id 1pdIVX-0009i4-1k;
	Fri, 17 Mar 2023 23:25:59 +0100
Message-ID: <1b3779a1-7a08-fd26-5fde-c71b648aaa57@gmail.com>
Date: Fri, 17 Mar 2023 23:25:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230215
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org
References: <878rgzuw37.fsf@kernel.org>
 <c9ccbfe1-9535-f46c-756e-4eb19c1afbff@gmail.com> <87a618517g.fsf@kernel.org>
 <97b7f35c-f7c9-1257-ff67-e5b61efe0ce0@gmail.com> <874jqmo7em.fsf@kernel.org>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <874jqmo7em.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_152602_744011_C4521025 
X-CRM114-Status: GOOD (  13.61  )
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

On 3/15/23 07:28, Kalle Valo wrote:
> Christian Lamparter <chunkeey@gmail.com> writes:
>> On 2/20/23 06:56, Kalle Valo wrote:
>>> Christian Lamparter <chunkeey@gmail.com> writes:
>>>
>>>> On 2/15/23 10:17, Kalle Valo wrote:
>>>>> Here's a new pull request for ath10k and ath11k. We have new hardware
>>>>> IPQ5018 and various updates for existing hardware. Especially many have
>>>>> requested the firmware update for WCN6855 which seems to fix an
>>>>> important suspend problem.
>>>>>
>>>>> Please let me know if there are any problems.
>>>>
>>>> Could you also please include all the QCA9888+IPQ4019 boardfiles updates
>>>> from last year too?
>>>
>>> I will try to go through them later. The problem here is that I don't
>>> have much time for ath10k nowadays.
>>
>> Ok, should I just post the board-2.bin updates to linux-firmware?
>> I have them ready to go for IPQ4019, QCA9888 and QCA9984.
> 
> But is the problem that then I don't know which one you picked up and
> which one you skipped? Thanks for the offer but I think it's simpler
> that I'll pick the board files instead like before. I put this now to
> top of my todo list so shouldn't take long.
>

Thank you :-) !

Cheers,
Christian


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
