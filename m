Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9830DC433EF
	for <ath10k@archiver.kernel.org>; Thu,  2 Dec 2021 22:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXu5XvLxqQZeXelxr1ADxW3HqjQX5BXNx2wU9us4chQ=; b=nhRn0jytgEDtRy+TJW2rXKCH9x
	edns366J0fV/InYWcUa3JLT54wAyllc4l1dWuzVqNFug39CofLCQ7cga0lJdaWAAbBzvHK4Vh/lQi
	5aduoNuHfEEs+mnWY+OOQ51+n+gcBJg1u+j/gfWZWRDoNnKt3aBHu21rm8592LRjnXeMvFizFTqs9
	KGVxc7J5LTfvcCcGwRGlcSsBg+h5B7jkqqdUttLgKr/MKnLCWvjEdmMReIvMKnDQWVYKUDGb0tmJV
	D7ceHi5zYqdVYsm9ddnfmdXQtyDIqng6WtOUfhizqOriz6DItI2/oJY80EZ9xWzmA5xr7MaEN1u+V
	bfVgjKuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msuxa-00De8Z-Vu; Thu, 02 Dec 2021 22:53:51 +0000
Received: from phobos.denx.de ([85.214.62.61])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msuxS-00De7N-Lm
 for ath10k@lists.infradead.org; Thu, 02 Dec 2021 22:53:44 +0000
Received: from mail.denx.de (unknown
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: festevam@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 66F0D837AE;
 Thu,  2 Dec 2021 23:53:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1638485619;
 bh=hXzKWymD8qubSEMxDYn9uOYmLSwlCjdx4jZciu43L4M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QhTrb1Tv+3ZtZJRZxO/pjtkm/1dzS59bmg8K8y94xxD5AfZxAATW8GfJ4JD581V8P
 J3R+rAVMTWFP9y9TK7rekS4soeK16z0tlZBzVymEC//W0t+wpneK4SX4a6IUzF0mXr
 s+SXyAUUtZ6XA5ofwMBDSsKTW77iUR2KErO/HsDDgQkHee6Gcbr/kd8ui/36Q+Q5Jr
 upQegE2njwY0b+A3tWSzNSUKf7wjlySkDuDEaDhqkVdJgxLoeEWtdKzomz6nHiKN53
 aXciCdng8vKilb8vsHEjkuzoqrgnB7jM+RJgdDEAg3UaWtLzWfKjSVWrwNmpuUsEOt
 lmK9RW5d8BrMw==
MIME-Version: 1.0
Date: Thu, 02 Dec 2021 19:53:39 -0300
From: Fabio Estevam <festevam@denx.de>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 wgong@codeaurora.org
Subject: Re: [PATCH v3] ath10k: Fix the MTU size on QCA9377 SDIO
In-Reply-To: <87sfvcl7t0.fsf@codeaurora.org>
References: <20211124131047.713756-1-festevam@denx.de>
 <87sfvcl7t0.fsf@codeaurora.org>
Message-ID: <4fdc37d43e7d728db66b97d6cbf598e2@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_145343_013811_943C2AA4 
X-CRM114-Status: UNSURE (   8.60  )
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

Hi Kalle,

On 01/12/2021 11:27, Kalle Valo wrote:

> I prefer to have also the false cases for every hardware so in the
> pending branch I added those:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=afbf52bffb36bc25e7a1e81e1f975bb75696d3c8

It looks good. Thanks for the adjustment.

Thanks,

Fabio Estevam
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-60 Fax: (+49)-8142-66989-80 Email: 
festevam@denx.de

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
