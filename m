Return-Path: <SRS0=Yrnq=KS=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12553C47080
	for <ath10k@archiver.kernel.org>; Sun, 23 May 2021 02:01:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CD58610CB
	for <ath10k@archiver.kernel.org>; Sun, 23 May 2021 02:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CD58610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X/OF7n5dObnWvFDE8V27QLn+G0r2HPEpxvvYCIeC+IU=; b=cR7wati+7s3Rkr
	5DRUVpUvO3/0DYZcNuggsdJN3kSGQGeoOseOJ1eje6RQRmnfnzNbmaokyvt9FHC4QVbny7DQ4RnZT
	nmmlMjKD3SrQv1QAkxFUd40p9Gc7r0VraCRf/hFNB7AekjEfzREOu86VF0fE1/Isq5eS2PTizvSYM
	19h5gJMNlvZU0wtA5vzFpF7DWyqGICu9SALUnhoT6ENJGbrboyFNU3p7fxH6aTBk+ea01uRebfnLy
	eeads6AhEpCAnTagT/sBL9Ykf35IbBXZ6utAqnTN01SaXFvJ0tEUA/RB09E1jvzLvxDLmCmONDHJl
	4Vq7euRtFhKRvYeUqh/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkdQJ-003Vh7-9A; Sun, 23 May 2021 02:00:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkdQH-003VgX-Ak
 for ath10k@desiato.infradead.org; Sun, 23 May 2021 02:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To:Cc:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=FwUGsrIn4NzzPiWwqwJeHrE44RqPwdwhEHtDUxWMOJo=; b=q6br3ABoZRE9PYhRKRm2zOhpAy
 JZ++SaPo07U+Dvo4q9z1ZIV0hpfGADtXogIPdtohJjFp8Q1m+YoseVc5+KNWCTV8J9kBjLW084SvG
 qqWbwoPLmQwUXtYEiL6RtmkenC25/SlbjJ0ajTYN6yGEGdJBRJOLn/cQAR8RVkHyM7KKpvSOyfkRU
 YP4OuojGiGMkA77rRBtHrKuRRWBfWbPuDZTboul329TL6FEm5SV94lDPQ5FYqqmC1jjJzLcTKSOgO
 zF1vQNvGBTiqQ1Xj99Obk7JgALdtEaYGJ/OE2gah/dEeKC5/2w1DiTxM8r7+6PU9b6ZM3hVqdHCS+
 iznDEjZQ==;
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkdQE-000H9d-Hw
 for ath10k@lists.infradead.org; Sun, 23 May 2021 02:00:56 +0000
Received: by mail-oi1-x234.google.com with SMTP id j75so23653401oih.10
 for <ath10k@lists.infradead.org>; Sat, 22 May 2021 19:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=FwUGsrIn4NzzPiWwqwJeHrE44RqPwdwhEHtDUxWMOJo=;
 b=DEpmO+ToMBMTFULx6hjrIO57aygvUsZpGDkzlHianXU7gTH29QM3/4qjncUTKUOdM1
 +8RpsDCirdISskEY4FwcGOnTdieIU5S83tVH9A0Rc1+O2k8rMr64C7GJ4Aa2e3JZT/8S
 EcqBBFIYtmjBqrR4mCie9bfSMfLtFsRue0HTjtzB1if+dwJ78Kps/e6nWLR5U9RJTgle
 lygzFb9jHlQdQ/7Pjp4elUvitwbCcXh6uwmR4ZtJYFY17lUjw3JTVxX5VQ8xwkw+rqAi
 tJwoWq46xi4xw9/z1J+rM+uDYOiyet4+YdHp8A4qrlrWQ8BTbxrCQgfrS/PegOkf3Y0I
 r+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=FwUGsrIn4NzzPiWwqwJeHrE44RqPwdwhEHtDUxWMOJo=;
 b=r5y5FbGAM5Zm7WNc1E2qf33RpB/gi/ttz8Eg430E17mGkAN2KfEH9QLXk9G2zixRVf
 MizQ1rmtXdSYauJ6Kl/HXIM1xTuyojXIYAMxcaeWkqJnSzSHE2/eUV3VRyBxVeFs9oQu
 x7S5VVH4BNFuH7hSJTJVAZhgaZ+b0qTDu9+oYnDu7V3S8Mz1+0UQhLbizwFz1wgx3EqD
 V+/k6LPRVGOwmbRLFI/9qLvZiiyH9N9rADLD86BlxpD+7xc9Mvle9R7mc4MvF74cccUN
 7P2tOo8LbOMGXm7HCnrCayXSwbVmSlJCa8ZxGsAtukel0gqqzTlIBmkywV6UtItT7+Qi
 73TA==
X-Gm-Message-State: AOAM530BQI6eazv8HEH83rMa/blVzhkFprog2i8l/01vzt1kJzbtOMxu
 2xiFe2b7Oy2eWyskBs33T9LRshs66TfzETRmbm+P334D0S5XR9Jn
X-Google-Smtp-Source: ABdhPJyPqHGuoJziOx4Q4dfHrwCgx+NrC1OkiGhWyDWrUt5clZgf++5AU7kU41akBC+6lEn+9Ab9Xb03Idefv2wWIJI=
X-Received: by 2002:aca:308c:: with SMTP id w134mr2622847oiw.11.1621735249635; 
 Sat, 22 May 2021 19:00:49 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Lenski <dlenski@gmail.com>
Date: Sat, 22 May 2021 19:00:13 -0700
Message-ID: <CAOw_LSEjzmUi1KvPM6nyKRV=8N3tqTru-noaKLwE01mcDw6uLg@mail.gmail.com>
Subject: Re: ath10k raw mode
To: ath10k@lists.infradead.org
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_190054_630352_9B7E1442 
X-CRM114-Status: GOOD (  12.24  )
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

SGkgYWxsLApBcG9sb2dpZXMgZm9yIHJlc3VycmVjdGluZyBhIDQuNS15ZWFyLW9sZCB0aHJlYWQs
IGJ1dCBpdCdzIHRoZSBtb3N0CnJlbGV2YW50IG9uZSBJIGNhbiBmaW5k4oCmCgpPbiBGcmkgRGVj
IDkgMDA6NDA6NTIgUFNUIDIwMTYsIE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8u
Y29tPiB3cm90ZToKPiBPbiA4IERlY2VtYmVyIDIwMTYgYXQgMjA6MTMsIEFuZHJlYXMgQ2hyaXN0
b2Zvcm91IDxhbmRyZWFzY2hyaXN0b2ZvQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBEZWFyIEFsbCwK
PiA+Cj4gPiBjb3VsZCB5b3UgcGxlYXNlIHNvbWVvbmUgc2VuZCBtZSBvciBsZXQgbWUga25vdyB3
aGVyZSBJIGNhbiBkb3dubG9hZCBhIGZpcm13YXJlIHdpdGggcmF3IG1vZGUgZmxhZyBlbmFibGVk
IGZvciBteSBRQ0E5ODhYIGNhcmQuCj4KPiBZb3UgY2FuIGNoZWNrIHRoaXM6Cj4KPiAgIGh0dHBz
Oi8vZ2l0aHViLmNvbS9rdmFsby9hdGgxMGstZmlybXdhcmUvdHJlZS9tYXN0ZXIvUUNBOTg4WC9o
dzIuMC8xMC4yLjQuNzAKPgo+IEF0IHRoZSB2ZXJ5IGxlYXN0IDEwLjIuNC43MC41NCBzaG91bGQg
c3VwcG9ydCBpdCAoYXQgbGVhc3QgaXQgZG9lcwo+IGFkdmVydGlzZSBpdCkuIEl0IHByb2JhYmx5
IG1ha2VzIHNlbnNlIHRvIGhhdmUgdGhpcyAobGlzdCBvZiByYXctbW9kZQo+IHN1cHBvcnRpbmcg
ZmlybXdhcmUgcmV2aXNpb25zKSBsaXN0ZWQgc29tZXdoZXJlIG9uCj4gaHR0cHM6Ly93aXJlbGVz
cy53aWtpLmtlcm5lbC5vcmcvZW4vdXNlcnMvZHJpdmVycy9hdGgxMGsgLSBhbnkKPiB2b2x1bnRl
ZXJzPyA6KQoKSSdtIHdvbmRlcmluZyBpZiB0aGVyZSdzIGEgZmlybXdhcmUgZmlsZSB3aXRoIHJh
dyBtb2RlIGVuYWJsZWQgZm9yClFDQTkzNzcgKHJldiAzMSkuCgpJJ3ZlIHRyaWVkIHNldmVyYWwg
ZmlybXdhcmUgdmVyc2lvbnMsIGFuZCB0aGV5IGFsbCBhcHBlYXIgdG8gYmUKc2ltaWxhcmx5IGxh
Y2tpbmcgaW4gc3VwcG9ydCBmb3IgcmF3IG1vZGUuCgotIERlZmF1bHQgZmlybXdhcmUgYXMgZGlz
dHJpYnV0ZWQgYnkgVWJ1bnR1CgogIGF0aDEwa19wY2kgMDAwMDowMjowMC4wOiBmaXJtd2FyZSB2
ZXIgV0xBTi5URi4xLjAtMDAyNjctMSBhcGkgNQpmZWF0dXJlcyBpZ25vcmUtb3RwIGNyYzMyIDc5
Y2VhMmM3CiAgYXRoMTBrX3BjaSAwMDAwOjAyOjAwLjA6IGJvYXJkX2ZpbGUgYXBpIDIgYm1pX2lk
IE4vQSBjcmMzMiA5M2RhMDE3NgogIGF0aDEwa19wY2kgMDAwMDowMjowMC4wOiBodHQtdmVyIDMu
MSB3bWktb3AgNCBodHQtb3AgMyBjYWwgb3RwCm1heC1zdGEgMzIgcmF3IDAgaHdjcnlwdG8gMQoK
LSBodHRwczovL2dpdGh1Yi5jb20va3ZhbG8vYXRoMTBrLWZpcm13YXJlL2Jsb2IvbWFzdGVyL1FD
QTkzNzcvaHcxLjAvV0xBTi5URi4xLjAvZmlybXdhcmUtNS5iaW5fV0xBTi5URi4xLjAtMDAwMjMt
UUNBVEZTV1BaLTEKCiAgYXRoMTBrX3BjaSAwMDAwOjAyOjAwLjA6IGZpcm13YXJlIHZlciBXTEFO
LlRGLjEuMC0wMDAyMy1RQ0FURlNXUFotMQphcGkgNSBmZWF0dXJlcyBpZ25vcmUtb3RwIGNyYzMy
IDAyZmFiYzA3CiAgYXRoMTBrX3BjaSAwMDAwOjAyOjAwLjA6IGJvYXJkX2ZpbGUgYXBpIDIgYm1p
X2lkIE4vQSBjcmMzMiA5M2RhMDE3NgogIGF0aDEwa19wY2kgMDAwMDowMjowMC4wOiBodHQtdmVy
IDMuNjEgd21pLW9wIDQgaHR0LW9wIDMgY2FsIG90cAptYXgtc3RhIDMyIHJhdyAwIGh3Y3J5cHRv
IDEKCi0gaHR0cHM6Ly9naXRodWIuY29tL2t2YWxvL2F0aDEway1maXJtd2FyZS9ibG9iL21hc3Rl
ci9RQ0E5Mzc3L2h3MS4wL1dMQU4uVEYuMi4xL2Zpcm13YXJlLTYuYmluX1dMQU4uVEYuMi4xLTAw
MDIxLVFDQVJNU1dQLTEKCiAgYXRoMTBrX3BjaSAwMDAwOjAyOjAwLjA6IGZpcm13YXJlIHZlciBX
TEFOLlRGLjIuMS0wMDAyMS1RQ0FSTVNXUC0xCmFwaSA2IGZlYXR1cmVzIHdvd2xhbixpZ25vcmUt
b3RwIGNyYzMyIDQyZTQxODc3CiAgYXRoMTBrX3BjaSAwMDAwOjAyOjAwLjA6IGJvYXJkX2ZpbGUg
YXBpIDIgYm1pX2lkIE4vQSBjcmMzMiA5M2RhMDE3NgogIGF0aDEwa19wY2kgMDAwMDowMjowMC4w
OiBVbmtub3duIGV2ZW50aWQ6IDMKICBhdGgxMGtfcGNpIDAwMDA6MDI6MDAuMDogVW5rbm93biBl
dmVudGlkOiAxMTg4MDkKICBhdGgxMGtfcGNpIDAwMDA6MDI6MDAuMDogVW5rbm93biBldmVudGlk
OiA5MDExOAogIGF0aDEwa19wY2kgMDAwMDowMjowMC4wOiBodHQtdmVyIDMuNTYgd21pLW9wIDQg
aHR0LW9wIDMgY2FsIG90cAptYXgtc3RhIDMyIHJhdyAwIGh3Y3J5cHRvIDEKCkFueSBjaGFuY2Ug
dGhhdCB0aGVyZSdzIGFub3RoZXIgb25lIHdoaWNoIEknbSBvdmVybG9va2luZywgd2hpY2ggZG9l
cwpzdXBwb3J0IGl0PwoKLS0KVGhhbmtzLApEYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMGsK
