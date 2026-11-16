Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975FC606A329
	for <ath10k@archiver.kernel.org>; Mon, 16 Nov 2026 13:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2vO5sA2u;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.a=rsa-sha256 header.s=201907 header.b=AWSy6z8W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qv0E9umeW5iq8XQGTrmgEL6yTVV22eJdaaUMd3VC/yE=; b=2vO5sA2upxfupT
	GgOqosuFMylettJ4GXER/kIaSa5GLpCQqBoBNtb8kWDXfkdM9LZ5hMLmqOxtE1w9f0Gnrr1d7CS9e
	AXCC7ef8WumqZzQmhytbBuC9zxyL5wRD7mKRwC5C2y7Tf1RS7k2XhRKfYduJgl295filqQy8ByheS
	BWDLEnIRQSYH3t5rtrvYIpsuxSqVzkJc8ZiAHfYCTAET+QPKwSlIibuivtzB7vYBCLFPT66uzguei
	facI7b1fBsqP3NU+sQQEJ9tNPifI0Blz/dZ/fUYdWuV0z3EjSpuq1Ly0TwwG/JFKIm0XejDJhHKzJ
	SKPOoSPE8A2OuprdA+ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwYb-00000002ZXs-1auV;
	Mon, 16 Nov 2026 13:15:37 +0000
Received: from mail.kaechele.ca ([2607:5300:60:987e::25:1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwYX-00000002ZVK-2nh5
	for ath10k@lists.infradead.org;
	Mon, 16 Nov 2026 13:15:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFB0035D6F5;
	Mon, 16 Nov 2026 08:15:25 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1794834928; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qv0E9umeW5iq8XQGTrmgEL6yTVV22eJdaaUMd3VC/yE=;
	b=AWSy6z8W3uvYmeAuapaWKYflN50ECGqbmimuMrILuDvQmoWKqOAOB80/0kVY/H9Ib1Dwkr
	L+hUgnzzYoTPT5Rl8JC1mUIpY2dq2Iqkw2MSOaC4R/PrmrSExTxWK9pSaE1NDwpbjjt3e/
	qkpNZQ+m/TNBbLHzCFRCzwclxRSq9Ho=
Message-ID: <a1f4322b-0564-44cb-a548-ff87d2b19595@kaechele.ca>
Date: Mon, 16 Nov 2026 08:15:23 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/6] wifi: ath10k: usb: fix group key
 installation
To: Tomas Paukrt <tomaspaukrt@email.cz>, David Heidelberg <david@ixit.cz>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 phone-devel <phone-devel@vger.kernel.org>, jjohnson@kernel.org
References: <20261114090737.64348-1-tomaspaukrt@email.cz>
 <20261114090737.64348-2-tomaspaukrt@email.cz>
 <7e36cb20-7752-4778-b068-56d41819f670@kaechele.ca>
 <dfae62c8-6fd0-40da-bc4c-65d4d6594cd0@ixit.cz>
 <5Nd.ZqDG.68CtbqKyNmY.1g{Phm@seznam.cz>
Content-Language: en-US
From: Felix Kaechele <felix@kaechele.ca>
In-Reply-To: <5Nd.ZqDG.68CtbqKyNmY.1g{Phm@seznam.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_051533_908307_1C0C8466 
X-CRM114-Status: GOOD (  16.22  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I can confirm that the fix from this patch (without the bus check) also 
fixes the group rekeying issue on QCA9379-3 (SDIO, firmware 
WLAN.NPL.1.6-00163-QCANPLSWPZ-1) without David's patch applied.

Regards,
Felix

On 2026-11-15 06:43, Tomas Paukrt wrote:
>> Hello.
>>
>> I'm pretty sure it's not related to the USB bus, but related to the device firmware.
>>
>> Check what firmware you use, add the `.no_pairwise_key_del_ind = true` and
>> report if that solves your issue, I'm happy to send v2 with your usecase covered.
>>
>> David
>>
>> P.S. Felix, thanks for Ccing me here :)
> 
> Hi David and Felix,
> 
> I tested David's patch with .no_pairwise_key_del_ind = true on QCA9377-7
> against my patch, 30 minutes of disconnect/reconnect cycles each.
> 
> You are right that the firmware sends no HTT security indication for
> the pairwise key removal, and David's patch fixes that part here too.
> 
> But QCA9377-7 has a second problem: the indication for the group key
> installation comes late, from 47 ms up to 4 s. With David's patch 64
> of 184 group key installations (35%) still timed out and mac80211
> deauthenticated.
> 
> WMI_VDEV_INSTALL_KEY_COMPLETE_EVENTID arrives within 1 ms for every
> installation and removal. Completing install_key_done on it gave no
> timeout in 211 connections.
> 
> So David's patch alone does not fix QCA9377-7. I agree the issue is
> not USB specific. Without the bus check, the wait would be completed
> on the WMI event for all WMI-TLV targets. Could you check if my patch
> without the bus check also works on WCN3990 and QCA9379 SDIO?
> 
> Thanks
> 
> Tomas


