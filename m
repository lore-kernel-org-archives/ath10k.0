Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBD8CA0FFB
	for <ath10k@archiver.kernel.org>; Wed, 27 Aug 2025 19:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ajx9AAdwt0Apqi9zgj8i2I6x/YpQA6prHkvGVxl49g=; b=r4ALkuFIe9OFXMi4D50C57Hqi6
	qJnfLYWRuUrDZVKTbroh9/QZPlv5QAQolOw9CTTi55TaSP34LYwQrWZWWwf9CAcja7g/VejCYviQq
	C8hJgMTvSKH9scve7d/YE9cPTEA12DFe8Kd/V3ZXEv+qWdAQzrrJ4nh9BTBbMdVfg1S53hKnRpSE2
	x8YgFq+gcnIFwm4DZjqSNfRzeCe/F54IHa3uUZDXGKqZrpJda3xKJsfmPgmLbXOoVkYgmnBLl6wDy
	ptPg3jG+hY0Ap75un5Dv7du4bG1aUOqIh9dPu/YkTKctLapnonVAI63I+CSvObzVKMu+fY/MLTReu
	RaRGgpnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLxl-0000000GdCN-0UQm;
	Wed, 27 Aug 2025 19:37:41 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJxG-0000000GJfl-2ZJD
	for ath10k@lists.infradead.org;
	Wed, 27 Aug 2025 17:29:03 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-b49b56a3f27so107848a12.1
        for <ath10k@lists.infradead.org>; Wed, 27 Aug 2025 10:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756315741; x=1756920541; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8ajx9AAdwt0Apqi9zgj8i2I6x/YpQA6prHkvGVxl49g=;
        b=WbTvGt4/tc0qlg9nYqlG2FcJBkCHwwSGqdBycWrAGdEWXoehAbP+sRupBca+hFWAEO
         945pIJiYIOhnnkK+rKeax2lPGc+XK+WJT+yc+Ink1m7/FLi5hUZsNg43uSvRERpct6NC
         GDlcuZkEZhOOiO7ZIzaoNU0I0ZczAXVgOikSvM7gBS9lFaRC8DSiWJhfAYPVs67b6nOT
         R3Jtx8vzIADo515I1FcS7ksiIeylyUxTQILqifXs243Qaqrv2+oBxilgqwRigEXn0I6i
         sKN+I1VZWvVNa/yeyrXLAXcuIundSo84mFe0aBnynOsAK8hhce71miy+Xst6FV1XwnA8
         60dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756315741; x=1756920541;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ajx9AAdwt0Apqi9zgj8i2I6x/YpQA6prHkvGVxl49g=;
        b=pQg4XtJY/kePXcfMnIuSbNdVQdSVv/nAqG9LOHt3n+0HKgwxLzt4EebiuTzNgyk2ER
         mf/qp7zg54ZQ7txHYB6XfrawOlJRBgMy8puVBzodcV17ucDJDFsLjv/PI6/J9IVcdS9W
         Z50H8ol0vUDPmlNp3G7Ip6EO+UMx/9lN3tnC5QozzXv1xRj4hFNcACYOpD8pDJC4ppLO
         pTNB/Coo0I6ii5aeQt9LV9K5Qz2Mt8ysqbRWYrIYFXj7Q9ufXRXgV2eBhQh7tX5HYlxO
         4AO7eVZfepVmIOD8/UBBFzCNNZnSBDJHomvNlsWYg46R81lyDz1ZtXOx+8xaf5DxjORE
         Lclg==
X-Forwarded-Encrypted: i=1; AJvYcCXzuWL9UXLlFdcY0WB3bvfSfv/UXQgpVYZuGeQqhJ8tn4NQhyb6qNnH4IMNDGgt9+67C+XDiqQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzNr16tzSeYbkSR94pobxFO3ly81c2VXKp3I2n2+gwYpSZKJlZ
	8UGw79/e5JiUzfvOPhH9A1CyMdgWq91C8yP74eq/agpnNS2rOVM1rqbm5vT7qalWowM=
X-Gm-Gg: ASbGnct7PL5HqSL7BT0ZsqCjCpZ7ov3OFUGTBWHcvYAkdTNbiLJHgzHdayauxIwG1UT
	gwkjRjMslhyQUo1cB9ZTadlUF3aIBurFEchHnyH/+E3qmDKZKi3qPFK5/0fXgwwjGwo6UWJtxyN
	oxNqSiXaVE+rXiwJeDCnAt34GIExAiP+8DFA1CGeCiqJ7lW5L72SyhNEmeB7JVRVn5kYN9n2nFA
	psgokFsAYu2cE5F6ctnN3g3Yjn4FOkXWwPyeTLEfBV+JWbP8xEyqXg9KV5kVG2jnNOe2Qx3TlL3
	dSZ5bI8eiDlpXS2e4VSC0FTubXOGHY2sd3x1Crg2qu9P0KEtH2KcAHSWZDO6QIvMazuMk2Hwfij
	84UxTTkNHA4cOS9RUNKyuE6ivDoZ3jPFNBqv4ps+FJkDsfZLgNYL3fn5qn2SzzhRWov0/1LQgB8
	E8HpGaDJOcg67NdVy0TKHf0WDTKj0N8a0iUjZlj4E9
X-Google-Smtp-Source: AGHT+IGyWJJnh9eNg1NCfpslvDaEk6L0UM0AifCGQaAdWKmcLwjLEEm1EH82Fa8C8fzuNPIE2G13Iw==
X-Received: by 2002:a17:90b:3ec5:b0:321:265a:e0b6 with SMTP id 98e67ed59e1d1-325177494ddmr24310399a91.20.1756315741411;
        Wed, 27 Aug 2025 10:29:01 -0700 (PDT)
Received: from [192.168.0.218] ([115.187.48.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3277c5af5absm800704a91.3.2025.08.27.10.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 10:29:01 -0700 (PDT)
Message-ID: <7fec1523-899b-4c0f-bec1-14742a2d3638@gmail.com>
Date: Wed, 27 Aug 2025 22:58:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Packet loss with QCA9377 (ath10k) on ASUS VivoBook E410KA
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org,
 ath10k@lists.infradead.org
References: <20250806204018.GA14933@bhelgaas>
 <BBAB0136-BB7C-4D59-B29D-2F35FC29D7AC@gmail.com>
 <l3iebypcyxpqxod5os3mn6465cwdlbnmlkbjnx3vu5bzyb4vhl@3dxnam2a7c2t>
 <176B76BC-6801-4C3F-A774-9611B43ED4AF@gmail.com>
Content-Language: en-US
In-Reply-To: <176B76BC-6801-4C3F-A774-9611B43ED4AF@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_102902_671816_DC3B05A6 
X-CRM114-Status: UNSURE (   4.48  )
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

Sorry for the delay.

He executed it and found that packet losses are still prevalent:

1943 packets transmitted, 1942 received, 0.0514668% packet loss, time 
1944829ms
rtt min/avg/max/mdev = 51.186/244.746/7607.252/320.060 ms, pipe 8

----

On a different note, I just saw that we have gone to the v2 of the 
patch. In the meantime, we were actually struggling compile the kernel 
properly using Github Actions or Fedora Copr, that's why it was taking 
so much time.

Bandhan Pramanik

বন্ধন প্রামাণিক


