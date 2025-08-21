Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACA3CA0EFA
	for <ath10k@archiver.kernel.org>; Thu, 21 Aug 2025 09:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MUVKqSfvoSrfQwKLxkBkNcMeAPDaW/uXn4tfyNXsF2Q=; b=4XGdgFFzfju3zlORcZsQtmaBgi
	r8ThLba58m0Peq2jjrO1IH1gBKp9e37HNTVJNVjBQjTmjBm35Z8+kesww76RQF+dm7AY8dnNa3ez7
	nCxNHURNf1aI6BPzUbU7sQDJ1PZwE0DCwvvbarL+7gwCxfTEEzPvzalVgWjVpwHlVFa9Fg4pkvqfV
	l7N3lmNBgELb5yrGIc33NJR/jCpu8Gj/gsJrZlYLiXwo4Fi6KWYlLMgls0JZ/OZ9kaDytA4Il25BY
	YKXH3GYp24VD15WbsM9m/dbVRwbUK39qqNU63Iu/4wEQ/9CtO3N3ibdZJ0Adkf6RPZMncATT7v/e1
	uC7uo7PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1mN-0000000GRBS-14E5;
	Thu, 21 Aug 2025 09:40:19 +0000
Received: from mail.primefinix.com ([141.95.160.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozqY-0000000G85Q-33L9
	for ath10k@lists.infradead.org;
	Thu, 21 Aug 2025 07:36:32 +0000
Received: by mail.primefinix.com (Postfix, from userid 1002)
	id E618FA6157; Thu, 21 Aug 2025 09:36:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=primefinix.com;
	s=mail; t=1755761786;
	bh=MUVKqSfvoSrfQwKLxkBkNcMeAPDaW/uXn4tfyNXsF2Q=;
	h=Date:From:To:Subject:From;
	b=r4kJABKWK6Mg12cCOP9zB5SW8XhPHfEZR1jEXKOp0lgK75k3RH1b/bGB1kl992Iw+
	 6gy3ETtELLCD3y4VVGmlUvQIRJUu1CScjBVvNt2L1bvg9RBYr0JvihJ84C6uKnW1S0
	 8NFQtiySPqBVF3fRF8Zb4CG0od45tPEW+dyE9qp+pxUYgg5u369i1J6l7N6BDDPMoy
	 OThohdTaw3/yCASOtkKOzmQ1SWpFkaJB1QlG+OiQkXLPUALcyYSHVjR+VJJntDrqf1
	 ub6kBz7SA33CvwCOrTRK1OliCAMPk9JZoT5emvy3ocltckoFxaGw/ljJkRcbEvujo9
	 aDCFmXNuEgG2g==
Received: by mail.primefinix.com for <ath10k@lists.infradead.org>; Thu, 21 Aug 2025 07:36:04 GMT
Message-ID: <20250821084500-0.1.mh.3hjos.0.mhh63os6ni@primefinix.com>
Date: Thu, 21 Aug 2025 07:36:04 GMT
From: "Brendon Roy" <brendon.roy@primefinix.com>
To: <ath10k@lists.infradead.org>
Subject: New Sales Model
X-Mailer: mail.primefinix.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_003631_039099_EB565C81 
X-CRM114-Status: UNSURE (   2.23  )
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

Hi,

I'm writing because we have a ready-made mattress dropshipping option, an=
d I thought it might fit with what you're already doing (or wanting to ex=
pand).

No warehouse, no packaging, and no shipping =E2=80=93 your customer order=
s, we ship, and you gain an additional source of income.

If you're interested, let me know. I'll show you how we work together.


Best regards
Brendon Roy

