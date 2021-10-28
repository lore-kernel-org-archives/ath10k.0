Return-Path: <SRS0=1Jc9=PQ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489EFC433EF
	for <ath10k@archiver.kernel.org>; Thu, 28 Oct 2021 11:31:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0711C610FC
	for <ath10k@archiver.kernel.org>; Thu, 28 Oct 2021 11:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0711C610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lUYtrXCjZTBySWK8BaVv7i9OCWGGPDQeQ/yIGHt52aA=; b=Nu2G6gw/0jA/OW
	Tolh/8osLb/b63gl1R+TC4AthvDfe3Gw4fJ1eX50wW0SJZjm5TcvMlrhP+Pa6n2tBzexOp0TMWJmH
	kUV4j5H3AdDo5T33exvCNEYADXEQjTaWMrbhIoSpAxUk57VcoND0IEyApRSMijwbDQRjeQ6bpdsBx
	xFnpwHFRmh2pOYuwLGAgyzGqaK1s+rkmpFZ34LiYfpNpaOTKSLHfT+yNVDIok5709oBrkFdTYo4zn
	peC///YKjeTwUKf+7gCBqCZNKPGKlr5nSHetk5q5vsnBDVMekEvxk0tDLFnwC6LHCL/YoFJu6HAc9
	CmrADr48Iop7QIbux8Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg3ck-007h7q-Gl; Thu, 28 Oct 2021 11:31:10 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg3ch-007h7B-JV
 for ath10k@lists.infradead.org; Thu, 28 Oct 2021 11:31:09 +0000
Received: by mail-wr1-x435.google.com with SMTP id e4so9562080wrc.7
 for <ath10k@lists.infradead.org>; Thu, 28 Oct 2021 04:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=v45ZDvsCFAEFClI2WbhlvofL+jPYAH3IJRRv2CmKvZY=;
 b=Dtp5BSb9RfS5Q4eAHJvIgnSeVRI0mFRwjSX9yXn/Sa3FQT1nKdOPINwHjwY5joS6bw
 0eIi4/vNnwD7l/M194kArgX4XYRTK3wGwOk1/3ZY8SmsotdyzNnLbWlWI4AzSVcgaloO
 PpX+Fa/RRGtn/VZkWTNFlLNmlUxUrkeEiUJVmsSBQH92B+XQdfEG9ma8Kq7rKTbsg3ab
 y7p12BmbHUcHzdegTgjCyafL2Wsv8qG15CFQBTX2fM2mtQ8aItp1tqVhC4tSpokqui4o
 Z4t5hevM59e9kflaaCJx2YeTXcQPkVaVppylYPjLxMaNCBR5F7fulQBrJe/+I3ZhOoV+
 S+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=v45ZDvsCFAEFClI2WbhlvofL+jPYAH3IJRRv2CmKvZY=;
 b=XaUe+b1rwp1ks4zcGF0+xPbG3dn4sWpI1/J402vP/MwwaCjYL1tQKkM76fnocw7RLj
 /y9k1V+7Jf+94WvhwRaRQlaIfKhPWJ2OYPGztS30ODOIHjduK041Lv3p/KuiRZFkX2wp
 belVGylkST3Iz2RdkaYVn3N0XiytAiwiK8aODQr8pjmeEf5WLQFnDoeOaU7buxhdiaKA
 FQZIpDIF3/ydLCviyQhWiBLRe3z4CmJD9Lqyz1ZHR8CsusF4YkJktxV1Zflat4OPcjKR
 SVMkfBbBvFyuqVS7XzVMZk4RCcUIkSCWv/bUfGZqGFIf8KhMHY14lxI+bfK2TfyDdekU
 D5rA==
X-Gm-Message-State: AOAM532d/9yHCtnQ4Xt0mi2kEQUMcdU6T7PixpijmNFwpTNzsVSONCyL
 XFwdEGE93kSJfuf0yvL1AZo=
X-Google-Smtp-Source: ABdhPJw/1GYkx/Y2CbDy7KIVuyoIC0xF5Cv943IL2bvIf/Qr4SjNwh8qFyBBOVkIW6iQCRMTBjqlaQ==
X-Received: by 2002:adf:f8c2:: with SMTP id f2mr5062194wrq.234.1635420664066; 
 Thu, 28 Oct 2021 04:31:04 -0700 (PDT)
Received: from debian64.daheim (p5b0d7857.dip0.t-ipconnect.de. [91.13.120.87])
 by smtp.gmail.com with ESMTPSA id
 m3sm2769475wrx.52.2021.10.28.04.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 04:31:03 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1])
 by debian64.daheim with esmtp (Exim 4.95)
 (envelope-from <chunkeey@gmail.com>) id 1mg1jk-0006pt-1M;
 Thu, 28 Oct 2021 13:31:03 +0200
Message-ID: <3a8840ea-1499-950b-fb44-7546a32c586f@gmail.com>
Date: Thu, 28 Oct 2021 13:31:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2] ath10k: fetch (pre-)calibration data via nvmem
 subsystem
Content-Language: en-US
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 Ansuel Smith <ansuelsmth@gmail.com>
References: <20211016234609.1568317-1-chunkeey@gmail.com>
 <87ee855xwa.fsf@codeaurora.org>
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <87ee855xwa.fsf@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_043107_668786_C9478F0E 
X-CRM114-Status: GOOD (  21.27  )
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

T24gMjgvMTAvMjAyMSAxMDo1OCwgS2FsbGUgVmFsbyB3cm90ZToKPiBDaHJpc3RpYW4gTGFtcGFy
dGVyIDxjaHVua2VleUBnbWFpbC5jb20+IHdyaXRlczoKPiAKPj4gQVRIMTBLIGNoaXBzIGFyZSB1
c2VkIGl0IHdpZGUgcmFuZ2Ugb2Ygcm91dGVycywKPj4gYWNjZXNzcG9pbnRzLCByYW5nZSBleHRl
bmRlcnMsIG5ldHdvcmsgYXBwbGlhbmNlcy4KPj4gT24gdGhlc2UgZW1iZWRkZWQgZGV2aWNlcywg
Y2FsaWJyYXRpb24gZGF0YSBpcyBvZnRlbgo+PiBzdG9yZWQgb24gdGhlIG1haW4gc3lzdGVtJ3Mg
Zmxhc2ggYW5kIHdhcyBvdXQgb2YgcmVhY2gKPj4gZm9yIHRoZSBkcml2ZXIuCj4+Cj4+IFRvIGJy
aWRnZSB0aGlzIGdhcCwgYXRoMTBrIGlzIGdldHRpbmcgZXh0ZW5kZWQgdG8gcHVsbAo+PiB0aGUg
KHByZS0pY2FsaWJyYXRpb24gZGF0YSB0aHJvdWdoIG52bWVtIHN1YnN5c3RlbS4KPj4gVG8gZG8g
dGhpcywgYSBudm1lbS1jZWxsIGNvbnRhaW5pbmcgdGhlIGluZm9ybWF0aW9uIGNhbgo+PiBlaXRo
ZXIgYmUgc3BlY2lmaWVkIGluIHRoZSBwbGF0Zm9ybSBkYXRhIG9yIHZpYSBkZXZpY2UtdHJlZS4K
Pj4KPj4gVGVzdGVkIHdpdGg6Cj4+ICAgICAgICAgIE5ldGdlYXIgRVg2MTUwdjIgKElQUTQwMTgg
LSBwcmUtY2FsaWJyYXRpb24gbWV0aG9kKQo+PiAgICAgICAgICBUUC1MaW5rIEFyY2hlciBDNyB2
MiAoUUNBOTg4MHYyIC0gb2xkIGNhbGlicmF0aW9uIG1ldGhvZCkKPj4KPj4gQ2M6IFJvYmVydCBN
YXJrbyA8cm9iaW1hcmtvQGdtYWlsLmNvbT4KPj4gQ2M6IFRoaWJhdXQgVkFSw4hORSA8aGFja3NA
c2xhc2hkaXJ0Lm9yZz4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIExhbXBhcnRlciA8Y2h1
bmtlZXlAZ21haWwuY29tPgo+PiAtLS0KPj4KPj4gdjEgLT4gdjI6Cj4+IAktIHVzZSAlenUgYW5k
ICV1IGluIHRoZSBmb3JtYXQgc3RyaW5nIGZvciBzaXplX3QKPj4gICAgICAgICAgICBhbmQgdTMy
IHR5cGVzIChjYXRjaGVkIGJ5IHRoZSAia2VybmVsIHRlc3Qgcm9ib3QiKS4KPj4gCS0gcmV3b3Jk
ZWQgY29tbWl0IG1lc3NhZ2UgKyBzdWNjZXNzZnVsbHkgdGVzdGVkIG9uIFFDQTk4ODB2Mgo+Pgo+
PiBJIHBsYWNlZCB0aGUgbnZtZW0gY29kZSBpbiBmcm9udCBvZiB0aGUgY3VycmVudCAiZmlsZSIg
bWV0aG9kCj4+IChmaXJtd2FyZV9yZXF1ZXN0KS4gUmVhc29uIGlzIHRoYXQgdGhpcyBtYWtlcyBp
dCBlYXNpZXIgZm9yIG1lCj4+IHRvIHRlc3QgaXQuIElmIG5lZWRlZCBpdCBjYW4gYmUgbW92ZWQg
dG8gYSBkaWZmZXJlbnQgcGxhY2UuCj4gCj4gTG9va3MgZ29vZCB0byBtZS4gQmVmb3JlIEkgYXBw
bHkgdGhpcywgSSB3YW50IHRvIG1lbnRpb24gdG8gdGhhdCBJIGhhdmUKPiBoYWQgYSBsb25nIGlu
IG15IGRlZmVycmVkIHF1ZXVlIHJlbGF0ZWQgdHdvIHBhdGNoc2V0czoKCgo+IGh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9wYXRjaC8yMDIwMDkyNzE5
MjUxNS44Ni0xLWFuc3VlbHNtdGhAZ21haWwuY29tLwo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9wYXRjaC8yMDIwMDkyNzE5MjUxNS44Ni0yLWFu
c3VlbHNtdGhAZ21haWwuY29tLwpPaCBvaywgc2VydmVzIG1lIHJpZ2h0IGZvciBub3QgbG9va2lu
ZyB0aG9yb3VnaGx5IGdvb2dsaW5nIHRoaXMgZmlyc3QuCkFsYmFuIEJlZGVsIGFuZCBBbnN1ZWwn
cyB3b3JrIG1hZGUgdGhpcyBudm1lbSBhbGwgcG9zc2libGUuIEFuZCBpbmRlZWQsCnRoZSBzZWNv
bmQgcGF0Y2ggaGVyZSBsb29rcyBlZXJpZSBzaW1pbGFyLgoKRG8geW91IHdhbnQgdG8gZ28gd2l0
aCBoaXMgdHdvIHBhdGNoZXMgaW5zdGVhZD8gSSdsbCBjaGFuZ2UgbWluZSwgc28gaXQKanVzdCBj
b25zaXN0cyBvZiB0aGUgY2FsX21vZGUgZm9yIHRoZSBvbGRlciBRQ0E5ODgwdjIsUUNBOTg4NyBh
bmQKYWRkIHRoZSAtRVBST0JFX0RFRkVSIGhhbmRsaW5nLiBUaGlzIC1FUFJPQkVfREVGRVIgb25s
eSBldmVyIGNvbWVzIHVwCndpdGggdGhlIE1lcmFraSBnZWFyLiBUaGlzIGlzIGJlY2F1c2UgTWVy
YWtpIGxpa2VzIHB1dHRpbmcgdGhlIE1BQ3MtVmFsdWVzCmludG8gU29DLWNvbm5lY3RlZCBBVDI0
IGVlcHJvbXMtY2hpcHMuIEV2ZXJ5b25lIGVsc2UganVzdCBoYXZlIHRoZW0gaW4gYQpwcm9wZXIg
RkxBU0ggcGFydGl0aW9uLiBUaG91Z2gsIHRoaXMncyB1c3VhbGx5IG5vdGhpbmcgbW9yZSB0aGFu
IGFkZGluZwp0aGUgZm9sbG93aW5nIGxpbmU6CgppZiAocmV0ID09IC1FUFJPQkVSX0RFRkVSKQoJ
cmV0dXJuIHJldDsKCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4
LXdpcmVsZXNzL3BhdGNoLzIwMjAwOTE4MTgxMTA0Ljk4LTEtYW5zdWVsc210aEBnbWFpbC5jb20v
Cj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL3Bh
dGNoLzIwMjAwOTE4MTgxMTA0Ljk4LTItYW5zdWVsc210aEBnbWFpbC5jb20vCgpBbnN1ZWwncyBw
b3N0OiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3Mv
cGF0Y2gvMjAyMDA5MTgxODExMDQuOTgtMi1hbnN1ZWxzbXRoQGdtYWlsLmNvbS8jMjM2MzkzNjEK
ID4gWW91IGFyZSByaWdodCBhYm91dCBudm1lbS4uLiBQcm9ibGVtIGlzIHRoYXQgbnZtZW0gZm9y
IG10ZCBpcyBzdGlsbCBub3QKID4gc3VwcG9ydGVkLiBJIGFscmVhZHkgc2VudCBhIHBhdGNoIHRv
IGZpeCB0aGlzIGluIHRoZSBtdGQgbWFpbGluZyBsaXN0IGJ1dAogPiBJJ20gd2FpdGluZyBmb3Ig
cmV2aWV3Li4uCiA+IElmIHRoYXQgd2lsbCBiZSBhY2NlcHRlZCwgSSBjYW4gY29udmVydCB0aGlz
IHBhdGNoIHRvIHVzZSBudm1lbSBhcGkuCgpUaGUgbnZtZW0gYXBpIGlzIHRoZXJlICh3aGljaCBt
YWtlcyB0aGVzZSB0d28gcGF0Y2hlcyBvYnNvbGV0ZSBJIHRoaW5rKS4KR3JhbnRlZDogVGhlIG52
bWVtIGNhbid0IGRvIGFsbCB0aGUgc2FtZSBjYXNlcyAoRnJvbSB3aGF0IEkga25vdywgbXRkCnBh
cnRpdGlvbnMgc3BsaXR0ZXJzIGFuZCBtdGRwYXJ0cyB0aHJvdWdoIGNvbW1hbmRsaW5lIGlzIGJl
aW5nIHdvcmtlZCBvbi4KQnV0IHdlIGFsd2F5cyBoYXZlIHVzZXJzcGFjZSArIGZpcm13YXJlX3Jl
cXVlc3QgYXMgYSBmYWxsYmFjaykuCgpDaGVlcnMsCkNocmlzdGlhbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgx
MGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2F0aDEwawo=
