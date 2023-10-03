Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11A7E75425
	for <ath10k@archiver.kernel.org>; Tue,  3 Oct 2023 05:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEaCPNiCsjQLSLRPl1fHYBZYUYl/4EBj8M6YU8d8w+E=; b=Y7yZnuiaUo5KIb
	a9P+T7pxD4AUWeJyVWFgEsWRjw9c5YsR6Mw++9SDNfsDj3GWsxihvf4aNBujpjqkfBK1FWAO6Tar/
	3QcNCoJT7nyFd7xWCCymYtgQ8NZ1Te9Q31NNnhECZOzXRFkToxJFUuv2mku9qEw7tO6p8hz181sgV
	upm9IX1dXe7+pQ2vcppt6leyKsiMP1XvtVKccb9pbqlb2C9ZlqarKXgOd6+A64Zp1/AInUCXfBXAj
	c6+CzvtFUqZlhyzolZ1yy2v2bzXSlIANro18mg6XmoWFN9QIG7wuBqGzmjv21/rqgy3ozycxqwtMz
	Pb9Voa8XzgV6w9mEd4qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXrM-00DrDh-2v;
	Tue, 03 Oct 2023 05:22:16 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXrJ-00DrAX-1h
	for ath10k@lists.infradead.org;
	Tue, 03 Oct 2023 05:22:16 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-536ef8a7dcdso8160a12.0
        for <ath10k@lists.infradead.org>; Mon, 02 Oct 2023 22:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696310518; x=1696915318; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqpR6B8+nR6pcymfGZfMhsWiKXO7OC+lMbowiW4LVxc=;
        b=n/QHGCgcFMN8vYma2IqwjD+urY02zVQ05VERgIOWu3qs0wC1AtCIvCujIiF4kmFdPY
         ISb3TsoLq6tAtrOozh+rrVDZ95Vm3sZ7dSUcZTNki8qe/ohJIPyTFykR/FdByFVSDRZL
         xipOKzjsRNGlPM9rcoUMIsYwL7rRMBn7wCy0D9SgbB+rOne3KgMSEl6iN3aw7tR7rpjL
         IPtjc4z7NS7e1xdrwEWVRCVwSgxZxZwEyCMJisl6yjysgZQyCiEjTMvDi2d9dm9tvpsw
         AFKMlf6dQEtlGexf3p0J+0EPzxoU7NhuwbWKeE3Q5CJQBd5A/X8UHo6fqBRNr7RPBf9p
         mUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696310518; x=1696915318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XqpR6B8+nR6pcymfGZfMhsWiKXO7OC+lMbowiW4LVxc=;
        b=w5osDcF21TJdg0jBugCAvH2iIS26Hco56rWzJjWdZpoEIDZpEidzDjJ+kHlDP9BX3/
         ykfb1zr67YrCgKJR/1iOgH+c/xaJh+WoCWUoaoOUL+5ls2N0nGLPbKkgu63jwheNZXJy
         DvLnVIxUy+eQ1Pmr/IiSifRbuUZM6zY361JKr0/eZxVAkgKPjKOHfMxGHj6I+bjXD6sd
         29ZCrCzdJKjSXisl/YYtByT47gIi+5TqFhEXqy96PSOQD+wqa76DFgSJRMbesIfsE7GK
         WnOAVzFSTAHzX4bWpgav5B01PXraDZG4Ps2eYfLCm4amKQVMYI3sPry/mLPfiQ8XFkJ2
         JO2w==
X-Gm-Message-State: AOJu0YyKyKy3d05yJhxuM5vnFFJeF4RZJprcqIEtj/m0uC1jlCLbC0VB
	6X1DXVERCfvB9ZeY/2nHYnRnHnf/w235MJH+FyRGIg==
X-Google-Smtp-Source: AGHT+IFKI0HKrYVLDl5vmsJpfAS1RFLGp2hw35YvLJzj9lzKha+Fza93n9nqgIQgLugkI+eoDblKihBS9oaXtRjP+8s=
X-Received: by 2002:a50:d4d7:0:b0:538:1d3b:172f with SMTP id
 e23-20020a50d4d7000000b005381d3b172fmr49263edj.3.1696310517644; Mon, 02 Oct
 2023 22:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20231002151023.4054-1-ansuelsmth@gmail.com> <20231002151023.4054-2-ansuelsmth@gmail.com>
In-Reply-To: <20231002151023.4054-2-ansuelsmth@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 3 Oct 2023 07:21:46 +0200
Message-ID: <CANn89i+eSWYuE=wE1TPJFtAS1OCfFYytC_nAjDWkizxmR9e6JQ@mail.gmail.com>
Subject: Re: [net-next PATCH 2/4] netdev: make napi_schedule return bool on
 NAPI successful schedule
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
	Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Chris Snook <chris.snook@gmail.com>, Raju Rangoju <rajur@chelsio.com>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Shailend Chand <shailend@google.com>, Douglas Miller <dougmill@linux.ibm.com>, 
	Nick Child <nnac123@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
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
	Yuanjun Gong <ruc_gongyuanjun@163.com>, Wei Fang <wei.fang@nxp.com>, 
	Alex Elder <elder@linaro.org>, Simon Horman <horms@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bailey Forrest <bcf@google.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Junfeng Guo <junfeng.guo@intel.com>, Ziwei Xiao <ziweixiao@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rushil Gupta <rushilg@google.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Yuri Karpov <YKarpov@ispras.ru>, Zhengchao Shao <shaozhengchao@huawei.com>, 
	Andrew Lunn <andrew@lunn.ch>, Zheng Zengkai <zhengzengkai@huawei.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Lee Jones <lee@kernel.org>, 
	Dawei Li <set_pte_at@outlook.com>, Hans de Goede <hdegoede@redhat.com>, 
	Benjamin Berg <benjamin.berg@intel.com>, Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_222213_566075_65DF5DF2 
X-CRM114-Status: UNSURE (   9.17  )
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

T24gTW9uLCBPY3QgMiwgMjAyMyBhdCA1OjEw4oCvUE0gQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3Vl
bHNtdGhAZ21haWwuY29tPiB3cm90ZToKPgo+IENoYW5nZSBuYXBpX3NjaGVkdWxlIHRvIHJldHVy
biBhIGJvb2wgb24gTkFQSSBzdWNjZXNzZnVsIHNjaGVkdWxlLiBUaGlzCj4gbWlnaHQgYmUgdXNl
ZnVsIGZvciBzb21lIGRyaXZlciB0byBkbyBhZGRpdGlvbmFsIHN0ZXAgYWZ0ZXIgYSBOQVBJIGFo
cwoKVGhpcyBtaWdodCBiZSB1c2VmdWwgZm9yIHNvbWUgZHJpdmVycyB0byBkbyBhZGRpdGlvbmFs
IHN0ZXBzIGFmdGVyIGEKTkFQSSBoYXMgYmVlbiBzY2hlZHVsZWQuCgo+IGJlZW4gc2NoZWR1bGVk
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3VlbHNtdGhAZ21haWwu
Y29tPgoKWWVhaCwgSSBndWVzcyB5b3UgZm9yZ290IHRvIG1lbnRpb24gSSBzdWdnZXN0ZWQgdGhp
cyBwYXRjaCAuLi4KClJldmlld2VkLWJ5OiBFcmljIER1bWF6ZXQgPGVkdW1hemV0QGdvb2dsZS5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgx
MGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
