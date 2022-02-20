Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930AEC433F5
	for <ath10k@archiver.kernel.org>; Sun, 20 Feb 2022 00:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DkHIxhrmCJGikh4VJKu8a5ZNDOkhAl+atv0BUcbxc/o=; b=EELXdqKJW7+q4q
	QYEK9nEWb+AijYVPule6Q6nKbT/BOLRbvrPia5BLkDxE+zAdV5AVKrVesargh4XsWB5xcfaA0CUIR
	XE0k6KdKTTMNAzbqDGyKCXJFJNRWQARX7GRn9taTaUCjP41XxyKv+9tjS0iSLIyh5eXhbYsuXEA95
	7L/tInGxpnS6YED94u3Wsj1IuxjreXrOZTUqt1/KRazAxAO+IJ35nK/XxKiFdMNwT6aYWAjqvLCQr
	H2fnMF3LxB6SXTrJz+/IXDZbeKOS2Rloyvp9Utn0n8gQRca2ChouvaNP0GmtniURgGmkESL7Z1B9G
	pfxvmKTuvLVCQfgR4gqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLZkc-000NQP-Kc; Sun, 20 Feb 2022 00:06:54 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLZka-000NPl-53
 for ath10k@lists.infradead.org; Sun, 20 Feb 2022 00:06:53 +0000
Received: by mail-ej1-x630.google.com with SMTP id p14so23626883ejf.11
 for <ath10k@lists.infradead.org>; Sat, 19 Feb 2022 16:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pcPbZ4Y7nkN/KVf6ChGLbgkwUHsAyKaFKMSnoMGHWaU=;
 b=RHbo93tmj9QArlIDy0Vh7ROKOGku/PefJztW8/VWVCyv4ij8xJKg1T/PxErJFbUTuk
 oR+vISMTv6cLqItkfx/4hUSJqXqh815VViDyyKOhu0cFP2fej1EvOaTME0jY0CBKX8vV
 hOKip4bKHbRug0iA1iila9teDKnw/Vj9A1sGD6oahEoM2WtC+syCffOIdF171PUbt+LM
 x0YgNfPOKURngbBHh9FtjTP5bXsna6QdPDgJtOQDsF1ehBQ/esETXlm8sFeoH/VnbhmG
 FWujx1XMsvidQ4lqiRuWlZiUAEExPRHWY7ETRXmdkUpaJAaPXWlho/Wp2yVUzxh+f/cy
 POoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pcPbZ4Y7nkN/KVf6ChGLbgkwUHsAyKaFKMSnoMGHWaU=;
 b=3qr6NV1IWRSghmYf4m2ZRnPbMBc74xVHFBCzbrUsEclxC+cBXlE3fja3anvVe9GEpR
 sovcM5VpBx4JomYCUGdeE16tsYGJR8jbs47z0v/3ukGnYLc2W3JYjwMyc+usUg98/iuK
 KZ1ySikaxVFgb5bwhV76sUaEa8fHXLxXy4tx/0FGD+Pub5jVM2ZJnTpicgrMKOk3kmK0
 /9xLw6qmtmjKasbMZrHO7HhD+7mhzxFRESvD0fxSnX8ShWfyelt3xb4WxBrvCUTs4zl4
 DKL0byEyLfcHGENzCDUH1oiKfStQMTRHdcfM4VRgFiGN3Rketml29YNoow96kcHIeu0D
 eSgQ==
X-Gm-Message-State: AOAM531DJ0sij3/srfHWF+eiNwfGo78BD19KIUpJKOqmScCOr75oOsAl
 nJG2knPZtKdbUht/UrpNjiM=
X-Google-Smtp-Source: ABdhPJzbsHX1qa8iBKvHDwUUbBoeTgtEwBZteF3RLA5AJmbZ4Sxc/ki2FpS5n82lHOkOuCxk//MoQA==
X-Received: by 2002:a17:906:aed3:b0:6ce:372e:dc12 with SMTP id
 me19-20020a170906aed300b006ce372edc12mr10962710ejb.113.1645315609581; 
 Sat, 19 Feb 2022 16:06:49 -0800 (PST)
Received: from debian64.daheim (pd9e29b3d.dip0.t-ipconnect.de.
 [217.226.155.61])
 by smtp.gmail.com with ESMTPSA id go13sm3620789ejc.190.2022.02.19.16.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 16:06:49 -0800 (PST)
Received: from localhost.daheim ([127.0.0.1])
 by debian64.daheim with esmtp (Exim 4.95)
 (envelope-from <chunkeey@gmail.com>) id 1nLYnZ-00417w-45;
 Sun, 20 Feb 2022 01:06:48 +0100
Message-ID: <078ed972-edb9-5611-6757-a8a907b7a6b8@gmail.com>
Date: Sun, 20 Feb 2022 01:06:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [v2] ath10k-firmware: QCA9888 hw1.0: Add Linksys MR8300 V1.0
 specific BDFs
Content-Language: de-DE
To: Kalle Valo <kvalo@kernel.org>, Hans Geiblinger <cybrnook2002@yahoo.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
References: <836543238.4244780.1600533511769.ref@mail.yahoo.com>
 <836543238.4244780.1600533511769@mail.yahoo.com> <87mtjp9o58.fsf@kernel.org>
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <87mtjp9o58.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_160652_236203_24F5D2C2 
X-CRM114-Status: GOOD (  13.93  )
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

SGksCgpPbiAyMS8wMS8yMDIyIDE1OjA5LCBLYWxsZSBWYWxvIHdyb3RlOgo+IEhhbnMgR2VpYmxp
bmdlciA8Y3licm5vb2syMDAyQHlhaG9vLmNvbT4gd3JpdGVzOgo+IAo+PiBUaGUgc3VwcG9ydCBm
b3IgdGhpcyBkZXZpY2UgaXMgY3VycmVudGx5IGJlaW5nIGFkZGVkIGludG8gT3BlbldydC4gVGhp
cyBBUCByZXF1aXJlcwo+PiB0d28gc3BlY2lhbCBCREZzIHRvIGdldCB0aGUgV2ktRmkgUEhZcyB3
b3JraW5nIChjb3JyZWN0bHkpLgo+Pgo+Pgo+PiAqIGRlc2NyaXB0aW9uIGZvciB3aGF0IGhhcmR3
YXJlIHRoaXMgaXM6Cj4+ICDCoCDCoC0gaXQgaXMgYSBRQ0E5ODg4IGJhc2VkIHJhZGlvIHVzZWQg
Zm9yIDVHaHoKPj4KPj4KPj4gKiBvcmlnaW4gb2YgdGhlIGJvYXJkIGZpbGUKPj4gIMKgIMKgLSBi
b2FyZGRhdGEgZmlsZXMgd2VyZSB0YWtlbiBmcm9tIE9FTSBMaW5rc3lzIEZXX01SODMwMF8xLjEu
Ny4yMDEyODFfcHJvZC5pbWcKPj4KPj4KPj4gKiBpZHMgdG8gYmUgdXNlZCB3aXRoIHRoZSBib2Fy
ZCBmaWxlCj4+ICDCoCDCoC0gUUNBOTg4OCBodzEuMAo+PiAgwqAgwqAgwqArwqBidXM9cGNpLGJt
aS1jaGlwLWlkPTAsYm1pLWJvYXJkLWlkPTIzLHZhcmlhbnQ9bGlua3N5cy1tcjgzMDAtdjAtZmNj
Cj4+ICDCoCDCoCDCoE1ENTrCoDFmMjYzYzUyZTc4NjJiY2NhYjZmZDY1NTEwOTIwNzdjCj4+Cj4+
Cj4+ICogYXR0YWNoIHRoZSBhY3R1YWwgYm9hcmQgZmlsZQo+PiAgwqAgwqAtIFRoZSBuYW1lIG9m
IHRoZSBmaWxlcyBhcmUgZXF1YWwgdG8gdGhlIGlkIHN0cmluZyBpbiB0aGUKPj4gYm9hcmQtMi5i
aW4gKG1pbnVzIHRoZSAiLmJpbiIpCj4gCj4gVGhhbmtzLCBhZGRlZCB0byBRQ0E5OTg0L2h3MS4w
L2JvYXJkLTIuYmluOgoKT2guLi4gSSBqdXN0IG5vdGljZWQuIEkgdGhpbmsgdGhpcyBnb3QgbWlz
cGxhY2VkIGludG8KUUNBOTk4NCdzIGJvYXJkLTIuYmluLiBCdXQgdGhpcyB3YXMgZm9yIHRoZSBR
Q0E5ODg4KHYyKS4gOigKCldlbGwsIGF0IGxlYXN0IHRoZXJlIHNob3VsZG4ndCBiZSBhbnkgY29u
ZmxpY3RzLgpTaG91bGQgSSByZXNlbmQgdGhlIExpbmtzeXMgTVI4MzAwJ3MgYm9hcmQgZmlsZXMg
YW5kCmFkZCB0aGF0IGFzIGEgbm90ZSBmb3IgeW91ciBuZXh0IHJvdW5kPwoKKEJUVzogaG9wZSBs
aW51eC1maXJtd2FyZS5naXQgc3luY3MgdGhlbSB1cCBhbnl3YXkuKQoKQ2hlZXJzLApDaHJpc3Rp
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEw
ayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
