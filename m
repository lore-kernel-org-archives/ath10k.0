Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969B1C61D92
	for <ath10k@archiver.kernel.org>; Tue, 21 Nov 2023 15:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pG0bEMEKj7ioLvrnnQ8EN3dzl2xl1CrUd6NGsZQ97CM=; b=kYYtfcMzQ7Cjiq
	ZtT0qb4zrs3AZwV/n9GZQJY8VW+fmTlQ5WmfzaxSfjcDVF4AZMdkdztPloPnS+tEv3QAUcrBnpANf
	YAQbQXqr3TVYSvrMBfbpHAsBpU5W98cs30X6m/y8fvZwrT9HSKAAwHR2vniUl9Dw+e1SXFq+IWaxG
	tvtsFIT4RnKiz4/IGCPXmm8jkVm55P42Rgndskk/wczBa4v87Ca/dyOe7n9HqG+PHBwUVx2syS6Do
	xuW9sr+z5hF7YRQYdJI6fK993SlR9H2P51Rn1Dhn4GXzWIVuoIdYers31FgasBAw7qnV2XcfaplZO
	G5UwPWZVVj4BTlghGCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5SS7-00H7MW-2P;
	Tue, 21 Nov 2023 15:14:15 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5SS5-00H7Lj-0V
	for ath10k@lists.infradead.org;
	Tue, 21 Nov 2023 15:14:14 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-77a453eb01cso365686085a.0
        for <ath10k@lists.infradead.org>; Tue, 21 Nov 2023 07:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700579651; x=1701184451; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m18ZEuLNw7SFuM/At9/C0XioS5uJCftOiNsRL9m7KNY=;
        b=T4fe0M6EY4+l+4YvycqX1Qm+aEE7C4EAeZxi+umjcawLODJNS1Nt1LfHD0wwFUQDwX
         RzYXb6Ucu/w755ho4Zxqd5sqZkrN6FEvYkxSObDm9+6JWJElRUHjZM8nNuzPP8+6AjGW
         esx8/B7K7NEaerrP69/c6f1aDgC7aBZZSiWUwZ3/KORruQsNG5JIVKzXYeuWyeurekWl
         idULevKdkLIjMP6vTD2QAryJqBzqF/tPoc6ELH/z3IBbg1ih8cgI5ki670mYOJBj/x+O
         CCQ5Fw7Q0ttzGatz+xV0mXhpOkEUV65ULpX95/l3jOx4aAcVDKYTaKOLqeDoiKPcuRUG
         PZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700579651; x=1701184451;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m18ZEuLNw7SFuM/At9/C0XioS5uJCftOiNsRL9m7KNY=;
        b=mPZ07uUC0yUoYYHvvITn6SmOVUMTXimd25m2XTfkM65d4f1z3dTj7Hvv4aG1yjAC2l
         nCnNye69vXim7KZFq0QEnvxFgoHS+f4xTz3cgj8tTGbJQJT2/jqlZXtj2+ET0vnNFhit
         MFYgjh1/LylbjMUYAVUF1YAEQ9rGDZ05tgnxI7aH4e5FqJJnnqMz+JOHSCiVYSHRffs1
         wth6/ZeokvVCGCNPbf/V5uhc5LTEBrsrT4ZqpKhjoVHRbEUZM3XZ3oaHsfbqORojQ0nz
         25pl7eUS570YIH75XuRbAh0PzCVjyxWnpPa3SgyLpCeWmo+tTm5N8pmiAue1TgLcXdzj
         ymEw==
X-Gm-Message-State: AOJu0Yxl5yU6+JdbJYz4JSF5MnYmCgAbLIsgBg5me2g9O3ggA2MdTutH
	vqMzNtJSnM679lBKNJKpS1k=
X-Google-Smtp-Source: AGHT+IH6VbZJcYLjUiF3iA2Sv9k64F/4HwgaDg2y5WJBh7lyf5VeL2OaZ7OQYNN5C6HNjzoxg/Ja0w==
X-Received: by 2002:a05:620a:8f0f:b0:76d:268b:9741 with SMTP id rh15-20020a05620a8f0f00b0076d268b9741mr9080279qkn.17.1700579651483;
        Tue, 21 Nov 2023 07:14:11 -0800 (PST)
Received: from [10.175.109.209] ([208.195.13.131])
        by smtp.gmail.com with ESMTPSA id bj35-20020a05620a192300b0077d6084e205sm112833qkb.15.2023.11.21.07.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 07:14:11 -0800 (PST)
Message-ID: <fb855941-d70e-4ff6-9f3f-87bfcbcad1c9@gmail.com>
Date: Tue, 21 Nov 2023 07:14:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Power save setting while interface is down
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <304ce305-fbe6-420e-ac2a-d61ae5e6ca1a@gmail.com>
 <87msv76vma.fsf@kernel.org>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <87msv76vma.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_071413_192464_B24990B6 
X-CRM114-Status: GOOD (  18.55  )
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

SGkgS2FsbGUsCgpPbiAxMS8yMS8yMyAwNjoxNSwgS2FsbGUgVmFsbyB3cm90ZToKPiBKYW1lcyBQ
cmVzdHdvb2QgPHByZXN0d29qQGdtYWlsLmNvbT4gd3JpdGVzOgo+Cj4+IEhpLAo+Pgo+PiBJJ3Zl
IG5vdGljZWQgYSBzb21ld2hhdCByYXJlIGJlaGF2aW9yICg8MSUgb2YgdGhlIHRpbWUpIHdoZXJl
IGJyaW5naW5nCj4+IGFuIGludGVyZmFjZSB1cCBmYWlscyBhZnRlciBkaXNhYmxpbmcgcG93ZXIg
c2F2ZS4gVGhpcyBpcyBkb25lIGJ5IElXRAo+PiB3aGVuIGEgdXNlci1vcHRpb24gaXMgZW5hYmxl
ZCwgYW5kIGZvbGxvd3MgYW4gaW50ZXJmYWNlCj4+IHJlbW92YWwvY3JlYXRpb24uIFRoZSBzZXF1
ZW5jZSBpczoKPj4KPj4gMS4gUmVtb3ZlIGRlZmF1bHQgaW50ZXJmYWNlCj4+Cj4+IDIuIENyZWF0
ZSBuZXcgaW50ZXJmYWNlCj4+Cj4+IDMuIERpc2FibGUgcG93ZXIgc2F2ZSBvbiBuZXcgaW50ZXJm
YWNlCj4+Cj4+IDQuIEJyaW5nIHVwIG5ldyBpbnRlcmZhY2UgKHJhcmVseSBmYWlscyB3aXRoIC0x
MTApLgo+Pgo+PiBpd2RbMTI4NjY0MV06IHNyYy9uZXRkZXYuYzpuZXRkZXZfZGlzYWJsZV9wc19j
YigpIERpc2FibGVkIHBvd2VyIHNhdmUKPj4gZm9yIGlmaW5kZXggNTQKPj4ga2VybmVsOiBhdGgx
MGtfcGNpIDAwMDA6MDI6MDAuMDogd21pIHNlcnZpY2UgcmVhZHkgZXZlbnQgbm90IHJlY2VpdmVk
Cj4+IGl3ZFsxMjg2NjQxXTogRXJyb3IgYnJpbmdpbmcgaW50ZXJmYWNlIDU0IHVwOiBDb25uZWN0
aW9uIHRpbWVkIG91dAo+PiBrZXJuZWw6IGF0aDEwa19wY2kgMDAwMDowMjowMC4wOiBDb3VsZCBu
b3QgaW5pdCBjb3JlOiAtMTEwCj4gU28gSSBndWVzcyB5b3UgaGF2ZSBhIHRlc3Qgc2V0dXAgdG8g
cmVwcm9kdWNlIHRoaXMgZWFzaWx5PyBIb3cgbG9uZyBkb2VzCj4gaXQgdGFrZSB0byBzZWUgdGhp
cz8KCkl0IHJlYWxseSBkZXBlbmRzLiBJIHdhcyBsZXR0aW5nIElXRCBkbyB0aGUgd29yayBhbmQg
d2FpdGluZyBleGNlc3NpdmVseSAKd2hpY2ggY291bGQgc29tZXRpbWVzIHRha2UgYW4gaG91ci4g
QnV0IEkgbWFuYWdlZCB0byBnZXQgaXQgdG8gaGFwcGVuIDIwIApzZWNvbmRzIGFwYXJ0IHVzaW5n
IGlwL2l3IGluIGEgbG9vcC4gT24gYXZlcmFnZSBpdCB1c3VhbGx5IGhhcHBlbnMgCndpdGhpbiA1
LTEwIG1pbnV0ZXMsIHNvbWV0aW1lcyBzb29uZXIuCgokIGRtZXNnIC0tZm9sbG93ICYgJCBmb3Ig
aSBpbiAkKHNlcSAxIDQwMDApOyBkbyBzdWRvIGlwIGxpbmsgc2V0IHdsYW4wIApkb3duOyBzdWRv
IGl3IGRldiB3bGFuMCBzZXQgcG93ZXJfc2F2ZSBvZmY7IHN1ZG8gaXAgbGluayBzZXQgd2xhbjAg
dXA7IGRvbmUKClsgODgyLjkyNzIxOF0gYXRoMTBrX3BjaSAwMDAwOjAyOjAwLjA6IHdtaSBzZXJ2
aWNlIHJlYWR5IGV2ZW50IG5vdCAKcmVjZWl2ZWQgUlRORVRMSU5LIGFuc3dlcnM6IENvbm5lY3Rp
b24gdGltZWQgb3V0IFsgODgzLjAxNjU1MF0gCmF0aDEwa19wY2kgMDAwMDowMjowMC4wOiBDb3Vs
ZCBub3QgaW5pdCBjb3JlOiAtMTEwIFsgOTA0LjQzNDkzMF0gCmF0aDEwa19wY2kgMDAwMDowMjow
MC4wOiB3bWkgc2VydmljZSByZWFkeSBldmVudCBub3QgcmVjZWl2ZWQgUlRORVRMSU5LIAphbnN3
ZXJzOiBDb25uZWN0aW9uIHRpbWVkIG91dCBbIDkwNC41MjQyODddIGF0aDEwa19wY2kgMDAwMDow
MjowMC4wOiAKQ291bGQgbm90IGluaXQgY29yZTogLTExMAoKPiBXaGF0IGhhcmR3YXJlIGFuZCBm
aXJtd2FyZSB2ZXJzaW9uIGFyZSB5b3UgdXNpbmc/ClvCoMKgwqAgNS42ODA5MDldIGF0aDEwa19w
Y2kgMDAwMDowMjowMC4wOiBxY2E2MTc0IGh3My4yIHRhcmdldCAweDA1MDMwMDAwIApjaGlwX2lk
IDB4MDAzNDBhZmYgc3ViIDFkYWM6MDI2MQpbwqDCoMKgIDUuNjgwOTIxXSBhdGgxMGtfcGNpIDAw
MDA6MDI6MDAuMDoga2NvbmZpZyBkZWJ1ZyAwIGRlYnVnZnMgMSAKdHJhY2luZyAxIGRmcyAwIHRl
c3Rtb2RlIDAKClvCoMKgwqAgNS42ODE2MDddIGF0aDEwa19wY2kgMDAwMDowMjowMC4wOiBmaXJt
d2FyZSB2ZXIgCldMQU4uUk0uNC40LjEtMDAzMDktIGFwaSA2IGZlYXR1cmVzIHdvd2xhbixpZ25v
cmUtb3RwLG1mcCBjcmMzMiAwNzkzYmNmMgoKSSd2ZSBzZWVuIHRoaXMgb24gMDAyNDEsIDAwMjg4
LCBhbmQgdGhlIGxhdGVzdCBmaXJtd2FyZSBhYm92ZS4KCj4+IEknbSB0aGlua2luZyBtYXliZSB0
aGVyZSBpcyBhIHJhY2UgYmV0d2VlbiBjcmVhdGluZyB0aGUgZnJlc2gKPj4gaW50ZXJmYWNlIGFu
ZCBkaXNhYmxpbmcgUFMsIHRoZW4gYnJpbmdpbmcgdGhlIGludGVyZmFjZSBiYWNrIHVwPwo+IFll
YWgsIGxvb2tzIGxpa2UgaXQuIElmIGl0J3MgcmVsYXRpdmVseSBlYXN5IGZvciB5b3UgdG8gcmVw
cm9kdWNlIHRoaXMKPiB5b3UgY291bGQgdHJ5IGFkZGluZyBkZWxheXMgdG8gc3VpdGFibGUgc3Bv
dHMgaW4gYXRoMTBrLiBUaGF0IG1pZ2h0IGJlCj4gZ2l2ZSBtb3JlIGlkZWFzIHdoZXJlIHRoZSBy
YWNlIGlzIGV4YWN0bHkuCgpPaywgSSBjYW4gYWRkIGEgZGVsYXkgYWhlYWQgb2YgdGhlIFdNSSBy
ZXF1ZXN0IHRoYXQncyB0aW1pbmcgb3V0IGFuZCBzZWUgCndoYXQgaGFwcGVucy4KCj4KPj4gU2V0
dGluZyBQUyBhZnRlciB0aGUgaW50ZXJmYWNlIGlzIHVwIChzbyBmYXIpIHNlZW1zIHRvIGJlIDEw
MCUKPj4gcmVsaWFibGUgYW5kIGhhdmUgbm90IHlldCBzZWVuIHRoaXMgYmVoYXZpb3IuIFJlZ2Fy
ZGxlc3Mgb2YgYW55IGtlcm5lbAo+PiBmaXhlcyBJJ2xsIG5lZWQgdG8gcmVvcmRlciB0aGUgY29t
bWFuZCBzZXF1ZW5jZSBpbiBJV0QgdG8gc3VwcG9ydAo+PiBleGlzdGluZyBrZXJuZWxzLCBidXQg
YmVmb3JlIEkgd29yayBhcm91bmQgdGhpcyBpc3N1ZSBJIHdhbnRlZCB0bwo+PiBwb2ludCBpdCBv
dXQgc28gaXRzIG5vdCBoaWRkZW4gZnJvbSB2aWV3Lgo+IFRvIG1lIHdvcmtpbmcgYXJvdW5kIHRo
aXMgaW4gdXNlciBzcGFjZSBkb2Vzbid0IHNvdW5kIGxpa2UgYSBnb29kIGlkZWEuCj4gSSB3b3Vs
ZCByYXRoZXIgaGF2ZSBhIHdvcmthcm91bmQgaW4gdGhlIGtlcm5lbCAoYnV0IG9idmlvdXNseSBJ
IGhvcGUgd2UKPiBjYW4gZmluZCBhIHByb3BlciBmaXgpLgoKWWVwLCB0b3RhbGx5IGFncmVlLgoK
VGhhbmtzLAoKSmFtZXMKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
