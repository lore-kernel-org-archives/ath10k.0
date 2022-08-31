Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20444ECAAD3
	for <ath10k@archiver.kernel.org>; Wed, 31 Aug 2022 08:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=AprGRZmBWqEleYXTup3wrObdoaN01Xt3oOWdyDOFg5I=; b=a/E
	4tvJhqs28BIecq6O7yDDb6JKdP8O/hr39e0WpPT6rqnSR3bEu1TIctVhJOcUjhBGP/h6U5jOlArgt
	AbvgtnFSJ/wtXnZ9y/Bl5hPVegmf2CJZ/WTuIsRYm75NfTDEXhXR3ewOH8zaP3h6kIz1GmIh6/Q3z
	6owjhEM/Pjnsec33QODjCmG6RI3nXkh4EOnsQiKNnIDZtiAc4ZFlHa0Md0kt43L8ybWDPX4M7IfLV
	wKEx9C1QfmMeNMGz9Fw3hZ4FVhXszrYAs5LIH8aIJCB5f/eAXFDr7wl4EY1Xm07HpZHVgSslKolcP
	d+EMNmcLLW36T3x9MPvipDTOTo+RTpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTJW9-00560d-NR; Wed, 31 Aug 2022 08:56:13 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTJW3-0055wi-1A
	for ath10k@lists.infradead.org; Wed, 31 Aug 2022 08:56:11 +0000
Received: by mail-ed1-x535.google.com with SMTP id b44so17433272edf.9
        for <ath10k@lists.infradead.org>; Wed, 31 Aug 2022 01:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc;
        bh=fKa36KE5rgVdBf5I00aE/15p5MsThaHsKkN2GE1XT3Y=;
        b=B4QH7+JMzCfzVgOZtC1yFhswFF8ZaLs6RWgUtVHUMg52RCkSZRyUXFM/QANZsLtFdZ
         Ii0K34DWqZ3T/8KjCVMrnvTi2IMxvYrLPJLPEXqUj9WFL+FjIxnl+x7a5qasdB6lZNXd
         bl00yjUCXWs4+rnebbXgIHnZHT+0xAO+Wf4uveEAl0fGMt7C5Q5ftJzW1d+8MsO3Zxxn
         FO9qF4Nh0MRp3xzvHcLrAbw8BuhkugmN+Hf0sdTRnyqBMkLD7GNV4d0uVj8I6k7Hm4J4
         2NWvVtpRbJ99KjNvvx98UFap8XfKNcJi/RlOhtqKgM5ayVZwq5uih4+mInt5bEk0iF31
         EKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc;
        bh=fKa36KE5rgVdBf5I00aE/15p5MsThaHsKkN2GE1XT3Y=;
        b=H2imqkmZV1w/zqg9tOps8c+fMcLghmP+Se/UKUpE/g/A8eosG/EP0AC5Q37wSyTIUd
         IKLxnG0L055DxPO2lSkpyHyvvBuHuwW054QOtctpVxupG+8RkIaLnj6G0np6dNPtMXvl
         //Gc6VSCvFHhG681ZyNOfs7ApvetwzM9aSCUKWQU5Q3hkBryrqIesXz9IvRNW1liPSG9
         6mz6C3DhjXENyHnKl1xB4bYDmPqFssvGbZHKYvz92x4eNtdGPvP8qbngXumNNfmmA7Y6
         SkI4tA7/YHK2UQ/IL+mMp+YqjSxymYkdaz8qRyx2to05XIiUCR4MYK9UjSwZ+EKQ79TI
         HaDg==
X-Gm-Message-State: ACgBeo12geuKPIiZNHCtr6g2GNBzAWcCDtD4iERPaSAUVIpi/Vj0kjZT
	YaE/J1g5V7hoy/Y29W2l4Mw1i5YRAiX48EysarVcip7y7JM=
X-Google-Smtp-Source: AA6agR5/iTiLQagcD6Pqkkq/TmnTpeptri8MR73wcJafmeJExZcXt0gLzYWEEbu5ciwQtyiggBXedCGOkwYWeRUUPIU=
X-Received: by 2002:a05:6402:5110:b0:440:4cb1:c137 with SMTP id
 m16-20020a056402511000b004404cb1c137mr24752232edd.262.1661936164652; Wed, 31
 Aug 2022 01:56:04 -0700 (PDT)
MIME-Version: 1.0
From: shuai cao <blithe201588@gmail.com>
Date: Wed, 31 Aug 2022 16:55:52 +0800
Message-ID: <CAJ2cvcqwSALbn-_547b81BOYHvAHf08-0=4kBp78CawLwfPK1w@mail.gmail.com>
Subject: ath10_pic qca6174 driver error
To: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_015607_134121_DD424079 
X-CRM114-Status: UNSURE (   3.80  )
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

RGVhciBhbGw6CiAgICAgSGksSSByZWNlbnRseSBlbmNvdW50ZXJlZCBhbiBlcnJvciB3aGVuIGxv
YWRpbmcgdGhlIGZpcm13YXJlIHdoZW4KdXNpbmcgdGhlIGF0aDEwIFFDQTYxNzQgZHJpdmVyLiBJ
IGhhdmUgdXNlZCB0aGUgMjAxOTEwMDMgYW5kIDIwMjExMjE2CnZlcnNpb25zIG9mIHRoZSBmaXJt
d2FyZSBhbmQgYm90aCBoYXZlIHRoZSBmb2xsb3dpbmcgcHJvYmxlbXMuTG9va2luZwpmb3J3YXJk
IHRvIHlvdXIgcmVwbHksIHRoYW5rIHlvdS4KICAgIExpbnV4IHZlcnNpb27vvJo0LjE0LjE3MSBv
ciA1LjQuNDEKCiBbICAgIDguNTcwMDE0XSBhdGgxMGtfcGNpIDAwMDE6MDE6MDAuMDogRGlyZWN0
IGZpcm13YXJlIGxvYWQgZm9yCmF0aDEway9wcmUtY2FsLXBjaS0wMDAxOjAxOjAwLjAuYmluIGZh
aWxlZCB3aXRoIGVycm9yIC0yClsgICAgOC41ODA3NTRdIGF0aDEwa19wY2kgMDAwMTowMTowMC4w
OiBEaXJlY3QgZmlybXdhcmUgbG9hZCBmb3IKYXRoMTBrL2NhbC1wY2ktMDAwMTowMTowMC4wLmJp
biBmYWlsZWQgd2l0aCBlcnJvciAtMgpbICAgIDguNjAwNDU4XSBhdGgxMGtfcGNpIDAwMDE6MDE6
MDAuMDogcWNhNjE3NCBodzMuMiB0YXJnZXQKMHgwNTAzMDAwMCBjaGlwX2lkIDB4MDAzNDBhZmYg
c3ViIDAwMDA6MDAwMApbICAgIDguNjA5NzA4XSBhdGgxMGtfcGNpIDAwMDE6MDE6MDAuMDoga2Nv
bmZpZyBkZWJ1ZyAwIGRlYnVnZnMgMQp0cmFjaW5nIDAgZGZzIDEgdGVzdG1vZGUgMQpbICAgIDgu
NjE5MjUyXSBhdGgxMGtfcGNpIDAwMDE6MDE6MDAuMDogZmlybXdhcmUgdmVyCldMQU4uUk0uNC40
LjEtMDAxNTctUUNBUk1TV1BaLTEgYXBpIDYgZmVhdHVyZXMgd293bGFuLGlnbm9yZS1vdHAsbWZw
CmNyYzMyIDkwZWViZWZiClsgICAgOC43MDMyMDldIGF0aDEwa19wY2kgMDAwMTowMTowMC4wOiBm
YWlsZWQgdG8gZmV0Y2ggYm9hcmQgZGF0YSBmb3IKYnVzPXBjaSx2ZW5kb3I9MTY4YyxkZXZpY2U9
MDAzZSxzdWJzeXN0ZW0tdmVuZG9yPTAwMDAsc3Vic3lzdGVtLWRldmljZT0wMDAwCmZyb20gYXRo
MTBrL1FDQTYxNzQvaHczLjAvYm9hcmQtMi5iaW4KWyAgICA4LjcxOTUxMl0gYXRoMTBrX3BjaSAw
MDAxOjAxOjAwLjA6IERpcmVjdCBmaXJtd2FyZSBsb2FkIGZvcgphdGgxMGsvUUNBNjE3NC9odzMu
MC9ib2FyZC5iaW4gZmFpbGVkIHdpdGggZXJyb3IgLTIKWyAgICA4LjcyOTc4Nl0gYXRoMTBrX3Bj
aSAwMDAxOjAxOjAwLjA6IGZhaWxlZCB0byBmZXRjaCBib2FyZC0yLmJpbiBvcgpib2FyZC5iaW4g
ZnJvbSBhdGgxMGsvUUNBNjE3NC9odzMuMApbICAgIDguNzM5MTkyXSBhdGgxMGtfcGNpIDAwMDE6
MDE6MDAuMDogZmFpbGVkIHRvIGZldGNoIGJvYXJkIGZpbGU6IC0yClsgICAgOC43NDU1OTRdIGF0
aDEwa19wY2kgMDAwMTowMTowMC4wOiBjb3VsZCBub3QgcHJvYmUgZncgKC0yKQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlz
dAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
