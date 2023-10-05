Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B5CE7AD44
	for <ath10k@archiver.kernel.org>; Thu,  5 Oct 2023 16:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0I1QwCJUxSI3QVIXbBogjj3XSbsdGHn7FTobMOwsB9Y=; b=Vro4pL4ax5hhQG
	BDP/m0TQ11Pgutfvl02PtRLJpRXtk0o97B+Ny5tt2LnERVb5mfQq+uDNWh1MOGJnzDs4ic6QvR19Y
	jxNn0c2K1HIcrZUgmMeaOsIqX0WbLJ+4ydLjGTSaPX/LcIil1ip5Gsv/HE3oVrfFuMFcxAYl23VVC
	X3QIxXhlnyq6ErYpciC9dZ4Zn1ZoBSQp8zo6CF5B0cCNnsHCv+cD3YZW20CDrrqNZQ5gCpqrH/Hiw
	0WZ6ke9aw1SZhkJ+grhoVKkbxRuoVZSDoVhlNxGzoRunr5VdFyyMJJFAKdDZ9XJMRlyH7mnUpHpS6
	IbbgwrLQcBL4mfKbUJtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoRPb-0046GH-0S;
	Thu, 05 Oct 2023 16:41:19 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoRPY-0046Ff-1Y
	for ath10k@lists.infradead.org;
	Thu, 05 Oct 2023 16:41:17 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-405459d9a96so2355e9.0
        for <ath10k@lists.infradead.org>; Thu, 05 Oct 2023 09:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696524075; x=1697128875; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKTDRIoUmCSN9wKAZkd+bxIJEDblkCbUKypHY3ps4Iw=;
        b=pDdGjRrDRFdnJzR7ZI0T8kGHpwWbRDCqOV0Av6A41cYDGJXBcUD7okt+UbdIRRgPMP
         ergTz61qJCMZ57d+ulcjgV8//ihyTMSYi/ZzLxZcsGXBZBEo1uRs8n42AqosSKGfpvuo
         oSrxYN57u8TBDLayzTbw/H3Mf9s6fZuaMjgQRrOaNsYFMqRV08frnukUtBknriqbEnhZ
         H3a8PKUSIFT197D2/NQev3FtXLraKOpYFKKJK2qc79uOTaJ5R1ZfgpVrbdTNakWNJWRZ
         qKUsoztEqBpQtzuGtLNfPw10dmpzJBT46yjjM9qHn520z8xCPhem55kfbRCu4deJMGkd
         eNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696524075; x=1697128875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKTDRIoUmCSN9wKAZkd+bxIJEDblkCbUKypHY3ps4Iw=;
        b=thq8L9Ev54if4mDc0WiPC1BCgLjMFC4JpCssgeKaaUK724HN6SH5lMkSPADzgz9LDp
         OBm7WAooIH67dzSjFnGynnbQobkgyo3WuTXGboCww2vuzIVIlPuVVkKR8LI7ges9KDcB
         GI9u70wSPjTelTuRSWlvHacQEjiPbaTz0gItcFE9dzoEkrSFX/5s6le1HA9OnjwhB1Fm
         JboDHlsV2Z3LA0XcWHOYhq3w8mCvuSYJZTYjv2xPZ55+iXr8DosoWr7NUNk7rNBWj8Ll
         IzrXmekMFRygd7Rpqf2qiypSByFRsdzOOpZPOxtFjTQRyUkddsg5qHqeZI8Na6vJhyC5
         iG7w==
X-Gm-Message-State: AOJu0YxtbKFpgy9VCTcFbXaP96TrYC+sMmAIqnjOCP5ZGVuFAmgSvvJj
	aKKGQYbsJJvftxAYMYCIU19O9bOWzRvNNWaC0AC8hg==
X-Google-Smtp-Source: AGHT+IHCYz0blMBWwpdJoZ1RUCKFkOGFeBm9VdaHikhjZLlf2r3eA9UAmptIepXMQVxXyXzuuEUlEkvL8t18CpmL0rk=
X-Received: by 2002:a05:600c:2301:b0:405:38d1:e146 with SMTP id
 1-20020a05600c230100b0040538d1e146mr66369wmo.4.1696524074654; Thu, 05 Oct
 2023 09:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145150.2498-1-ansuelsmth@gmail.com> <20231003145150.2498-3-ansuelsmth@gmail.com>
 <CANn89iK226C-pHUJm7HKMyEtMycGC=KCA2M6kw2KJaUj0cCT6w@mail.gmail.com> <20231005093253.2e25533a@kernel.org>
In-Reply-To: <20231005093253.2e25533a@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 5 Oct 2023 18:41:03 +0200
Message-ID: <CANn89iJQ50AdXP2C1YB2pGjE02WCJ-QCsZqE1yGXtcGsfLA0Jw@mail.gmail.com>
Subject: Re: [net-next PATCH v2 3/4] netdev: replace napi_reschedule with napi_schedule
To: Jakub Kicinski <kuba@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Wolfgang Grandegger <wg@grandegger.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, 
	Paolo Abeni <pabeni@redhat.com>, Chris Snook <chris.snook@gmail.com>, 
	Raju Rangoju <rajur@chelsio.com>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Shailend Chand <shailend@google.com>, 
	Douglas Miller <dougmill@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Nick Child <nnac123@linux.ibm.com>, Haren Myneni <haren@linux.ibm.com>, 
	Rick Lindsley <ricklind@linux.ibm.com>, Dany Madden <danymadden@us.ibm.com>, 
	Thomas Falcon <tlfalcon@linux.ibm.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof Halasa <khalasa@piap.pl>, 
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	Gregory Greenman <gregory.greenman@intel.com>, 
	Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>, Intel Corporation <linuxwwan@intel.com>, 
	Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>, Liu Haijun <haijun.liu@mediatek.com>, 
	M Chetan Kumar <m.chetan.kumar@linux.intel.com>, 
	Ricardo Martinez <ricardo.martinez@linux.intel.com>, Loic Poulain <loic.poulain@linaro.org>, 
	Sergey Ryazanov <ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Yuanjun Gong <ruc_gongyuanjun@163.com>, Simon Horman <horms@kernel.org>, 
	Rob Herring <robh@kernel.org>, Ziwei Xiao <ziweixiao@google.com>, 
	Rushil Gupta <rushilg@google.com>, Coco Li <lixiaoyan@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Junfeng Guo <junfeng.guo@intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Wei Fang <wei.fang@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Yuri Karpov <YKarpov@ispras.ru>, Zhengchao Shao <shaozhengchao@huawei.com>, 
	Andrew Lunn <andrew@lunn.ch>, Zheng Zengkai <zhengzengkai@huawei.com>, Lee Jones <lee@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Dawei Li <set_pte_at@outlook.com>, Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>, 
	Benjamin Berg <benjamin.berg@intel.com>, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-can@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_094116_523153_7D6C4933 
X-CRM114-Status: GOOD (  10.36  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBPY3QgNSwgMjAyMyBhdCA2OjMy4oCvUE0gSmFrdWIgS2ljaW5za2kgPGt1YmFAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIDUgT2N0IDIwMjMgMTg6MTE6NTYgKzAyMDAgRXJp
YyBEdW1hemV0IHdyb3RlOgo+ID4gT0ssIGJ1dCBJIHN1c3BlY3Qgc29tZSB1c2VycyBvZiBuYXBp
X3Jlc2NoZWR1bGUoKSBtaWdodCBub3QgYmUgcmFjZS1mcmVlLi4uCj4KPiBXaGF0J3MgdGhlIHJh
Y2UgeW91J3JlIHRoaW5raW5nIG9mPwoKVGhpcyBzb3J0IG9mIHRoaW5nLi4uIHRoZSByYWNlIGlz
IGluIGZsX3N0YXJ2aW5nKCkgdGhvdWdoLi4uCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvY2hlbHNpby9jeGdiNC9zZ2UuYwpiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NoZWxzaW8v
Y3hnYjQvc2dlLmMKaW5kZXggOThkZDc4NTUxZDg5Li5iNWZmMmUxYTk5NzUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjQvc2dlLmMKKysrIGIvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvY2hlbHNpby9jeGdiNC9zZ2UuYwpAQCAtNDI2MSw3ICs0MjYxLDcgQEAgc3Rh
dGljIHZvaWQgc2dlX3J4X3RpbWVyX2NiKHN0cnVjdCB0aW1lcl9saXN0ICp0KQoKICAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKGZsX3N0YXJ2aW5nKGFkYXAsIGZsKSkgewogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJ4cSA9IGNvbnRhaW5lcl9vZihmbCwgc3RydWN0IHNnZV9ldGhf
cnhxLCBmbCk7Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKG5hcGlfcmVzY2hl
ZHVsZSgmcnhxLT5yc3BxLm5hcGkpKQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlm
IChuYXBpX3NjaGVkdWxlKCZyeHEtPnJzcHEubmFwaSkpCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBmbC0+c3RhcnZpbmcrKzsKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBlbHNlCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZXRf
Yml0KGlkLCBzLT5zdGFydmluZ19mbCk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBr
Cg==
