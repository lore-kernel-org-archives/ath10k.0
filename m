Return-Path: <SRS0=F+kR=HJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7F0C433E0
	for <ath10k@archiver.kernel.org>; Sun,  7 Feb 2021 16:50:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C4BE64E3F
	for <ath10k@archiver.kernel.org>; Sun,  7 Feb 2021 16:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C4BE64E3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eD2vFnjOALtHksOKx4+R6Twd4KoDOjlYl2D7fHgyUvQ=; b=Rx8ucBQQOleaOqbDQTwsaNgbV
	lwnjvzYMEneWuhSo2KouwUua0IJD0e6Xxt72TtQ2E4lmfS9Agq0rbbOhLFWaNf9qsBjmDx5q9E3Wn
	JVkexOhfG90qYPxtlviVJREfbnWDjtTY9k3MFyqicEMqaC4ga+om7PkJaComV2dORFZD573M4tOl/
	l2M6lTd/X444KTpJZURT38T8oYYqM9/jmCyqcWrXFBkcbgop0QTHZ3/T/1lpzD1zVhiEPAw4VGzb0
	IBe9ARwhv61n2ifQUF0d2nWPPG08kd86Dra1UrzSou0SWkKjkW/J8+oVlFt5rD5jzRSYwbXUmP/Hc
	NpbJU6R0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8nGM-0000s5-9I; Sun, 07 Feb 2021 16:50:18 +0000
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8nGJ-0000rc-04
 for ath10k@lists.infradead.org; Sun, 07 Feb 2021 16:50:15 +0000
Received: from [192.168.254.6] (unknown [50.34.172.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id BE95913C2B0;
 Sun,  7 Feb 2021 08:50:11 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com BE95913C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1612716612;
 bh=jjLziSnxCQr6Y81dWrNpcTX9XPis0YDdVL8j41sY7H0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VMwiOHL5M3S7/XlrJq2XCloMNoAiTsHDSvDHnbL9oXWpscxQitYG64SQ9bfYRUirx
 BmbE7WZ5Al5/kvtHTe8YvlGSI6lWdbgZivScn/LCEN+BJjKa7vo9v82XyHZjFTu2CR
 YzRl/EeakwtrBbxG5k1Cy/FSlmKR2rFnIY8MnYTo=
Subject: Re: EAP AP/VLAN: multicast not send to client
To: Sven Eckelmann <sven@narfation.org>, ath10k@lists.infradead.org
References: <268706864.fOQeQAt3TZ@ripper> <2784478.zUthXOmo2V@ripper>
 <d1f6720d-020f-c5d2-dbff-326ffff95d96@candelatech.com>
 <3442403.JAWNrhsyWg@ripper>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
Message-ID: <1d04209b-f7dd-41e8-b290-cc82ec43186a@candelatech.com>
Date: Sun, 7 Feb 2021 08:50:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3442403.JAWNrhsyWg@ripper>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_115015_249426_2B4D63C3 
X-CRM114-Status: GOOD (  13.27  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 2/2/21 5:57 AM, Sven Eckelmann wrote:
> On Tuesday, 2 February 2021 14:27:01 CET Ben Greear wrote:
>> Sven, I can build you a series of firmware if you have interest in bisecting to see if
>> this is a regression?
> 
> If it is ok for you then I can go through various firmware builds. But it
> could be that I can only start with the bisect at the end of the week. At
> least today, I will have no time after work.
> 
> Kind regards,
> 	Sven
> 

Here are the images:

http://www.candelatech.com/downloads/ath10k-4019-10-4b/bisect/

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
