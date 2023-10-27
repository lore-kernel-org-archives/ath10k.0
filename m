Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC8BC25B67
	for <ath10k@archiver.kernel.org>; Fri, 27 Oct 2023 09:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xByKuBhLWsf6v+cYyqtn1S46ukOu5pkdhrAU4GMtedI=; b=Nms7Yv/+bJ5WLK
	PUEvNQkWD9eUsgWAXIdjX9c9fFj7tZcK+aiNWtE1I0/62li2kfQ3zH2Rai6I334Y85Wpe1JNB1rBJ
	5mBOVHlDX8pUtj8jrV0p/nJ3sKfkAohmQ6VyZqAV6TndJ47geIViJtYHD94jRacKnE0IzrOFohyyA
	70wZ/0WUnhP8mVJ9vnO+YsS0eLIEKcz44b/v4HACe+8tM4NVktGWlmVxz92eYGRTL7/2hwm8qYYOj
	Br4+ZunF4SQEdxsxCr9cUK5cJAoBBmjQj+N1BEVw8egal8PYo3XyL+NmTvqvhrCcnvkihkmRw0htG
	9giorFHoCcO7loe3P20g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwIpD-00Fzeq-1G;
	Fri, 27 Oct 2023 09:08:15 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwIpB-00FzdH-0s
	for ath10k@lists.infradead.org;
	Fri, 27 Oct 2023 09:08:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=5Z5Wi+b9/KqswyyexFwwBfjoKXdVSYrsaCKW/5XNS4w=;
	t=1698397690; x=1699607290; b=VgmKgEsRUkxKj6k4XC0ANOJfeDo578K2XFaf6ZSJ6l/4220
	0H1B2M399LK9tdP8JXMC2fjD779wthNRYws91z2P8ostA29cX3nWrnD5BRL9TV2tZUwmFpi8K1iTV
	eqjg2qpKQVXK9pVWhT00wxkjV12pMPP9raA6x6+NnLhMgLf+Cr2JxGV3lqH3UZbw3T7ZS1Rsnum/g
	rvEVCzI9ywdU9hy9lKn5omfAG/mYwrKjnkTz2aSkVjtNS8Y+0hDmY+Cl8D197F4HIhLnmeRyrEkNK
	OEB/E9m9C8a/GcNXLVikW4rnTZjn0fDlf+P33FNGA2F9KsqLWHRojPNTwhZs3S1w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97-RC1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qwIp4-00000004fD2-3NTA;
	Fri, 27 Oct 2023 11:08:07 +0200
Message-ID: <f26cee40e10be4fa91862d85a1c3054e1da909ce.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: ath10k: prefer stack-allocated __le32 variables
From: Johannes Berg <johannes@sipsolutions.net>
To: Dmitry Antipov <dmantipov@yandex.ru>, Jeff Johnson
	 <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org
Date: Fri, 27 Oct 2023 11:08:05 +0200
In-Reply-To: <20231027082325.126606-1-dmantipov@yandex.ru>
References: <20231027082325.126606-1-dmantipov@yandex.ru>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_020813_438951_855EB237 
X-CRM114-Status: UNSURE (   4.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Fri, 2023-10-27 at 11:23 +0300, Dmitry Antipov wrote:
> There isn't too much sense to 'kzalloc()' buffer

Actually, there is. Consider what's done with it.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
