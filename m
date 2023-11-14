Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C904DC4332F
	for <ath10k@archiver.kernel.org>; Tue, 14 Nov 2023 19:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hTBMqNgvYAVgFwNe1za9DT/kmrG9DdUJbGepyKDGCNg=; b=CGGvss2P4W2w9M
	BVKOyYB+URlP+LyKdv4RHjhSH6S2Oy9JeG1ndDFdY0mP5UslWMzAOlygTPNYBMN8dEfuvAo91x8Tv
	HYx3KW19mTSvJ38Rmeqr4MCDl7LkQVkhZKGrR01rAADChAl5fKocka+YSp+ZxTArvcPlwATFHzuli
	sYUbvML1Duxrwvt9SnAmLNHxwZGg2yCVHZETUBN91qWT24DRNPI1KNhRiukErfnXdxnHNutETUOnH
	vsGsup2r1iEPBPLDhRDRnuMYHZzI6v/QyFP4JMjbSAAeAdwFAIfkqp8vbwR+ZRV5ojA1KRsz9K4Lc
	9sFfxeqHycDZz2y2rd9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2z8G-00Gd9b-2D;
	Tue, 14 Nov 2023 19:31:32 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2z8C-00Gd8x-0y
	for ath10k@lists.infradead.org;
	Tue, 14 Nov 2023 19:31:30 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6ce2cf67be2so3158475a34.2
        for <ath10k@lists.infradead.org>; Tue, 14 Nov 2023 11:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699990285; x=1700595085; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wtboxeZapevqapsYTQaBIObnwy8xk1I1VCxFzE4AvHA=;
        b=J3qOqZl8QqeBd2rbGBktG9euE7PaOSSQA57tJEWTjrkdtejBKMkz/OEKEEnKPxMK06
         rm75viSeiwm1rGYh6FyoPuXLKe5ySHaAS41FsNskXdkP8nHoSy8Qpk8dy7hCAQPosPak
         jGsOiNtNyoayP12Db7IhCRRWxGCENlMwXzqh/4rdG4rX0uOKFoJsUBGBke64PA8sJIQs
         g0KfwT8iLHR/0ngl68vPqMWCeP+RSHoQPP8/iFQee0VCrHrgZ85rZJGTUSXzpmFc8nwS
         Fbe1xalAJiwvqSRNIQb5/L4roXmyKKbRFu8qKna7Dm3JZbbrh7bbZS8NBvEuWeRpsGCF
         2ZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699990285; x=1700595085;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wtboxeZapevqapsYTQaBIObnwy8xk1I1VCxFzE4AvHA=;
        b=T3gfa1T/N07/AC/oIGfGEI8MaUxrvjPMue4QaUpNXwhqpg/4I00KCtZTzhH44CLd6/
         gnxnythIIh0IWJK0vK1O0ZU2S61wcRZgPFJvS81sQvECaZEa+g4pTwkmmLsOtOQBb6jV
         04eZrINVS7r4VeyoEAzELiF9m9Igr5aDh4kzO/yDczxo5HTUyLrAyFiWSaMkR+y0F9Wg
         Dui1HlkdHieHQ5Dq+S3evOKRlmr34VNM8EctJY75AFJhbDlIjDgBzh/kDKsl8IlcnYkg
         vcKif0oSjEe4lgwjE8GTTemtFS8ZrNmxq1T2aT2bZUAS16G8je8X98CMjghQvfpy9ZUe
         FRPA==
X-Gm-Message-State: AOJu0YxPWx8LhGqYbpIobv6HFNKYE48H+siQVhf3XN9d9B9jGRjf3PdL
	urwv9vztQyWRbqW918aKYv03hPQmho0=
X-Google-Smtp-Source: AGHT+IGs2PcbzQVSKPf2e6fUgw/IkPW+D2xbIBMQ7C0prthDuv25lgTuqorqOhA99tsKawGm10sWWQ==
X-Received: by 2002:a05:6830:90b:b0:6b9:b1b0:fcd1 with SMTP id v11-20020a056830090b00b006b9b1b0fcd1mr3851837ott.31.1699990285238;
        Tue, 14 Nov 2023 11:31:25 -0800 (PST)
Received: from [10.102.4.159] (50-78-19-50-static.hfc.comcastbusiness.net. [50.78.19.50])
        by smtp.gmail.com with ESMTPSA id g16-20020ad45150000000b0066d1bae2326sm3163226qvq.57.2023.11.14.11.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 11:31:24 -0800 (PST)
Message-ID: <7c3874b1-2d0f-49a0-9542-18b5350ae99a@gmail.com>
Date: Tue, 14 Nov 2023 11:31:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ath10k: reduce invalid ht params rate message noise
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, skhan@linuxfoundation.org,
 Wen Gong <quic_wgong@quicinc.com>
References: <cover.1612915444.git.skhan@linuxfoundation.org>
 <76a816d983e6c4d636311738396f97971b5523fb.1612915444.git.skhan@linuxfoundation.org>
 <5c31f6dadbcc3dcb19239ad2b6106773@codeaurora.org>
 <87h7mktjgi.fsf@codeaurora.org>
 <db4cd172-6121-a0b7-6c3f-f95baae1c1ed@linuxfoundation.org>
 <87wnvesv8t.fsf@codeaurora.org>
 <82e3e0a2-d95b-cffb-4fa7-2eaa4513dd48@linuxfoundation.org>
 <4a02dd43-c629-4c7c-83fe-256e6d444d60@locusrobotics.com>
 <859fac21-9b1a-452e-91bb-c6d097d451b6@quicinc.com>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <859fac21-9b1a-452e-91bb-c6d097d451b6@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_113128_347844_0C9DF19A 
X-CRM114-Status: GOOD (  25.75  )
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

T24gOS8yMC8yMyAxMjoyMyBQTSwgSmVmZiBKb2huc29uIHdyb3RlOgo+IChqdXN0IGEgcmVzZW5k
IHdpdGggV2VuJ3MgY3VycmVudCBlLW1haWwgYWRkcmVzcywgbm8gZnVydGhlciBjb21tZW50cykK
PiBPbiA5LzIwLzIwMjMgMTE6MjcgQU0sIEphbWVzIFByZXN0d29vZCB3cm90ZToKPj4gT24gMi8y
Ni8yMSAxMDowMSBBTSwgU2h1YWggS2hhbiB3cm90ZToKPj4+IE9uIDIvMTEvMjEgNDoyNCBBTSwg
S2FsbGUgVmFsbyB3cm90ZToKPj4+PiBTaHVhaCBLaGFuIDxza2hhbkBsaW51eGZvdW5kYXRpb24u
b3JnPiB3cml0ZXM6Cj4+Pj4KPj4+Pj4gT24gMi8xMC8yMSAxOjI4IEFNLCBLYWxsZSBWYWxvIHdy
b3RlOgo+Pj4+Pj4gV2VuIEdvbmcgPHdnb25nQGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6Cj4+Pj4+
Pgo+Pj4+Pj4+IE9uIDIwMjEtMDItMTAgMDg6NDIsIFNodWFoIEtoYW4gd3JvdGU6Cj4+Pj4+Pj4+
IGF0aDEwa19tYWNfZ2V0X3JhdGVfZmxhZ3NfaHQoKSBmbG9vZHMgZG1lc2cgd2l0aCB0aGUgZm9s
bG93aW5nCj4+Pj4+Pj4+IG1lc3NhZ2VzLAo+Pj4+Pj4+PiB3aGVuIGl0IGZhaWxzIHRvIGZpbmQg
YSBtYXRjaCBmb3IgbWNzPTcgYW5kIHJhdGU9MTQ0MC4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gc3VwcG9y
dGVkX2h0X21jc19yYXRlX25zczI6Cj4+Pj4+Pj4+IHs3LMKgIHsxMzAwLCAyNzAwLCAxNDQ0LCAz
MDAwfSB9Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IGF0aDEwa19wY2kgMDAwMDowMjowMC4wOiBpbnZhbGlk
IGh0IHBhcmFtcyByYXRlIDE0NDAgMTAwa2JwcyBuc3MgMgo+Pj4+Pj4+PiBtY3MgNwo+Pj4+Pj4+
Pgo+Pj4+Pj4+PiBkZXZfd2Fybl9yYXRlbGltaXRlZCgpIGlzbid0IGhlbHBpbmcgdGhlIG5vaXNl
LiBVc2UgCj4+Pj4+Pj4+IGRldl93YXJuX29uY2UoKQo+Pj4+Pj4+PiBpbnN0ZWFkLgo+Pj4+Pj4+
Pgo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBTaHVhaCBLaGFuIDxza2hhbkBsaW51eGZvdW5kYXRp
b24ub3JnPgo+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4gwqDCoCBkcml2ZXJzL25ldC93aXJlbGVzcy9h
dGgvYXRoMTBrL21hYy5jIHwgNSArKystLQo+Pj4+Pj4+PiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL21hYy5jCj4+Pj4+Pj4+IGIvZHJp
dmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9tYWMuYwo+Pj4+Pj4+PiBpbmRleCAzNTQ1Y2U3
ZGNlMGEuLjI3NjMyMWYwY2ZkZCAxMDA2NDQKPj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDEway9tYWMuYwo+Pj4+Pj4+PiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTBrL21hYy5jCj4+Pj4+Pj4+IEBAIC04OTcwLDggKzg5NzAsOSBAQCBzdGF0aWMg
dm9pZCAKPj4+Pj4+Pj4gYXRoMTBrX21hY19nZXRfcmF0ZV9mbGFnc19odChzdHJ1Y3QKPj4+Pj4+
Pj4gYXRoMTBrICphciwgdTMyIHJhdGUsIHU4IG5zcywgdTgKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKmJ3IHw9IFJBVEVfSU5GT19CV180MDsKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKmZsYWdzIHw9IFJBVEVfSU5GT19GTEFHU19TSE9SVF9HSTsKPj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgIH0gZWxzZSB7Cj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBhdGgxMGtfd2Fybihhciwg
ImludmFsaWQgaHQgcGFyYW1zIHJhdGUgJWQgMTAwa2JwcyBuc3MgCj4+Pj4+Pj4+ICVkIG1jcyAl
ZCIsCj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmF0ZSwgbnNzLCBt
Y3MpOwo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2X3dhcm5fb25jZShhci0+ZGV2LAo+Pj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiaW52YWxpZCBodCBwYXJh
bXMgcmF0ZSAlZCAxMDBrYnBzIG5zcyAlZCAKPj4+Pj4+Pj4gbWNzICVkIiwKPj4+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmF0ZSwgbnNzLCBtY3MpOwo+Pj4+Pj4+
PiDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4+PiDCoMKgIH0KPj4+Pj4+Pgo+Pj4+Pj4+IFRoZSB7NyzC
oCB7MTMwMCwgMjcwMCwgMTQ0NCwgMzAwMH0gfSBpcyBhIGNvcnJlY3QgdmFsdWUuCj4+Pj4+Pj4g
VGhlIDE0NDAgaXMgcmVwb3J0IGZyb20gZmlybXdhcmUsIGl0cyBhIHdyb25nIHZhbHVlLCBpdCBo
YXMgCj4+Pj4+Pj4gZml4ZWQgaW4KPj4+Pj4+PiBmaXJtd2FyZS4KPj4+Pj4+Cj4+Pj4+PiBJbiB3
aGF0IHZlcnNpb24/Cj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBIZXJlIGlzIHRoZSBpbmZvOgo+Pj4+Pgo+
Pj4+PiBhdGgxMGtfcGNpIDAwMDA6MDI6MDAuMDogcWNhNjE3NCBodzMuMiB0YXJnZXQgMHgwNTAz
MDAwMCBjaGlwX2lkCj4+Pj4+IDB4MDAzNDBhZmYgc3ViIDE3YWE6MDgyNwo+Pj4+Pgo+Pj4+PiBh
dGgxMGtfcGNpIDAwMDA6MDI6MDAuMDogZmlybXdhcmUgdmVyIFdMQU4uUk0uNC40LjEtMDAxNDAt
UUNBUk1TV1BaLTEKPj4+Pj4gYXBpIDYgZmVhdHVyZXMgd293bGFuLGlnbm9yZS1vdHAsbWZwIGNy
YzMyIDI5ZWI4Y2ExCj4+Pj4+Cj4+Pj4+IGF0aDEwa19wY2kgMDAwMDowMjowMC4wOiBib2FyZF9m
aWxlIGFwaSAyIGJtaV9pZCBOL0EgY3JjMzIgNGFjMDg4OWIKPj4+Pj4KPj4+Pj4gYXRoMTBrX3Bj
aSAwMDAwOjAyOjAwLjA6IGh0dC12ZXIgMy42MCB3bWktb3AgNCBodHQtb3AgMyBjYWwgb3RwCj4+
Pj4+IG1heC1zdGEgMzIgcmF3IDAgaHdjcnlwdG8gMQo+Pj4+Pgo+Pj4+Pj4+IElmIGNoYW5nZSBp
dCB0byBkZXZfd2Fybl9vbmNlLCB0aGVuIGl0IHdpbGwgaGF2ZSBubyBjaGFuY2UgdG8gCj4+Pj4+
Pj4gZmluZCB0aGUKPj4+Pj4+PiBvdGhlciB3cm9uZyB2YWx1ZXMgd2hpY2ggcmVwb3J0IGJ5IGZp
cm13YXJlLCBhbmQgaXQgaW5kaWNhdGUKPj4+Pj4+PiBhIHdyb25nIHZhbHVlIHRvIG1hYzgwMjEx
L2NmZzgwMjExIGFuZCBsZWFkICJpdyB3bGFuMCBzdGF0aW9uIGR1bXAiCj4+Pj4+Pj4gZ2V0IGEg
d3JvbmcgYml0cmF0ZS4KPj4+Pj4+Cj4+Pj4+Cj4+Pj4+IEFncmVlZC4KPj4+Pj4KPj4+Pj4+IEkg
YWdyZWUsIHdlIHNob3VsZCBrZWVwIHRoaXMgd2FybmluZy4gSWYgdGhlIGZpcm13YXJlIHN0aWxs
IGtlZXBzCj4+Pj4+PiBzZW5kaW5nIGludmFsaWQgcmF0ZXMgd2Ugc2hvdWxkIGFkZCBhIHNwZWNp
ZmljIGNoZWNrIHRvIGlnbm9yZSAKPj4+Pj4+IHRoZSBrbm93bgo+Pj4+Pj4gaW52YWxpZCB2YWx1
ZXMsIGJ1dCBub3QgYWxsIG9mIHRoZW0uCj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBXb3VsZCBpdCBiZSBo
ZWxwZnVsIHRvIGFkanVzdCB0aGUgZGVmYXVsdCByYXRlIGxpbWl0cyBhbmQgc2V0IHRoZSB0bwo+
Pj4+PiBhIGhpZ2hlciB2YWx1ZSBpbnN0ZWFkLiBJdCBtaWdodCBiZSBkaWZmaWN1bHQgdG8gYWNj
b3VudCBhbGwgcG9zc2libGUKPj4+Pj4gaW52YWxpZCB2YWx1ZXM/Cj4+Pj4+Cj4+Pj4+IFNvbWV0
aGluZyBsaWtlLCBhdGgxMGtfd2Fybl9yYXRlbGltaXRlZCgpIHRvIGFkanVzdCB0aGUKPj4+Pj4K
Pj4+Pj4gREVGQVVMVF9SQVRFTElNSVRfSU5URVJWQUwgYW5kIERFRkFVTFRfUkFURUxJTUlUX0JV
UlNUIHVzaW5nCj4+Pj4+IERFRklORV9SQVRFTElNSVRfU1RBVEUKPj4+Pj4KPj4+Pj4gTGV0IG1l
IGtub3cgaWYgeW91IGxpa2UgdGhpcyBpZGVhLiBJIGNhbiBzZW5kIGEgcGF0Y2ggaW4gdG8gZG8g
dGhpcy4KPj4+Pj4gSSB3aWxsIGhhbmcgb24gdG8gdGhpcyBmaXJtd2FyZSB2ZXJzaW9uIGZvciBh
IGxpdHRsZSBidXQgbG9uZ2VyLCBzbwo+Pj4+PiB3ZSBoYXZlIGEgdGVzdCBjYXNlLiA6KQo+Pj4+
Cj4+Pj4gSSB3b3VsZCByYXRoZXIgZmlyc3QgdHJ5IHRvIGZpeCB0aGUgcm9vdCBjYXVzZSwgd2hp
Y2ggaXMgdGhlIGZpcm13YXJlCj4+Pj4gc2VuZGluZyBpbnZhbGlkIHJhdGVzLiBXZW4sIHlvdSBt
ZW50aW9uZWQgdGhlcmUncyBhIGZpeCBpbiAKPj4+PiBmaXJtd2FyZS4gRG8KPj4+PiB5b3Uga25v
dyB3aGljaCBmaXJtd2FyZSB2ZXJzaW9uIChhbmQgYnJhbmNoKSBoYXMgdGhlIGZpeD8KPj4+Pgo+
Pj4KPj4+IFBpY2tpbmcgdGhpcyBiYWNrIHVwLiBXZW4sIHdoaWNoIGZpcm13YXJlIHZlcnNpb24g
aGFzIHRoaXMgZml4PyBJIGNhbgo+Pj4gdGVzdCB0aGlzIG9uIG15IHN5c3RlbSBhbmQgZ2V0IHJp
ZCBvZiB0aGUgbm9pc3kgbWVzc2FnZXMuIDopCj4+Pgo+Pj4gdGhhbmtzLAo+Pj4gLS0gU2h1YWgK
Pj4KPj4gSSBrbm93IGl0cyBiZWVuIHllYXJzLCBidXQgcmVhZGluZyB0aHJvdWdoIHRoaXMgV2Vu
IG1lbnRpb25lZCB0aGVyZSAKPj4gaXMgYSBmaXggaW4gdGhlIGZpcm13YXJlPyBJIGhhdmVuJ3Qg
dHJpZWQgYWxsIG9mIHRoZSBmaXJtd2FyZSAKPj4gYmluYXJpZXMgaW4gS2FsbGUncyB0cmVlIGJ1
dCB0aGUgbW9zdCByZWNlbnQgZGVmaW5pdGVseSBzdGlsbCBzcGFtIAo+PiB0aGUgbG9ncyB3aXRo
IHRoaXMgbWVzc2FnZS4gSXMgdGhlcmUgYSBzcGVjaWZpYyB2ZXJzaW9uIEkgY2FuIHVzZSB0byAK
Pj4gZ2V0IHJpZCBvZiB0aGVzZT8KPj4KPj4gT25lIHRoaW5nIHRvIG5vdGUgaXMgdGhlIG9sZGVy
ICJmaXJtd2FyZS00LmJpbiIgZGlkIG5vdCBoYXZlIHRoaXMgCj4+IHByb2JsZW0sIGJ1dCB3YXMg
bWV0IHdpdGggd29yc2UgcHJvYmxlbXMgbGlrZSBkcml2ZXIvZmlybXdhcmUgY3Jhc2hlcy4KCkkg
aGF0ZSB0byBrZWVwIGJyaW5naW5nIHRoaXMgdXAsIGFuZCBpZiBpdHMgYSAid29uJ3QgZml4IiB0
eXBlIG9mIGlzc3VlIAp5b3UgZG9uJ3QgaGF2ZSB0byB0ZWxsIG1lIHR3aWNlIGFuZCBJIGNhbiBk
ZWFsIHdpdGggaXQgb3V0IG9mIHRyZWUuIEFueSAKYW5zd2VyIHdvdWxkIGJlIGdyZWF0bHkgYXBw
cmVjaWF0ZWQgc28gSSBrbm93IGhvdyB0byBwcm9jZWVkLCBhbmQgaWYgaXRzIApzb21ldGhpbmcg
SSBjYW4gd2FpdCBmb3Igb24gdXBzdHJlYW0gb3IgaGFuZGxlIG9uIG15IG93bi4gU2luY2UgaXRz
IAphcHBhcmVudGx5IGEgZmlybXdhcmUgYnVnIGl0cyBub3Qgc29tZXRoaW5nIEkgY2FuIGZpeCwg
b3IgSSB3b3VsZCB0cnkgdG8gCm15c2VsZi4KCihzb3JyeSwgbXkgbGFzdCBpbnF1aXJ5IHdhcyBt
aXN0YWtlbmx5IGZyb20gYSBkaWZmZXJlbnQgZW1haWwgYWRkcmVzcykuCgpUaGFua3MsCgpKYW1l
cwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEw
ayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
