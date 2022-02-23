Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7596BC433F5
	for <ath10k@archiver.kernel.org>; Wed, 23 Feb 2022 12:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cffwjKOSCqqF3yiYTWfJRKKk1BjeJ3gDd3nilhzqQ+U=; b=A4j8jXmuwQKw22
	rHFmdYTu2IB7qyH55/z0g2NqMLabfrGDyFaGWv8BiBsJheSoIEk/HmSYgoMdqq3/BCH/GxCLRyTUV
	oawWiXjmHeNe+AV+fs0ujKqPQDsbPkvfpD4FAMS1CPT4RHPl048yDLwBKhcXTjFmXCzvSNQvYVfIV
	nu3Q9tFSlrDpREGHIfGvujGNccq0KcjGRxRUL9yNUd5LA6LzZNIPAk96FpZ4cukkQm4mu4172s+h6
	nLwmpXhog5vdsCdlxbGoygkG25OA9J8NnfKR+tcIhAIKJaYJYf5dIND+ueP/yJrX+I/O67a6Y7tk+
	u4bNS3OVt93xEUiHLiQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMqfA-00E92j-Dk; Wed, 23 Feb 2022 12:22:32 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMq85-00Dyf9-OM
 for ath10k@lists.infradead.org; Wed, 23 Feb 2022 11:48:23 +0000
Received: by mail-il1-x134.google.com with SMTP id w4so3930753ilj.5
 for <ath10k@lists.infradead.org>; Wed, 23 Feb 2022 03:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+nTmI/+28E4j0O3bjZQM1rXqMEHAW1ITZXntraScJE0=;
 b=miN/CakF4s7rMN2YWY9w8ZE8n1+0blY6GkSeQZ3lE6eupGx9XJcrlspGMCZZcOCCI4
 th3BijNkmbQUhievYm9Ye+fT1cBQduAToNQrSQyZ51Vm010iz2d1XbsdUzqVQWAb1fS6
 gcTViIElQfxGDXIJLWhxovASQLCAOCnkQaBR5E6kxz16+7/jjG4boOj/SjysaXxr8QxS
 okq7mBIZOx39RicxUPxWrDA+UYcCfs/b486YTBl61+nFiUCKeZc4X1sgYLbrLl4sQ/Il
 E5bVz3ICrHvgT2I7D3a7adVqIB9g1qJvFWxdZyfkmmENoAeYJ+eePfml3unkc7yDPjbm
 Ezuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+nTmI/+28E4j0O3bjZQM1rXqMEHAW1ITZXntraScJE0=;
 b=7hAcJg3fml0eAA85eL/NR2kYaekBfOzsPoLhB9Iq1tdISd89lIHWaDkGxQqV5C7MKi
 dffYt+aaTBwR9TpclXXklkWgclJlst4evS/26Bmcu0+9T8J2RfhvwN2SgzltF+FXh9fU
 nxkrw2I4ZyB4++gFqdwvYI5V/VVWLOJLFMFmHgIE228B6LKNRO8afzEpeBFNs1aaiRiz
 yM2IMmWu/DJneZuxPnWbLfh1m4Qlr/tVaFs1xRE0/d383O05x6KONgEmaTWOvVPn03JA
 4QialHu6Z8dEul0+M2hJIulBEoJ+bJOOaIK3odo5BBo3UgTXqRjTEudgSNSo5F8bpXRq
 pZ7w==
X-Gm-Message-State: AOAM533gcJ3fGE4nqO32ou7ZvpgrB3CHmXEZ3V82F5pA0g4udA2STBlh
 lNBDMOC3Mxccg06PxjeI9aS9dKFN65kbSA+yuXo=
X-Google-Smtp-Source: ABdhPJyWYThIa2FyL2PoxgRXYQaX16nylwKAWr1cPhhfZCros/JvuNYdTCFtHrpvvwHpdtVpflIJ1QVBp7wu4yBDlBo=
X-Received: by 2002:a92:c261:0:b0:2c2:70be:efc2 with SMTP id
 h1-20020a92c261000000b002c270beefc2mr4574473ild.46.1645616899849; Wed, 23 Feb
 2022 03:48:19 -0800 (PST)
MIME-Version: 1.0
References: <20220221122638.7971-1-franciman12@gmail.com>
 <e32de43c-e00a-5766-e988-fe192d36d719@quicinc.com>
In-Reply-To: <e32de43c-e00a-5766-e988-fe192d36d719@quicinc.com>
From: Francesco Magliocca <franciman12@gmail.com>
Date: Wed, 23 Feb 2022 12:48:36 +0100
Message-ID: <CAH4F6utmtAM3CzX2_Fbn94Sb-X8m0patPh8yWwbuBB0t1VYH=g@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: fix pointer arithmetic error in trace call
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k@lists.infradead.org, Dan Carpenter <dan.carpenter@oracle.com>, 
 rmanohar@qti.qualcomm.com, linux-wireless@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_034821_839320_7073C839 
X-CRM114-Status: GOOD (  30.38  )
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

Hi, I picked (void*) to be conformant with the other examples in htt_rx.c
For example at line 1431:
>    rxd = HTT_RX_BUF_TO_RX_DESC(hw,
>                    (void *)msdu->data - hw->rx_desc_ops->rx_desc_size);

But for me it is ok. Maybe we should fix all the occurrences of this kind.

Greetings,
FM

Il giorno mar 22 feb 2022 alle ore 21:52 Jeff Johnson
<quic_jjohnson@quicinc.com> ha scritto:
>
> On 2/21/2022 4:26 AM, Francesco Magliocca wrote:
> > Reading through the commit history, it looks like
> > there is no special need why we must skip the first 4 bytes
> > in this trace call:
> >
> > trace_ath10k_htt_rx_desc(ar, (void*)rx_desc + sizeof(u32),
> >                        hw->rx_desc_ops->rx_desc_size - sizeof(u32));
> >
> > found in the function ath10k_htt_rx_amsdu_pop in the file htt_rx.c
> >
> > i think the original author
> > (who is also the one who added rx_desc tracing capabilities
> > in a0883cf7e75a) just wanted to trace the rx_desc contents,
> > ignoring the fw_rx_desc_base info field
> > (which is the part being skipped over).
> > But the trace_ath10k_htt_rx_desc later added
> > don't care about skipping it, so it may be good
> > to uniform this call to the others in the file.
> > But this would change the output of the trace and
> > thus it may be a problem for tools that rely on it.
> > Therefore I propose until further discussion
> > to just keep it as it is and just fix the pointer arithmetic bug.
> >
> > Add missing void* cast to rx descriptor pointer in order to
> > properly skip the initial 4 bytes of the rx descriptor
> > when passing it to trace_ath10k_htt_rx_desc trace function.
> >
> > This fixes the pointer arithmetic error detected
> > by Dan Carpenter's static analysis tool.
> >
> > Fixes: 6bae9de622d3 ("ath10k: abstract htt_rx_desc structure")
> >
> > Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00157-QCARMSWPZ-1
> >
> > Signed-off-by: Francesco Magliocca <franciman12@gmail.com>
> > Link: https://lore.kernel.org/ath10k/20220201130900.GD22458@kili/
> > ---
> >   drivers/net/wireless/ath/ath10k/htt_rx.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> > index 9ad64ca84beb..e01efcd2ce06 100644
> > --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> > +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> > @@ -429,7 +429,7 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
> >                               RX_MSDU_END_INFO0_LAST_MSDU;
> >
> >               /* FIXME: why are we skipping the first part of the rx_desc? */
> > -             trace_ath10k_htt_rx_desc(ar, rx_desc + sizeof(u32),
> > +             trace_ath10k_htt_rx_desc(ar, (void*)rx_desc + sizeof(u32),
>
> since void pointer arithmetic is undefined in C99 would it be "better"
> to cast as u8 *? I realize that gcc has an extension to support this
> [1], but this usage will cause a warning when -Wpointer-arith is used.
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Pointer-Arith.html

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
