Return-Path: <SRS0=CzWf=F2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED65C433DB
	for <ath10k@archiver.kernel.org>; Tue, 22 Dec 2020 18:27:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AB1F22527
	for <ath10k@archiver.kernel.org>; Tue, 22 Dec 2020 18:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AB1F22527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TbwZoZ6NIbkQ//OLUE5JQUYuFHoe9xoh4HAfotoKbHc=; b=rIgUZYSLKf5YaWZxvr/CmvuvI
	CALjRExiQBfSOgjZabM298Wf5ZuR6FResqwjC3+SqlUZ3ZP0piIol58zE4T05LFzrtUySjJbl5Xmv
	VcPQBIGlGXgxrHO/jtiIq39ifNfXXwnkNthLK66Sv8VZOLPJlNq6hmmkFPDZRlrz2VCNklWSxTEJz
	v+AmvoV7ULM74kn8e6+RoTsaoDjYxk1j4mCRGcpQoQ8t7dBzFYxM2bKUFwmPqCavX953pDzucIsQy
	tA5fYWMnjWwuA7Hdcpa6gg8ZtSevYJMy8dmznfqsZINmBVqSscI5IHuyCX+v51HkrSoG2OwSWD6D5
	ziH41IfZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krmNH-0003DT-QZ; Tue, 22 Dec 2020 18:27:07 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krmNF-0003D1-C1
 for ath10k@lists.infradead.org; Tue, 22 Dec 2020 18:27:06 +0000
Received: by mail-oi1-x229.google.com with SMTP id s75so15710916oih.1
 for <ath10k@lists.infradead.org>; Tue, 22 Dec 2020 10:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v2yaYNLY/2Egp8td6IEyrDogvPXVN2oX1ZgCRI1aJpw=;
 b=UyGc2LXc1kA1vAINEbUyBtkq1liuLGnZGnHW8D8jjlkmywJAJh4v+aH8SEnvo9If6B
 2nb/wstlewkXJfht1E4j7JmQCmtHb94H5mFrf1XjmBojLoHwdiAPzF4uPrmGE419H/nt
 gYaH2fjep7r/3WPOq1NRTfKZI8EuFExBgDc68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v2yaYNLY/2Egp8td6IEyrDogvPXVN2oX1ZgCRI1aJpw=;
 b=nUn0fir/LHFi58ORnmISyedcEnZGCyNGnnMcCcFkBAs9mX2MHlg+ecRnzuBX25uHM4
 aFwpZ3V/ao1KpZMZLj5RBERiFy4f9vVhagJvHA4xFMDgGgMVpTZkxYPn48/ZLR+BEe/o
 ylKzFvLOEEz1QUdmv4l69Yn2lIk63A3x22FJdNsnIgHxMbvlqMWFNwn5iDwMCWUEB+13
 1f2lS5RGBEnwj2gSTtPzTpRQcOOdcvH+oH9NZxR/YEcBL3jwiWRvf+Em8K2rPQGXLyyB
 znAiS9m2jdTroxE0Q/wAfqLJq0mTDE8Q0fXgCmpQLcHkQFeiZqV8tB8GE+/ZfvFharoh
 FTtA==
X-Gm-Message-State: AOAM533067lQVacv32/8/EaysMc+Um7PezjYKda9y5IkhGF/gvWV5ey7
 3xD5awUk5HYpmIrolkIUgbWsygAUHbIw1w==
X-Google-Smtp-Source: ABdhPJzSM2HVrfiSxCzDFGOOhqKdBJ//rO8mK/KrJ8sBUfyYdmrtF5N2STZ/89QzlONPhbKPUsOfeg==
X-Received: by 2002:aca:fd91:: with SMTP id b139mr14797306oii.67.1608661622469; 
 Tue, 22 Dec 2020 10:27:02 -0800 (PST)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com.
 [209.85.210.48])
 by smtp.gmail.com with ESMTPSA id 39sm4624306otu.6.2020.12.22.10.27.01
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 10:27:01 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id i6so12797468otr.2
 for <ath10k@lists.infradead.org>; Tue, 22 Dec 2020 10:27:01 -0800 (PST)
X-Received: by 2002:a05:6830:1c2d:: with SMTP id
 f13mr16902484ote.365.1608661620897; 
 Tue, 22 Dec 2020 10:27:00 -0800 (PST)
MIME-Version: 1.0
References: <1608618887-8857-1-git-send-email-miaoqing@codeaurora.org>
In-Reply-To: <1608618887-8857-1-git-send-email-miaoqing@codeaurora.org>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 22 Dec 2020 10:26:47 -0800
X-Gmail-Original-Message-ID: <CA+ASDXNvQ1-0-OvwPGKroUf+9chG3G3nuoiOS7W12Tp-F1T-3Q@mail.gmail.com>
Message-ID: <CA+ASDXNvQ1-0-OvwPGKroUf+9chG3G3nuoiOS7W12Tp-F1T-3Q@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: fix wmi mgmt tx queue full due to race
 condition
To: Miaoqing Pan <miaoqing@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_132705_453436_F3016ABF 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBEZWMgMjEsIDIwMjAgYXQgMTA6MzQgUE0gTWlhb3FpbmcgUGFuIDxtaWFvcWluZ0Bj
b2RlYXVyb3JhLm9yZz4gd3JvdGU6Cj4KPiBGYWlsZWQgdG8gdHJhbnNtaXQgd21pIG1hbmFnZW1l
bnQgZnJhbWVzOgo+Cj4gWzg0OTc3Ljg0MDg5NF0gYXRoMTBrX3Nub2MgYTAwMDAwMC53aWZpOiB3
bWkgbWdtdCB0eCBxdWV1ZSBpcyBmdWxsCj4gWzg0OTc3Ljg0MDkxM10gYXRoMTBrX3Nub2MgYTAw
MDAwMC53aWZpOiBmYWlsZWQgdG8gdHJhbnNtaXQgcGFja2V0LCBkcm9wcGluZzogLTI4Cj4gWzg0
OTc3Ljg0MDkyNF0gYXRoMTBrX3Nub2MgYTAwMDAwMC53aWZpOiBmYWlsZWQgdG8gc3VibWl0IGZy
YW1lOiAtMjgKPiBbODQ5NzcuODQwOTMyXSBhdGgxMGtfc25vYyBhMDAwMDAwLndpZmk6IGZhaWxl
ZCB0byB0cmFuc21pdCBmcmFtZTogLTI4Cj4KPiBUaGlzIGlzc3VlIGlzIGNhdXNlZCBieSByYWNl
IGNvbmRpdGlvbiBiZXR3ZWVuIHNrYl9kZXF1ZXVlIGFuZAo+IF9fc2tiX3F1ZXVlX3RhaWwuIFRo
ZSBxdWV1ZSBvZiDigJh3bWlfbWdtdF90eF9xdWV1ZeKAmSBpcyBwcm90ZWN0ZWQgYnkgYQo+IGRp
ZmZlcmVudCBsb2NrOiBhci0+ZGF0YV9sb2NrIHZzIGxpc3QtPmxvY2ssIHRoZSByZXN1bHQgaXMg
bm8gcHJvdGVjdGlvbi4KClJldmlld2VkLWJ5OiBCcmlhbiBOb3JyaXMgPGJyaWFubm9ycmlzQGNo
cm9taXVtLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
