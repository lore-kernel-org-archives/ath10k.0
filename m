Return-Path: <SRS0=7NLS=IY=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF84C433C1
	for <ath10k@archiver.kernel.org>; Fri, 26 Mar 2021 18:13:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59F07619F2
	for <ath10k@archiver.kernel.org>; Fri, 26 Mar 2021 18:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59F07619F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gJdx4ojFQpejvo46+IOuCjwvZcNUbS69HhldS4pssBg=; b=EtKwKZit9nnDtc04dxuJ+pi62
	unJwdRscI/28nyTexZloEklijOwfrV0aWkS1bXb6xXp7jxGuA+dDki9oAIBrzRCiLA0qdM+39bxjw
	ECLtrH5jDHRzgH4p5mnN1DItYcsw2MNCrDVrHrwlNSIhkjt0scT7R2CbeM8bc7p1lJApWdgZLDmN7
	93BW+BdgNnbeTL2yrlg6NrvNUdxoN7GXDzabZnpRxi7UK2RgTvZT0C6zTu4Gk4p+d5OfWrhXd2Ii2
	Mnky06kPI+lNxpioCq6MGrOvuF/GqluCmHXFB5fCi+I/x4DXpnxI+Pc3RXtVAlPePd7Q4570+3i0q
	PTR1zu51Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPqxa-0047q4-HG; Fri, 26 Mar 2021 18:13:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPqxW-0047pP-Fo
 for ath10k@lists.infradead.org; Fri, 26 Mar 2021 18:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616782400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J7f06f7Mfh8Z6L3gTPvfrXd0/Vjv7OHwzafeJH9EdHw=;
 b=h7eHNIWfI3rO4hqXTsE89pa0p1atS7dhglq4isZIduQ5kOQoqbHeJDg3JduqJKuPhhyBtB
 o9vcgtLzmvBPhOweSjIZIPOn5PCRQsYaPg0jANRlek4bBXc0TYAImZUBalMSHVSoQaHPkn
 jyoQ2DuquSyOGcOX/uQ6h7T2ejCsJas=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-y0po9VfCO66Zw80PV0hR8A-1; Fri, 26 Mar 2021 14:13:18 -0400
X-MC-Unique: y0po9VfCO66Zw80PV0hR8A-1
Received: by mail-ed1-f69.google.com with SMTP id m8so4853403edv.11
 for <ath10k@lists.infradead.org>; Fri, 26 Mar 2021 11:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=pap7BptUHGKykCeFu/8MT0qbOtaTjDcy9qwuilzOGIw=;
 b=HTAEo3nefqBQFFgCSsbsL+ytEj9tQcqUs47uqrTU2agaUHgU+XjB16mnirH3suz/yf
 nBBJSjWxepQ1k3w+WsK/3i/THDboPGx6Pep+uC+WKJ7Sekjb8f+83jqE805eiDfz69Jp
 uXfZeQWK5Rpyqwv0xyGuVzEob+BWTR8eF22tzPQZwd+qt2Ma+FHOnnqJk7vz6Qjvj0Lj
 Ztqsf/YH4Av0q6Pap2R4+lsG0kMAISGq8QF5UDG5+tXk+cMtkD51CZ+ICR1HRnTbAisI
 yB5+9Pucm+gDC8SBIA9Lip3o4FFt4LWn9ZgbAFcVwf13dgK4/k+n/uQJ94nQFt5NFzCT
 YtIA==
X-Gm-Message-State: AOAM531QRQEvigcWXwXHhQQNxatsLVPr0xjiXGV0p8zHlVkehARY3Q8I
 gVFrCn4hPDxc/6KS8FB6yv73G4MgTX3WcHtfFVEnpZSGgOBdkg7AkbAr1rs0+xHRQjtz5QXA1gJ
 eXvuWYpwj9e6CYNBr2IG6Yw==
X-Received: by 2002:a17:906:1386:: with SMTP id
 f6mr16596256ejc.45.1616782397372; 
 Fri, 26 Mar 2021 11:13:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvc3mTnPMkhQBDrVBxW5/RWmuM3jHJDelx7UJ+pb/VP1j+SOnbQqRjHmOXJgwr+aDlkaxn3g==
X-Received: by 2002:a17:906:1386:: with SMTP id
 f6mr16596244ejc.45.1616782397225; 
 Fri, 26 Mar 2021 11:13:17 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
 by smtp.gmail.com with ESMTPSA id f16sm4141390ejb.3.2021.03.26.11.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 11:13:16 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id D32FA1801A3; Fri, 26 Mar 2021 19:13:15 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Kalle
 Valo <kvalo@codeaurora.org>, Marek =?utf-8?Q?Beh=C3=BAn?=
 <kabel@kernel.org>
Cc: vtolkm@gmail.com, Rob Herring <robh@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Jason Cooper <jason@lakedaemon.net>,
 linux-pci@vger.kernel.org, ath10k@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: Disallow retraining link for Atheros QCA98xx chips
 on non-Gen1 PCIe bridges
In-Reply-To: <20210326124326.21163-1-pali@kernel.org>
References: <20210326124326.21163-1-pali@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 26 Mar 2021 19:13:15 +0100
Message-ID: <87a6qpbx6s.fsf@toke.dk>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=toke@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_181322_952437_7A7EFBCE 
X-CRM114-Status: GOOD (  15.76  )
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

UGFsaSBSb2jDoXIgPHBhbGlAa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBBdGhlcm9zIFFDQTk4ODAg
YW5kIFFDQTk4OTAgY2hpcHMgZG8gbm90IGJlaGF2ZSBhZnRlciBhIGJ1cyByZXNldCBhbmQgYWxz
bwo+IGFmdGVyIHJldHJhaW4gbGluayB3aGVuIFBDSWUgYnJpZGdlIGlzIG5vdCBpbiBHRU4xIG1v
ZGUgYXQgMi41IEdUL3Mgc3BlZWQuCj4gVGhlIGRldmljZSB3aWxsIHRocm93IGEgTGluayBEb3du
IGVycm9yIGFuZCBjb25maWcgc3BhY2UgaXMgbm90IGFjY2Vzc2libGUKPiBhZ2Fpbi4gUmV0cmFp
biBsaW5rIGNhbiBiZSBjYWxsZWQgb25seSB3aGVuIHVzaW5nIEdFTjEgUENJZSBicmlkZ2Ugb3Ig
d2hlbgo+IFBDSWUgYnJpZGdlIGhhcyBmb3JjZWQgbGluayBzcGVlZCB0byAyLjUgR1QvcyB2aWEg
UENJX0VYUF9MTktDVEwyIHJlZ2lzdGVyLgo+Cj4gVGhpcyBpc3N1ZSB3YXMgcmVwcm9kdWNlZCB3
aXRoIG1vcmUgQ29tcGV4IFdMRTkwMFZYIGNhcmRzIChRQ0E5ODgwIGJhc2VkKQo+IG9uIEFybWFk
YSAzODUgd2l0aCBwY2ktbXZlYnUuYyBkcml2ZXIgYW5kIGFsc28gb24gQXJtYWRhIDM3MjAgd2l0
aAo+IHBjaS1hYXJkdmFyay5jIGRyaXZlci4gQWxzbyB0aGlzIGlzc3VlIHdhcyByZXByb2R1Y2Vk
IHdpdGggc29tZSAibm9uYW1lIgo+IGNhcmQgd2l0aCBRQ0E5ODkwIFdpRmkgY2hpcCBvbiBBcm1h
ZGEgMzcyMC4gQWxsIHByb2JsZW1hdGljIGNhcmRzIHdpdGgKPiB0aGVzZSBRQ0EgY2hpcHMgaGF2
ZSBQQ0kgZGV2aWNlIGlkIDB4MDAzYy4KPgo+IFRlc3RzIHNob3dlZCB0aGF0IG90aGVyIFdpRmkg
Y2FyZHMgYmFzZWQgb24gQVI5M3h4IChQQ0kgZGV2aWNlIGlkIDB4MDAzMCkKPiBhbmQgQVI5Mjg3
IChQQ0kgZGV2aWNlIGlkIDB4MDAyZSkgY2hpcHMgZG8gbm90IGhhdmUgdGhlc2UgcHJvYmxlbXMu
Cj4KPiBUbyB3b3JrYXJvdW5kIHRoaXMgaXNzdWUsIHRoaXMgY2hhbmdlIGludHJvZHVjZXMgYSBu
ZXcgUENJIHF1aXJrIGNhbGxlZAo+IFBDSV9ERVZfRkxBR1NfTk9fUkVUUkFJTl9MSU5LX1dIRU5f
Tk9UX0dFTjEgZm9yIFBDSSBkZXZpY2UgaWQgMHgwMDNjLgo+Cj4gV2hlbiB0aGlzIHF1aXJrIGlz
IHNldCB0aGVuIGtlcm5lbCBkaXNhbGxvd3MgdHJpZ2dlcmluZyBQQ0lfRVhQX0xOS0NUTF9STAo+
IGJpdCBpbiBjb25maWcgc3BhY2Ugb2YgUENJZSBCcmlkZ2UgaW4gY2FzZSBQQ0llIEJyaWRnZSBp
cyBjYXBhYmxlIG9mIGhpZ2hlcgo+IHNwZWVkIHRoYW4gMi41IEdUL3MgYW5kIGhpZ2hlciBzcGVl
ZCBpcyBhbHJlYWR5IGFsbG93ZWQuIFdoZW4gUENJZSBCcmlkZ2UKPiBoYXMgYWNjZXNzaWJsZSBM
TktDVEwyIHJlZ2lzdGVyIHRoZW4ga2VybmVsIHRyaWVzIHRvIGZvcmNlIHRhcmdldCBsaW5rCj4g
c3BlZWQgdmlhIFBDSV9FWFBfTE5LQ1RMMl9UTFMqIGJpdHMgdG8gMi41IEdUL3MuIEFmdGVyIHRo
aXMgY2hhbmdlIGl0IGlzCj4gcG9zc2libGUgdG8gdHJpZ2dlciBQQ0lfRVhQX0xOS0NUTF9STCBi
aXQgd2l0aG91dCBjYXVzaW5nIGlzc3VlcyBvbgo+IHByb2JsZW1hdGljIEF0aGVyb3MgUUNBOTh4
eCBjYXJkcy4KPgo+IEN1cnJlbnRseSBvbmx5IFBDSWUgQVNQTSBrZXJuZWwgY29kZSB0cmlnZ2Vy
cyB0aGlzIFBDSV9FWFBfTE5LQ1RMX1JMIGJpdCwKPiBzbyBxdWlyayBjaGVjayBpcyBhZGRlZCBv
bmx5IGludG8gcGNpZS9hc3BtLmMgZmlsZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFBhbGkgUm9ow6Fy
IDxwYWxpQGtlcm5lbC5vcmc+Cj4gUmVwb3J0ZWQtYnk6IFRva2UgSMO4aWxhbmQtSsO4cmdlbnNl
biA8dG9rZUByZWRoYXQuY29tPgo+IFRlc3RlZC1ieTogTWFyZWsgQmVow7puIDxrYWJlbEBrZXJu
ZWwub3JnPgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXBjaS84N2g3bDhh
eHFwLmZzZkB0b2tlLmRrLwo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnICMgYzgwODUxZjZj
ZTYzYSAoIlBDSTogQWRkCj4gUENJX0VYUF9MTktDVEwyX1RMUyogbWFjcm9zIikKClRoYW5rcyEK
ClRlc3RlZC1ieTogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJlZGhhdC5jb20+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1h
aWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
