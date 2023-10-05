Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA00E75451
	for <ath10k@archiver.kernel.org>; Thu,  5 Oct 2023 16:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F5JEnDZ2S122IKVoUSF6hNC06iRmIX6qXy8eNzWyVeA=; b=joC9zoCaalH5AB
	IKm4o7d2uW6IK0/c3x+Ep1JyKX5fnop1vqkXgtiX1yBYQGSsPIOhCkgqKxGlaqtBgU0QIg1pm9/l5
	Tdr6huQ57Z4EsniGmWXuWAGwCWWyAqcXy9PlhpvJ/lgDCUBQ2bCvC9BHYIXL54OOmE33CQWus6682
	aRSRDkJlVL0lsEg0SMROSOuZl/YJbDa8kQHn8ZDEVhPn1HuH8LF+4gcsTh5sV07nDyPGP/mUjzQ+Q
	pC7vuUBzJWHaeBJj4AGfCgj+1y2ryp4CB53bi9UoqOm2I1xsTJ44KTA6WhJBLoZjFLDfdQP5efacR
	97TNyXukkhmOhZ/2tRmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoQxf-0041LZ-0r;
	Thu, 05 Oct 2023 16:12:27 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoQxR-0041BQ-21
	for ath10k@lists.infradead.org;
	Thu, 05 Oct 2023 16:12:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4053f24c900so80035e9.1
        for <ath10k@lists.infradead.org>; Thu, 05 Oct 2023 09:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696522328; x=1697127128; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0r0z6lg6WCpdjTrIkK0dVsLYyVCZ/7MdG8Aqn4UL8Rc=;
        b=fUKcncC9M8wkolHjlLyqsnwNa+HkCxncWAvN0BAd4zKnxmzo46o54AcuqvzS6TRNo2
         NXsNlu7Wt+VBU4PdCmA0kS7Zna9y76cdRsX4uVfXgJUfqqGatZkchRCn70X2ZZijVNDP
         t+J8y61gGfxVjltaErbkmnEzgjhdGeaBE6CeDzRnZn2m4YIjgifn2cX4xWpiemYlneCQ
         dhbHydQhShVvvzm55NJPPJ9HDXaW29bNAZLv34wmoKPUN7KIZ1u88s999zUeXG2FH07w
         nRfi7UUObJF8BvBAAOqco6LXX1H5e5+Tqa2OEoKqOTuzviu7laVq2fYQfOynmzuYL0Dl
         4Big==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696522328; x=1697127128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0r0z6lg6WCpdjTrIkK0dVsLYyVCZ/7MdG8Aqn4UL8Rc=;
        b=rehaAj2OWR9XQVtT+HeYKWCNxMlAvPQA89Ua4M3qT4oxUDsv7ThUZZ8M9lA8dgyKqo
         Z5AMF1FgCVVQbO/sp8DIThRIHjOeouZ6awEL4hykvjAghqzs4fCoxfkgow3DVWLbjg+e
         GFe3k2m1XN6DrtMogxdMneA2HcLDssryIkPsBADBQS/kejsNJa6UsdhNeAH2gtGTFNw8
         yk5E6nyzEIqLnFJWNx7JQydYaHsLQIqF9acsjXe1iERCd3mbXQ2KPDC6u7rOi1bFLr3T
         0yLwSNUbVY/6GL/A5su9/60e246zT3XpvTk//MKLSrpoEoPhue0rVWRYt0YnUBLF83zd
         QALw==
X-Gm-Message-State: AOJu0YxURQBfpSiFt3N7qyQeCbZFyASLgm/5Owqg0BXAzTeqFUvFLQ7+
	6Ev75cPmvQSQpGntDtfz3YT1YTlAKZGMmvjpBA9hkQ==
X-Google-Smtp-Source: AGHT+IHsG9cALy9l/AGtf9WGqoTk1+vFPuwod1G0A2HPE9T+W6tIBWkayyF2LSEa5O28SfRy9xIMPv/xnERf3BuOFTY=
X-Received: by 2002:a05:600c:b93:b0:3fe:eb42:7ec with SMTP id
 fl19-20020a05600c0b9300b003feeb4207ecmr61696wmb.1.1696522327966; Thu, 05 Oct
 2023 09:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145150.2498-1-ansuelsmth@gmail.com> <20231003145150.2498-3-ansuelsmth@gmail.com>
In-Reply-To: <20231003145150.2498-3-ansuelsmth@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 5 Oct 2023 18:11:56 +0200
Message-ID: <CANn89iK226C-pHUJm7HKMyEtMycGC=KCA2M6kw2KJaUj0cCT6w@mail.gmail.com>
Subject: Re: [net-next PATCH v2 3/4] netdev: replace napi_reschedule with napi_schedule
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
	Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Chris Snook <chris.snook@gmail.com>, Raju Rangoju <rajur@chelsio.com>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Shailend Chand <shailend@google.com>, Douglas Miller <dougmill@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Nick Child <nnac123@linux.ibm.com>, 
	Haren Myneni <haren@linux.ibm.com>, Rick Lindsley <ricklind@linux.ibm.com>, 
	Dany Madden <danymadden@us.ibm.com>, Thomas Falcon <tlfalcon@linux.ibm.com>, 
	Tariq Toukan <tariqt@nvidia.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Krzysztof Halasa <khalasa@piap.pl>, Kalle Valo <kvalo@kernel.org>, 
	Jeff Johnson <quic_jjohnson@quicinc.com>, Gregory Greenman <gregory.greenman@intel.com>, 
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
X-CRM114-CacheID: sfid-20231005_091221_505891_69B32100 
X-CRM114-Status: UNSURE (   9.43  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMywgMjAyMyBhdCA4OjM24oCvUE0gQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3Vl
bHNtdGhAZ21haWwuY29tPiB3cm90ZToKPgo+IE5vdyB0aGF0IG5hcGlfc2NoZWR1bGUgcmV0dXJu
IGEgYm9vbCwgd2UgY2FuIGRyb3AgbmFwaV9yZXNjaGVkdWxlIHRoYXQKPiBkb2VzIHRoZSBzYW1l
IGV4YWN0IGZ1bmN0aW9uLiBUaGUgZnVuY3Rpb24gY29tZXMgZnJvbSBhIHZlcnkgb2xkIGNvbW1p
dAo+IGJmZTEzZjU0ZjUwMiAoImlibV9lbWFjOiBDb252ZXJ0IHRvIHVzZSBuYXBpX3N0cnVjdCBp
bmRlcGVuZGVudCBvZiBzdHJ1Y3QKPiBuZXRfZGV2aWNlIikgYW5kIHRoZSBwdXJwb3NlIGlzIGFj
dHVhbGx5IGRlcHJlY2F0ZWQgaW4gZmF2b3VyIG9mCj4gZGlmZmVyZW50IGxvZ2ljLgo+Cj4gQ29u
dmVydCBldmVyeSB1c2VyIG9mIG5hcGlfcmVzY2hlZHVsZSB0byBuYXBpX3NjaGVkdWxlLgo+Cj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+
IEFja2VkLWJ5OiBKZWZmIEpvaG5zb24gPHF1aWNfampvaG5zb25AcXVpY2luYy5jb20+ICMgYXRo
MTBrCj4gQWNrZWQtYnk6IE5pY2sgQ2hpbGQgPG5uYWMxMjNAbGludXguaWJtLmNvbT4gIyBpYm0K
PiBBY2tlZC1ieTogTWFyYyBLbGVpbmUtQnVkZGUgPG1rbEBwZW5ndXRyb25peC5kZT4gIyBmb3Ig
Y2FuL2Rldi9yeC1vZmZsb2FkLmMKCk9LLCBidXQgSSBzdXNwZWN0IHNvbWUgdXNlcnMgb2YgbmFw
aV9yZXNjaGVkdWxlKCkgbWlnaHQgbm90IGJlIHJhY2UtZnJlZS4uLgoKUmV2aWV3ZWQtYnk6IEVy
aWMgRHVtYXpldCA8ZWR1bWF6ZXRAZ29vZ2xlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMGsK
