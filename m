Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998CDC433EF
	for <ath10k@archiver.kernel.org>; Tue, 29 Mar 2022 21:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lKM6qiDM8ZXb2nreehpxZ0jIjUtuHHQudj0go1Ztp6g=; b=23G++OIUWLXl6O
	xb+1SfJf6ELUcNwFitkMlvhsbDmk3lZCxuNJPPb5AL1ZETlaF0fV4tI0a5aQ6V3sYkr5FKFTiu4Gv
	VHeU4PIm7hjHjSh7955lPGhclQb7+aqXz2G38dtcnSIFpTY+UVU9ThSjupYgzis7w4dMfl1Pfmnr5
	O/P9ngAIZBqzVPw2yTfLsXZhBKV+uy08w2Y9ye8TD2F3dRCErc3SVScLP/U7gy87e+VoyCRBjk6F5
	Eb8fOyMPbAcwzzUvD8qxdNcWWGhDVucSTDS8W9ujGcX18Yln7Cyj/muq2skENobw3C0Ob00BAL2tO
	zMrzPz+rFAfJRTbkYOYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZJ3K-00DUim-Km; Tue, 29 Mar 2022 21:06:58 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZJ3I-00DUiH-1v
 for ath10k@lists.infradead.org; Tue, 29 Mar 2022 21:06:57 +0000
Received: by mail-qt1-x82a.google.com with SMTP id z19so13208169qtw.2
 for <ath10k@lists.infradead.org>; Tue, 29 Mar 2022 14:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EAqRIc9fT64ewsHGFESskdphI9pIsxJrpTtguJ8/Dyg=;
 b=fj4lMvN6rKaBuz6EjmSYruA1pk2DRqkImF1f/UDAr2yjOcBE0t/LXrgsp5D1tHiuv/
 uFRmPT/FtRWSNzy8bys6q1APr5tOfm04N6gxh0AzPVGmWoBFm8aGySQ9TmQi33PNKcCb
 rwynLXeqS0yAdHpEt5JWck4NM2sNdwOiOWgSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EAqRIc9fT64ewsHGFESskdphI9pIsxJrpTtguJ8/Dyg=;
 b=xm9pcGm8PFMSLH3vrFF1JfAHrxzubsh4/n2MwY0iiF4Z7jBBTMicbWcJKa7ODitGyl
 0zloP9RzBEjz69Z07DiZS//OaONu99/oN8Yj5sFxL/jTcDB0TN1rmrQ36UiBU3pP8OUJ
 WwC5l5b3HWp53vcCcMkepSig4UHjyuSgSIDDzgQpHK4QiXb4LS2+I+oOYj0cA4QTCCts
 tLlg7RBr3aMu4DHA0RSr3ijhS+epwJJJFsbdGyZiapd9Tuk+JkEBKHa02Svp4GfVibLi
 hudkumk28vnsdLRzHPQBhPUNB9yfjmyhHDonEbu9AWhbgO1sYxC2kfVGwvUvKGFqNJ7h
 IYoQ==
X-Gm-Message-State: AOAM531JCzM2i9w7ypYYq8CsvIxRMhMk9VyZ3MkHW0xChx+XjmYg0tFS
 0iTlb4BUnuv+j1L+Y6ZH08OaFx/bjfMNKQ==
X-Google-Smtp-Source: ABdhPJygTzTbTjDkF71dDFz74lXmkVxE8Dikj9OlgdXpWIn2jZsJr3f+7vSBdi6eh5Bm29kqRFALrQ==
X-Received: by 2002:ac8:5c4f:0:b0:2e0:63a9:5197 with SMTP id
 j15-20020ac85c4f000000b002e063a95197mr30426786qtj.361.1648588013727; 
 Tue, 29 Mar 2022 14:06:53 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 a16-20020a05622a02d000b002e20e4bf4aesm16682723qtx.23.2022.03.29.14.06.52
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 14:06:52 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-2e64a6b20eeso197585837b3.3
 for <ath10k@lists.infradead.org>; Tue, 29 Mar 2022 14:06:52 -0700 (PDT)
X-Received: by 2002:a0d:df82:0:b0:2e5:ad6c:d9d with SMTP id
 i124-20020a0ddf82000000b002e5ad6c0d9dmr33485447ywe.17.1648588011807; Tue, 29
 Mar 2022 14:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <YSJ//ki/A1EgfLga@skv.local>
 <CA+ASDXNzv6D1PthjUU-CVw6amT+JHmJP2mNSL=LVJKGm0zkEXw@mail.gmail.com>
 <YSQC32TygIq2SHJR@skv.local>
 <CA+ASDXPi0RRd0gFYcON=XLu8ABwKKcRXf0j0QoCRnvDwGa0VyQ@mail.gmail.com>
 <4c44fdc2-8dde-8a98-8dd4-4b7e6b57a090@bang-olufsen.dk>
In-Reply-To: <4c44fdc2-8dde-8a98-8dd4-4b7e6b57a090@bang-olufsen.dk>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 29 Mar 2022 14:06:40 -0700
X-Gmail-Original-Message-ID: <CA+ASDXOeC+S2d7g0b=aS_q9XxNtdayF1S5XE9T85NZrxXnK5KA@mail.gmail.com>
Message-ID: <CA+ASDXOeC+S2d7g0b=aS_q9XxNtdayF1S5XE9T85NZrxXnK5KA@mail.gmail.com>
Subject: Re: Revert: ath: add support for special 0x0 regulatory domain
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <ALSI@bang-olufsen.dk>
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>, 
 linux-wireless <linux-wireless@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>, 
 Wen Gong <wgong@codeaurora.org>, Julian Calaby <julian.calaby@gmail.com>,
 svp <svpm@yandex.ru>, "felix+debian@gueux.org" <felix+debian@gueux.org>,
 Massimo Maggi <me@massimo-maggi.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_140656_138175_489A2E6F 
X-CRM114-Status: GOOD (  13.65  )
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

T24gVHVlLCBBdWcgMjQsIDIwMjEgYXQgMTowMCBBTSBBbHZpbiDFoGlwcmFnYSA8QUxTSUBiYW5n
LW9sdWZzZW4uZGs+IHdyb3RlOgo+IE51bWVyb3VzIHBlb3BsZSAtIG15c2VsZiBpbmNsdWRlZCAt
IGhhdmUgY2l0ZWQgc291cmNlcyBjbGVhcmx5Cj4gaW5kaWNhdGluZyB0aGF0IDB4MCA9IFVTLCBO
T1QgdW5zZXQuIFNlZSB0aGUgc2FtZSBwb3N0WzFdIGZvciBtb3JlIGluZm8uCj4KPiBJIHN0aWxs
IHRoaW5rIHRoaXMgcGF0Y2ggc2hvdWxkIGJlIHJldmVydGVkIHVubGVzcyBzb21lYm9keSBjYW4g
cHJvdmlkZQo+IGEgc291cmNlIHRvIHRoZSBjb250cmFyeSwgcmU6IHRoZSBtZWFuaW5nIG9mIDB4
MC4KPgo+IEl0J3MgdW5mb3J0dW5hdGUgdGhhdCB0aGlzIGlzIHN0aWxsIGFmZmVjdGluZyB1c2Vy
cywgcGFydGljdWxhcmx5IHdoZW4KPiB0aGUgb3JpZ2luYWwgYXV0aG9yIG9mIHRoZSBwYXRjaCBl
dmVuIGFza2VkIGZvciBpdCB0byBiZSByZXZlcnRlZC5bMl0KCkZZSSwgbXkgcmV2ZXJ0IHdhcyBy
ZWNlbnRseSBtZXJnZWQgdG8gTGludXMncyB0cmVlIGFuZCBpcyBtYWtpbmcgaXRzCndheSBpbnRv
IHZhcmlvdXMgLXN0YWJsZSB0cmVlczoKCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvbGludXMvMWVj
N2VkNTE2M2M3MGEwZDA0MDE1MGQyMjc5ZjkzMmM3ZTdjMTQzZgoKU2lkZSBub3RlOiBpdCdzIGEg
c21hbGwgc2hhbWUgdGhhdCBLYWxsZSdzIHNjcmlwdHMgc2VlbSB0byBoYXZlIG11bmdlZAp0aGUg
YXV0aG9yc2hpcCBkYXRlIC0tIGdpdCB0aGlua3MgaXQgd2FzIGF1dGhvcmVkIGluIDIwMjIsIHdo
ZW4gaW4KZmFjdCBpdCB3YXMgaW4gMjAyMCA7KQoKUmVnYXJkcywKQnJpYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QK
YXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMGsK
