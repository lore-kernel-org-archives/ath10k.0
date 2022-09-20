Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17F9C54EE9
	for <ath10k@archiver.kernel.org>; Tue, 20 Sep 2022 05:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TrjaqKYWv7nZD7BmbhgPTFr/KgeCyBmF3TmnBvb4INM=; b=rixtjVddcsYi+J
	mid8Q9v1jmarkMePMMbkRN5IjMNfXakZu6iTEru5RWsgJuibVuipSfZWyTIz0u8Cdi4GUDFLChl4j
	i6s2Cn5ub1Lf2fAqH2kaP6InT1J/8AvHu1i8m4PLQ9NLz6mAMowRgKQPpN5HoGtlMEYwFi+dIeO4S
	WYQY3DnM1kAIBwuWxaoGbRSO/IamPFU/dcTrubokWighPv+SOrKh7+c23AvFSsziok2ctXxXp4AvM
	DKVLalEBGPHlpB9jj8s571jDwIGOpTJZOCymUK8hnRYjzoJlw4MGmg+W6ntEnLorxfp+rWORlwDov
	gczkbR7OiRKFBxmFG/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaW20-000jBV-LI; Tue, 20 Sep 2022 05:42:52 +0000
Received: from mail.as201155.net ([185.84.6.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaW1w-000j8L-Hz
	for ath10k@lists.infradead.org; Tue, 20 Sep 2022 05:42:51 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]:52170 helo=webmail.newmedia-net.de)
	by mail.as201155.net with esmtps  (TLS1) tls TLS_DHE_RSA_WITH_AES_256_CBC_SHA
	(Exim 4.95)
	(envelope-from <s.gottschall@newmedia-net.de>)
	id 1oaW1l-00068B-2A;
	Tue, 20 Sep 2022 07:42:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=newmedia-net.de; s=mikd;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID; bh=cSPxfDNULS8335PqZiOl1xMpOB11dQ6WXoJ1j1PJL5Y=;
	b=uy/m6mQqJVtsVXkHC6lmDz9LI4quYrHKCRxsO7V6QobXqk3RwA34WCr6GDTgTxZ5tolHKTyENWIfoDjJPh0sGfVhPZYWgPuWyWvRStKUxW/g3Cy5zBSy0rmmjN1ZkZBfkreACk2CX0fGoqaxOJ9MdDS5XLM6iEKIzGLFB8eubuQ=;
Message-ID: <c9904373-7e20-64b6-8900-69d38f2cdef4@newmedia-net.de>
Date: Tue, 20 Sep 2022 07:42:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:105.0) Gecko/20100101
 Thunderbird/105.0
Subject: Re: [PATCH] Revert "ath: add support for special 0x0 regulatory
 domain"
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Tim Harvey <tharvey@gateworks.com>
Cc: Brian Norris <briannorris@chromium.org>,
 Cale Collins <ccollins@gateworks.com>, kvalo@kernel.org,
 Patrick Steinhardt <ps@pks.im>, ath10k <ath10k@lists.infradead.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>, stable
 <stable@vger.kernel.org>, Stephen McCarthy <stephen.mccarthy@pctel.com>
References: <20200527165718.129307-1-briannorris@chromium.org>
 <YmPadTu8CfEARfWs@xps>
 <CA+ASDXPeJ6fD9hvc0Nq_RY05YRdSP77U_96vUZcTYgkQKY9Bvg@mail.gmail.com>
 <CAG2Q2vXce2V3Y6MnPhV6obcNWyQzyusMTL=5oCQLRNh2_ffNYA@mail.gmail.com>
 <CAG2Q2vXFcSVwF4CbU5o3VP1MWwrdqrZjTHgfBj_Q0t3nNipJRw@mail.gmail.com>
 <CA+ASDXNx30A3=BA9b-tiAQzYHP=nV_eLw1QFpJij=F=JgWZ5sg@mail.gmail.com>
 <CAJ+vNU38WyC=FFZVgqyKunEnjXid6vXqkorv8a8+ywjJBk_0NA@mail.gmail.com>
 <CAHNKnsTEBr4m1SpZxnfFPWiSgxBg5HhqYCdWwm=9gp7qHXg=Pg@mail.gmail.com>
From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
In-Reply-To: <CAHNKnsTEBr4m1SpZxnfFPWiSgxBg5HhqYCdWwm=9gp7qHXg=Pg@mail.gmail.com>
X-Received: from [2003:d4:df03:78ee:bd3f:9dfc:a067:ec5]
	by webmail.newmedia-net.de with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.72)
	(envelope-from <s.gottschall@newmedia-net.de>)
	id 1oaW1l-0007RI-Ev; Tue, 20 Sep 2022 07:42:37 +0200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_224248_967990_0F29FB7D 
X-CRM114-Status: GOOD (  12.80  )
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

Am 20.09.2022 um 01:42 schrieb Sergey Ryazanov:

> Hello,
>
> I would like to add my 2c.
>
> On Mon, Sep 19, 2022 at 8:25 PM Tim Harvey <tharvey@gateworks.com> wrote:
>> I'm not clear if
>> there are many other cards that have this same issue.
> The list of cards with unprogrammed regdomain can be extended with
> several relatively modern models:
>    * MikroTik R11e-5HacD (QCA9882 based)
>    * MikroTik R11e-5HacT (QCA9880 based)
>    * QNAP QWA-AC2600 (QCA9984 based) [1]
>
> As you can see these are powerful and massive cards for WISPs. Or at
> least to run as an AP. I also know a bunch of .11a/b/g/n cards with
> zero regdomain and the same target audience. Except maybe for the
> legacy Wistorn CM9, which is a relatively compact card.
>
> Also, a huge number of wireless routers and access points have
> unprogrammed regdomain. But probably this is not the case, since they
> anyway can not run a stock kernel.
>
> 1. https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1895333
let me add my 2c. the regdomain 0 is very common and defacto a standard 
for all non oem cards on the market. i have only seen real programmed cards
as buildin cards in laptops.
beside of these zero cards there are other special regdomains available 
for ath cards

>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
