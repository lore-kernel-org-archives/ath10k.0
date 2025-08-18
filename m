Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26399CA0EEB
	for <ath10k@archiver.kernel.org>; Mon, 18 Aug 2025 13:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4855sdN2+KJrlv8PL5bGVQa7dNeAQCI6ILg91iVvwQ=; b=CykQYTN12sUmC+T1Rd/ZV3g2tR
	jgR8LjwuzshrkUUq7fkkrhXOaTtY5SF0SFwVd8I+2WTrqzlViC89ef5xE0X11B/qy8YTDZ96o8yjL
	6Dmnw1EJYdkkaQr7N8a6R5FnSpfO+tUvriyTcf4v28AT+0vnOrNaYPnqfFSIdmhOPg2Hk1Q7uEUtN
	diHgK/2Mjp4N6h0jTbtKfHT+mGNRbPqHf9tNOiXJ4kaxTd+WaP9AnZgTicvo86LsEF8qh4+/0SX6W
	0cDP45YoxLhoIBFEW1Gh2UmgdrXU4F3whqNUO45S8qM6+nt720mgGCK2yi2y3Br8fWQ4ht/bThstg
	8exKXvQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo038-00000007Tp1-1Aly;
	Mon, 18 Aug 2025 13:37:22 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unuls-00000006tDH-0xCL
	for ath10k@lists.infradead.org;
	Mon, 18 Aug 2025 07:59:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E876443EC;
	Mon, 18 Aug 2025 07:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755503949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x4855sdN2+KJrlv8PL5bGVQa7dNeAQCI6ILg91iVvwQ=;
	b=StsNn0KL+BgMcijXT0d4SLglmaB3Y8znrrmn4xeGLOBgMT/h4wqn6hJTIDjjlMtKQW8ptK
	WIZaosNwu3VAxlCauSBwFQtxsNTTCUrZPkA+GfDEkQhte8p0Ti6eM8wXtE9p5XWcoLwoU0
	rZJp6tRuG+zmuVYFQLMY8bJCp/jeIy7Macal0v5oBtv48Eu34gRvnT1aRdsqrZcBzMzZIL
	1ypv5cIiHGwMqTYH4CdjiaAYtVYGnf8kSojj7oFbVYu6YBVTZ9A7Lr2GhkO+ttiJr/eR0G
	7Ed0IV/5u1e2i1KOm8Wxsik1KRNfrwIrlEBhWIGU0afpJTyjRPE32y7V8O+laQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,  Jeff Johnson <jjohnson@kernel.org>,
  ath10k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH10K WIRELESS
 DRIVER),  linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCHv2 ath-next] wifi: ath10k: add nvmem support for mac address
In-Reply-To: <20250811203451.3763-1-rosenp@gmail.com> (Rosen Penev's message
	of "Mon, 11 Aug 2025 13:34:51 -0700")
References: <20250811203451.3763-1-rosenp@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 18 Aug 2025 09:59:08 +0200
Message-ID: <87tt2512nn.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduhedvtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheprhhoshgvnhhpsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqfihirhgvlhgvshhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhjohhhnhhsohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrthhhuddtkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_005912_410985_6A46E20B 
X-CRM114-Status: UNSURE (   9.05  )
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

Hi Rosen,

On 11/08/2025 at 13:34:51 -07, Rosen Penev <rosenp@gmail.com> wrote:

> device_get_mac_address is a generic way to get the MAC address which
> lacks NVMEM support, which tends to be used on embedded platforms.
>
> In case device_get_mac_address fails, try of_get_mac_address_nvmem and
> handle EPROBE_DEFER to wait for the nvmem driver to initialize.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: keep device_get_mac_address and use of_get_mac_address_nvmem
>  added Miquel to CC. Maybe he has insight.

LGTM. I guess it is not possible to make this fallback "the default" in
device_get_mac_address()? In this case doing it in your driver seems
fine if it's used on embedded systems with NVMEM cells described to
store MAC addresses.

Cheers,
Miqu=C3=A8l

