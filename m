Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1E4C433EF
	for <ath10k@archiver.kernel.org>; Wed,  8 Jun 2022 09:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RdN3G7DTWlebRteFbpLmSo5bpE0Xqjb9P/9lkRDA+dI=; b=NOdc3re4POSjT1
	1qcEqovYPTVOBuz1opUd38qtxrrGkyZD8Ir0ii/JptI27bU+Y9btoWJXGy9WTKzcVq8VFLALuGeJp
	sioJWs6BHRFiw/9HTjgpzgLlDlf7X+GeBesXjjEQijhZzXxMwl+8U2ffPd1DJtzQAzAq4x5Vhji3j
	gBTS5PTLK/b3Gm5n/69kkFbkffn9dYR7d505gX0R6J2u3HHvI7+NjasDMl0R9cc7H9w2KiPKxLo4J
	3UWFhporqBzoKus98De5wbeYLpfztSB6dkh33DgaOE6hP9GUejZUXQyFibCMAq5PiAni/fC9UIu7k
	bxoRUnpWSuz8w9jM3ICQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyroI-00CJ5s-7Q; Wed, 08 Jun 2022 09:17:06 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyroE-00CJ2G-GM
	for ath10k@lists.infradead.org; Wed, 08 Jun 2022 09:17:04 +0000
Received: by mail-lf1-x129.google.com with SMTP id c2so12828146lfk.0
        for <ath10k@lists.infradead.org>; Wed, 08 Jun 2022 02:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fJDwYsuwFOEwcu6Qc5/uPndQI3rfTbr4Z32HNzd/zEI=;
        b=i7A3y/djvLxBDQhG0zCifoCOChZP+KoPqItmBj+v8wIKclw2ZG8AvXMZiSNa12extZ
         ZZTCf68/MvXB9uIbucCdZ1+MKSh5yOkAZbrQl7afQlVyZpqaaANt6leFPLBg6s+uDDVA
         c6XGIPAu5p+HDUk84J1hIN+lwtOFTtN0MBvf7TCvxgvOcO60OuU+RcybCdbXU/+V4Ry1
         5Rvu034C4qiNoRLWE+zbqyCiYWi1PDKjqgoeE3ptOJh9xgAad4kSWuiFqVyc+j2kUcmo
         iCdtbfKbJva9hfERy5zTnZQug+0bXKSQzMTrWMyLrugOhEFddQwEna60MB0sBn3lxfJP
         mlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fJDwYsuwFOEwcu6Qc5/uPndQI3rfTbr4Z32HNzd/zEI=;
        b=8CCkds9+U4W4MoCrWNFRURw3O9lZhwlEQH0aFom/5f+P0JWDVGyKR3S8KGQSn0z6EN
         yrmDybVj3cGz7nY+WUXMv/nD8hWOnb9owoK1si7fJ7YQpC8Geiosx4jEQ5kfpiRoNXd2
         ZdkvQ9tDTQjuVKKcvsAapws4xzcl0n7Tzlg9qzVq47nIj2WMhaWcL7+r+1sZjHk5NHBz
         NeeMe5gQ81aN5AGbQUiaBqbo+CXiZRgZ/lAZK9imywv+jGsIEGczxWp0dWPNL3ei57oJ
         NcXEoF/7m+dYYWqU5kZNq1RoBASckN5j2oTNljIdiUa5bO1ga7W6YCxpDLPZ4AKO8/DJ
         kz4w==
X-Gm-Message-State: AOAM531uda+FUHYazSWdWMELJHgTshEz9WB8ik32tATj/3S8qMYmLy5P
	YeUOds5YhHkAsFXhl6DdC0lHFMJ3/I3vT9y50wqo+9H3Ap8=
X-Google-Smtp-Source: ABdhPJwPi4AGoJQYiYJLzyGK9GTuD/JrcInuYTe9PBynawwZUengjYo4W5LP0a+nwaeoaPsO5jQPzsvHV7mkQVRvNyc=
X-Received: by 2002:a05:6512:606:b0:478:fdce:eef8 with SMTP id
 b6-20020a056512060600b00478fdceeef8mr25686418lfe.461.1654679818597; Wed, 08
 Jun 2022 02:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <CA+BgFQXJr2FFdS5wK=it=sKck3htDXFFO50Px=scvL62xh41bw@mail.gmail.com>
 <87k09rr7bl.fsf@kernel.org> <CA+BgFQV+H+YnTFhOG+d5GtWC7ZDzu8fh6S+K6wF4a5fhOP5Jmg@mail.gmail.com>
 <87fskfr462.fsf@kernel.org>
In-Reply-To: <87fskfr462.fsf@kernel.org>
From: =?UTF-8?Q?Nicol=C3=B2_Sprea?= <nsprea@gmail.com>
Date: Wed, 8 Jun 2022 11:16:47 +0200
Message-ID: <CA+BgFQXH7FsSO6ZuGNcddm+0iyP+NEW77Tr-dtaDvOQC3ri+qg@mail.gmail.com>
Subject: Re: Firmware 4 vs Firmware 6 for QCA6174 hw3.0
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_021702_593681_85399C9C 
X-CRM114-Status: GOOD (  14.64  )
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

IyBVc2luZzoKZHJpdmVyOiBhdGgxMGtfcGNpCnZlcnNpb246IDQuMTUuMC0zOC1nZW5lcmljCmZp
cm13YXJlLXZlcnNpb246IFdMQU4uUk0uNC40LjEtMDAwNzktUUNBUk1TV1BaLTEKCiMgUHJvYmxl
bToKV2hlbiB3cGFfc3VwcGxpY2FudCByZS1hc3NvY2lhdGVzLCBJIGdldCB0aGUgZm9sbG93aW5n
IGlzc3VlOgphdGgxMGtfcGNpIDAwMDA6MDI6MDAuMDogZmFpbGVkIHRvIGZsdXNoIHRyYW5zbWl0
IHF1ZXVlIChza2lwIDAgYXItc3RhdGUgMSk6IDAKYW5kIGFsbCB0aGUgaW50ZXJmYWNlcyAoaW5j
bHVkaW5nIGxvb3BiYWNrKSAiZnJlZXplIiBmb3IgYSBmZXcgc2Vjb25kcy4KCiMgU29sdXRpb25z
OgoxLiB1c2luZyBmaXJtd2FyZSB2ZXJzaW9uIFdMQU4uUk0uMi4wLTAwMTgwLVFDQVJNU1dQWi0x
CjIuIGJhY2twb3J0aW5nIGRyaXZlcgoKIyBNeSBxdWVzdGlvbjoKV2hhdCBhcmUgdGhlIG1pc3Np
bmcgZmVhdHVyZXMva25vd24gYnVncyBvZiBXTEFOLlJNLjIuMC0wMDE4MC1RQ0FSTVNXUFotMT8K
Ck9uIFdlZCwgSnVuIDgsIDIwMjIgYXQgOTo0MyBBTSBLYWxsZSBWYWxvIDxrdmFsb0BrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE5pY29sw7IgU3ByZWEgPG5zcHJlYUBnbWFpbC5jb20+IHdyaXRlczoK
Pgo+ID4gVGhhbmtzIGZvciB0aGUgYW5zd2VyLgo+ID4gSXMgdGhlcmUgYW55IGZlYXR1cmUgdGhh
dCB1c2VzIG9ubHkgYXBpIDY/Cj4gPiBJZiBJIHdhbnQgdG8gZG93bmdyYWRlIHRvIGFwaSA0LCBp
cyB0aGVyZSBhbnl0aGluZyB0aGF0IEkgc2hvdWxkIHBheQo+ID4gYXR0ZW50aW9uIHRvPwo+Cj4g
VGhlIGludGVyZmFjZSBudW1iZXIgaXRzZWxmIGRvZXMgbm90IGNoYW5nZSBhbnkgZnVuY3Rpb25h
bGl0eSwgd2hhdAo+IG1hdHRlcnMgYXJlIHRoZSBhY3R1YWwgZmlybXdhcmUgcmVsZWFzZSB2ZXJz
aW9ucy4gQW5kIG9mIGNvdXJzZSBvbGRlcgo+IGZpcm13YXJlIHJlbGVhc2VzIGhhdmUgbW9yZSBi
dWdzIGFuZCBsZXNzIGZlYXR1cmVzLiBJdCB3b3VsZCBiZSBlYXNpZXIKPiBmb3IgcGVvcGxlIHRv
IGhlbHAgaWYgeW91IGRlc2NyaWJlIHdoYXQncyB0aGUgYWN0dWFsIHByb2JsZW0geW91IGFyZQo+
IHRyeWluZyB0byBzb2x2ZS4KPgo+IC0tCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCj4KPiBodHRwczovL3dpcmVsZXNzLndpa2kua2Vy
bmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWls
aW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
