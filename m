Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76183C433F5
	for <ath10k@archiver.kernel.org>; Sat, 14 May 2022 05:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cTMES3I+bPGuk3LZtEhTKP1bfA3R4CEwcHc1ool7/xk=; b=QTxQIHmMjPGOJI
	0tDq3DNqVLM/6cSnI8Okwvg7mneW6CzN6ymTpF2jd8H/hq9jAuluIVlM43FS0QLc8ssWlnFsLHCTz
	T2SSyIzTWXs8hbiy0cR00BSKvP0hO8W2Zqws59QLPKY5CFUdKVzOF4kCIFAZJEOec7zm4ZxnFgh3i
	wy8/D1XyOzqEEqoEDw1tzIz2dwAnOxS3IAVwbF4Z/iqtN2cdlSo6v/2FOtYpeAuGNYjNxYZ8JHSlI
	oIK6cWHLgycdDHvA4AF9DR5URCYv8ReoL8YhDIkGb7GQevtT7zCqDytIKu7dYCZyQ7ZBwETWlghwd
	o7LIrk1DbkcoK2dCooQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npjyX-000n7O-2E; Sat, 14 May 2022 05:05:57 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npjyT-000n6i-DU
 for ath10k@lists.infradead.org; Sat, 14 May 2022 05:05:54 +0000
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so12909087fac.12
 for <ath10k@lists.infradead.org>; Fri, 13 May 2022 22:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=X/IAgav4s9J/eHMYgeYeDUOX7BruZpeeDkv9wTzgnWY=;
 b=M+uGt8zf3J9fvCZPki4VDQjO6k9RWF3TwzCJRZ6+pV6g+35xfeih5qRCucqItHYPs8
 zougwwQRL7sVf3h8t8ZDSs8xtH5HxaP/km8HpN+fbk+xgOwWOJFpgTdZK4VhKDpWY2R/
 ctcgmcFlPVqmahsyZlDFQW8L7yO1N/8HoK4umZw/7LxTF9JzS8ps6YhLfImaSDoSFRia
 X6elXH8asqFGSE0kbdJTxe2rUptET18s22Cz8anvGjPQK3npB6wZuLCdHwE4U6TG8fo7
 3YJf4h/lcttSV3z/UFbeuLC4zxMuMpWfflC+7um8RCFp956evzBFGVvQOETo5b3oxKYv
 RI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X/IAgav4s9J/eHMYgeYeDUOX7BruZpeeDkv9wTzgnWY=;
 b=oCSdqP8doHb4IMpaHQVRRmeai/PyfALzRbjo+O5zE4BRdw0nBmtTGx2uGmJVvgFARC
 e3rWDzaafndFejzAllx51mx23d50uesDKM5OS01/0ugpgvmmEaTWlLgseryo4O+ox80L
 +8lj3JKEsNVZEcu4bE1E3cfIIdJy1CPsrhqdixYQW0bPfV0bd23RMCeTaivEFHRdpdu7
 WAJRCg594NiPrJjXdty9TNs9vAA6YSu7WHiZBDAAQsKVZKB0Eqs0ZvaapdwTQxnxSYH1
 lrW3/rTxWRcffj8ojF0gWQQX5W3cJuB2WYLqOfq8wQzPXKEr9zl0dUWm9Eb3xQUnkTSx
 GHbA==
X-Gm-Message-State: AOAM531aTMQdAYvprFcQBPd9ylRogbGmsQD0EPF/HxlsskZ5NNjwdUD3
 FKjUw1JZ5bu6zMwfjwixQYEqdA==
X-Google-Smtp-Source: ABdhPJy70FSboA/M7j4vD92dz5/lEptNURnyMkDTAyA1IhHQZoa5U8vy7hqJG1EE8gw+gexfUrUTGA==
X-Received: by 2002:a05:6870:a2cd:b0:ed:754:a2c6 with SMTP id
 w13-20020a056870a2cd00b000ed0754a2c6mr9067488oak.270.1652504750057; 
 Fri, 13 May 2022 22:05:50 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246]) by smtp.gmail.com with ESMTPSA id
 r25-20020a4a7019000000b0035eb4e5a6c8sm2006483ooc.30.2022.05.13.22.05.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 22:05:49 -0700 (PDT)
Message-ID: <3d856d44-a2d6-b5b8-ec78-ce19a3686986@kali.org>
Date: Sat, 14 May 2022 00:05:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] ath10k: do not enforce interrupt trigger type
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Govind Singh <govinds@codeaurora.org>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org
References: <20220513151516.357549-1-krzysztof.kozlowski@linaro.org>
 <87zgjl4e8t.fsf@kernel.org>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <87zgjl4e8t.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_220553_595571_FFF05550 
X-CRM114-Status: GOOD (  12.04  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Ck9uIDUvMTMvMjIgMTA6NTcgQU0sIEthbGxlIFZhbG8gd3JvdGU6Cj4gS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cml0ZXM6Cj4KPj4gSW50ZXJy
dXB0IGxpbmUgY2FuIGJlIGNvbmZpZ3VyZWQgb24gZGlmZmVyZW50IGhhcmR3YXJlIGluIGRpZmZl
cmVudCB3YXksCj4+IGV2ZW4gaW52ZXJ0ZWQuICBUaGVyZWZvcmUgZHJpdmVyIHNob3VsZCBub3Qg
ZW5mb3JjZSBzcGVjaWZpYyB0cmlnZ2VyCj4+IHR5cGUgLSBlZGdlIHJpc2luZyAtIGJ1dCBpbnN0
ZWFkIHJlbHkgb24gRGV2aWNldHJlZSB0byBjb25maWd1cmUgaXQuCj4+Cj4+IEFsbCBRdWFsY29t
bSBEVFNJIHdpdGggV0NOMzk5MCBkZWZpbmUgdGhlIGludGVycnVwdCB0eXBlIGFzIGxldmVsIGhp
Z2gsCj4+IHNvIHRoZSBtaXNtYXRjaCBiZXR3ZWVuIERUU0kgYW5kIGRyaXZlciBjYXVzZXMgcmVi
aW5kIGlzc3VlczoKPj4KPj4gICAgJCBlY2hvIDE4ODAwMDAwLndpZmkgPiAvc3lzL2J1cy9wbGF0
Zm9ybS9kcml2ZXJzL2F0aDEwa19zbm9jL3VuYmluZAo+PiAgICAkIGVjaG8gMTg4MDAwMDAud2lm
aSA+IC9zeXMvYnVzL3BsYXRmb3JtL2RyaXZlcnMvYXRoMTBrX3Nub2MvYmluZAo+PiAgICBbICAg
NDQuNzYzMTE0XSBpcnE6IHR5cGUgbWlzbWF0Y2gsIGZhaWxlZCB0byBtYXAgaHdpcnEtNDQ2IGZv
ciBpbnRlcnJ1cHQtY29udHJvbGxlckAxN2EwMDAwMCEKPj4gICAgWyAgIDQ0Ljc2MzEzMF0gYXRo
MTBrX3Nub2MgMTg4MDAwMDAud2lmaTogZXJyb3IgLUVOWElPOiBJUlEgaW5kZXggMCBub3QgZm91
bmQKPj4gICAgWyAgIDQ0Ljc2MzE0MF0gYXRoMTBrX3Nub2MgMTg4MDAwMDAud2lmaTogZmFpbGVk
IHRvIGluaXRpYWxpemUgcmVzb3VyY2U6IC02Cj4gU28geW91IHRlc3RlZCBvbiBXQ04zOTkwPyBP
biB3aGF0IGZpcm13YXJlIHZlcnNpb24/IEkgY2FuIGFkZCB0aGUKPiBUZXN0ZWQtb24gdGFnIGlm
IHlvdSBwcm92aWRlIHRoYXQuCj4KSGVsbG8gS3J6eXN0b2YsIEthbGxlLAoKSSBoYXZlIHNlZW4g
dGhpcyBpc3N1ZSBhcyB3ZWxsIG9uIGEgTGVub3ZvIEZsZXggNUcsIHdoaWNoIGhhcyBhIFdDTjM5
OTA6Cgp3Y24zOTkwIGh3MS4wIHRhcmdldCAweDAwMDAwMDA4IGNoaXBfaWQgMHgwMDAwMDAwMCBz
dWIgMDAwMDowMDAwCmtjb25maWcgZGVidWcgMCBkZWJ1Z2ZzIDAgdHJhY2luZyAwIGRmcyAwIHRl
c3Rtb2RlIDAKZmlybXdhcmUgdmVywqAgYXBpIDUgZmVhdHVyZXMgd293bGFuLG1nbXQtdHgtYnkt
cmVmZXJlbmNlLG5vbi1ibWkgY3JjMzIgCmIzZDRiNzkwCmh0dC12ZXIgMy44NiB3bWktb3AgNCBo
dHQtb3AgMyBjYWwgZmlsZSBtYXgtc3RhIDMyIHJhdyAwIGh3Y3J5cHRvIDEKCldpdGggdGhpcyBw
YXRjaCBhcHBsaWVkLCBJIG5vIGxvbmdlciBzZWUgdGhlIGVycm9yIG1lc3NhZ2UgaW4gdGhlIGNv
bW1pdCAKbWVzc2FnZSwgd2hlbiBJIHVuYmluZC9iaW5kIHdoZW4gd2lmaSBzdG9wcyB3b3JraW5n
LgoKVGVzdGVkLWJ5OiBTdGVldiBLbGltYXN6ZXdza2kgPHN0ZWV2QGthbGkub3JnPgoKLS0gU3Rl
ZXYKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgx
MGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
