Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4409FC433EF
	for <ath10k@archiver.kernel.org>; Wed, 27 Apr 2022 05:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0jttOIUoCMQ5lsx9XjIplg9iKFNq8a1Wf6X57kJZG6o=; b=EQ2NthAa2K2MTE
	FrILCvI/r9X+nkU4AwgOwbcmwio0gJitsbpxwLrhOer3MmfMCpu5KYTh1l86C1MY/jOMtsBNg+0j+
	r/O7wG79ky/fXuwT/rCYTSI7xKQXXhBNrF0OO0TStzCuB4e3VBRRB7t7+ErPPdv8vlIsvMlS0KiMk
	fipcTBR3SGaY9iF8AnxJgu4hZxJ359AWOzW6bZtq6sav6RSoTy9NUPS9wEFzh2KSAJT01NfaT4MaO
	X+X6n5s67NLYt3jh3tSYbnVAmFpmIDqHSN3EJzrY9HZ+Ov7PP33odoQOkYIlaHgEMDYv5HWAto4zk
	MoHnc5EBFfZrzullbg4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nja6W-00HSU7-T5; Wed, 27 Apr 2022 05:20:44 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nja6U-00HSSB-1g
 for ath10k@lists.infradead.org; Wed, 27 Apr 2022 05:20:43 +0000
Received: by mail-io1-xd2c.google.com with SMTP id e194so1479514iof.11
 for <ath10k@lists.infradead.org>; Tue, 26 Apr 2022 22:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iWO4Mspuj1NfsztZ/htvKaV2IwuMSQIdLcGu3cF8Od4=;
 b=LAveLaPAkwobxI2RuBJNilJKnbX2XKgLApjEquMlBS/UvoIN/9qxBt3vhewUmBv56x
 KE2L9cevl7O+cnyfshj0/9p9zQKEScaxxvr1QHchpU7rQPj9+tTMqDnU5ofETiDXHmD8
 iMUJOk60FQtBND6Lx5U7JP70EZ+4ypKXlSGMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iWO4Mspuj1NfsztZ/htvKaV2IwuMSQIdLcGu3cF8Od4=;
 b=ctjglk6LBBfY0eyiwXgZrUMzCW1rO4nRFl0TNPc3jtAxXhDHJAPS4WHdQJ9xjBrnhi
 EhkZC/+A2TMZeHezs9i8m7bUs4T2Yv7My2Ko/PYY8K9e18qPDfBGHXmS6F1vYYNrllxp
 RiplorINzYpRGpAzH9L/p94uBQ6C+FkjKkY5G/4DPBg3HbcQBvR3OCR7KS6FN5+xCQkZ
 25YWJ5w60XLB8bYhP9Qef2OTs3YVBeAPm8pPsfmohBynNhYTWJYs1SxFi25ydv/sj1mT
 7CYU8ienTNXvuVsFL7rvRKEAMjc8hBOygtM/RwYM3/vGZkIezcv+ek6V0Vz90VDxwi39
 RcfQ==
X-Gm-Message-State: AOAM533A4DOBMxqloDdiirPJQSpeIBD/pZ8l6e+e044yQ3ivJaHoe2sY
 cSs9KpNtQSPIgWXpoaznE28YsjLG5MrQFkBX+xG3CQ==
X-Google-Smtp-Source: ABdhPJxHWH/VmZfTUvM9ujXjTEU01KceOoaZNdOkUFInIFr9FVW1BkqTC5B6NSlGZgh0ev8kRRFVN+Ams+9EFezSwBY=
X-Received: by 2002:a05:6e02:1c0c:b0:2cc:1757:ebbe with SMTP id
 l12-20020a056e021c0c00b002cc1757ebbemr10000010ilh.205.1651036838034; Tue, 26
 Apr 2022 22:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220426221859.v2.1.I650b809482e1af8d0156ed88b5dc2677a0711d46@changeid>
 <CA+ASDXPNFwvYVBMHjbTNQ-uTnQrs5TvPAH2jXgPKuFLUw2GbZA@mail.gmail.com>
In-Reply-To: <CA+ASDXPNFwvYVBMHjbTNQ-uTnQrs5TvPAH2jXgPKuFLUw2GbZA@mail.gmail.com>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Tue, 26 Apr 2022 22:20:26 -0700
Message-ID: <CACTWRwtXSHnhxTEZ+pWWNpfd-BANtHuNUDimmwxJ=COL6HJQTA@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: skip ath10k_halt during suspend for driver
 state RESTARTING
To: Brian Norris <briannorris@chromium.org>
Cc: kvalo@kernel.org, quic_wgong@quicinc.com, 
 Linux Kernel <linux-kernel@vger.kernel.org>, 
 linux-wireless <linux-wireless@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>, 
 "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_222042_143098_8A950394 
X-CRM114-Status: GOOD (  17.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Tue, Apr 26, 2022 at 3:34 PM Brian Norris <briannorris@chromium.org> wrote:
>
> On Tue, Apr 26, 2022 at 3:20 PM Abhishek Kumar <kuabhs@chromium.org> wrote:
> >
> > Double free crash is observed when FW recovery(caused by wmi
> > timeout/crash) is followed by immediate suspend event. The FW recovery
> > is triggered by ath10k_core_restart() which calls driver clean up via
> > ath10k_halt(). When the suspend event occurs between the FW recovery,
> > the restart worker thread is put into frozen state until suspend completes.
> > The suspend event triggers ath10k_stop() which again triggers ath10k_halt()
> > The double invocation of ath10k_halt() causes ath10k_htt_rx_free() to be
> > called twice(Note: ath10k_htt_rx_alloc was not called by restart worker
> > thread because of its frozen state), causing the crash.
> ...
> > Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> > Co-developed-by: Wen Gong <quic_wgong@quicinc.com>
> > Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> > Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Fixed typo, replaced ath11k by ath10k in the comments.
> > - Adjusted the position of my S-O-B tag.
> > - Added the Tested-on tag.
>
> You could have retained my:
>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
>
> but no worries; it's just a few characters ;)
Oh! sorry about that, I was under the impression that if the next
iteration is posted, then I cannot just add the Reviewed-by tag
provided in the previous iteration by myself.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
