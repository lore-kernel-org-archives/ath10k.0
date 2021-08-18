Return-Path: <SRS0=bIdE=NJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 829DEC4320E
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 21:51:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49FCE610FE
	for <ath10k@archiver.kernel.org>; Wed, 18 Aug 2021 21:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 49FCE610FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xbEUHW3INWygpcWMU5havWv/pytAAZwOChjiWySe/M=; b=fD327SVfjrKMbo
	5DjbsShn/pNkKe7aDtDaWmHGvqD1CYHyYNo0R4t2U4uEF6TqiyGS35EiJ8r9A0s86UKNuLN6H/ifG
	dTRXj/ZvGCRjDuewrlZeM8qgFQLQXsrIwMUsFf2IH1XOZ4GFlGSQODudxSym/BN+oTSRUZ6g48YO8
	4s0W7LTfGgdmmw8TgTULHVG9tmqGucYfKMejU5tYj3/kMpO7hCMMy0Qswg9FYHJgIeUu/pxI3dqR0
	nUdGMJuFZ2xFa+KP8GmxSN4B7GguNwKjYT68nId426qlDpnc4VsRnal8+wxbjZRiJoSDMyUImmqqi
	VbWozM5ehEHnhL9bJcWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGTSs-006jKi-Fs; Wed, 18 Aug 2021 21:51:14 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGTSn-006jKF-Hi
 for ath10k@lists.infradead.org; Wed, 18 Aug 2021 21:51:13 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 cp15-20020a17090afb8fb029017891959dcbso9918217pjb.2
 for <ath10k@lists.infradead.org>; Wed, 18 Aug 2021 14:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7vHz7lx5HT3o9dUfiJevKg/RCUhyC9oP+KAo7KKSobE=;
 b=a0gIT1PbsUrzpiMxHFJQf3jDySrUQ8Ww2Lki+TjewXrAJP5UxO7103vV2RR/V3ANRN
 1nLuL/Iv5GOFWegVwgew6XfBqxD/P2xI/kCXdGtAH6LbMiGNGZJvf9jRwo8l9cGtJXp/
 NJhI01VKo66AWmiNMy8NublWXQfmYUotQ1JOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7vHz7lx5HT3o9dUfiJevKg/RCUhyC9oP+KAo7KKSobE=;
 b=IiEhNulZAAQXceZPknh4198x4zuEq5Qp8P4Jhg9XoIa8G/JbLOE4WRztebfpeH2JJD
 5eICiXfg9JfeyN/rgKhVkalsRVfQykB+q4953ZoIdvJpLlYvTYKPCUfKJ3l5/eAJ98Qu
 0DYNBQw4jlPRWwpCCuGM8JVOcShl/mxN2vq5I/nsFNoHm0gdNAGKOj9URwbrHzDHYJrd
 olRxZzxUrmb0upCUx93cQKmF04GUwJrGjRVqTrJbiEUCMNX8/kCpRQnzI/rS15BDe6Ts
 J+H8D4Z7+1CytuYOI8T0DyEctYY94gXGXwfqgufKA9yYxT/ymPImS607riFwFRS5Zlxp
 lnZQ==
X-Gm-Message-State: AOAM531UP5znKclFD114eGEIm04hrvfJGRIyOzXPOoH1tINDPcfLbTJ1
 Kb+lx78GNZKpyX8mXOv7GAWvyg==
X-Google-Smtp-Source: ABdhPJyzlA1BSNScs1NpCi0WnbTUY9sHZCG50/IaKrR4dcNnW411OdaQOYqLBK5zGkg4QWgJ9r2Cng==
X-Received: by 2002:a17:902:b601:b029:12b:d9a:894f with SMTP id
 b1-20020a170902b601b029012b0d9a894fmr9050350pls.63.1629323468448; 
 Wed, 18 Aug 2021 14:51:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b190sm808833pgc.91.2021.08.18.14.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:51:07 -0700 (PDT)
Date: Wed, 18 Aug 2021 14:51:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Ayush Sawal <ayush.sawal@chelsio.com>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Rohit Maheshwari <rohitm@chelsio.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Kalle Valo <kvalo@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>,
 Stanislaw Gruszka <stf_xl@wp.pl>, Luca Coelho <luciano.coelho@intel.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Johannes Berg <johannes.berg@intel.com>,
 Mordechay Goodstein <mordechay.goodstein@intel.com>,
 Lee Jones <lee.jones@linaro.org>, Wolfgang Grandegger <wg@grandegger.com>,
 Arunachalam Santhanam <arunachalam.santhanam@in.bosch.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 linux-crypto@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-can@vger.kernel.org,
 bpf@vger.kernel.org, clang-built-linux@googlegroups.com,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH 2/5] treewide: Replace open-coded flex arrays in unions
Message-ID: <202108181448.9C13CE9@keescook>
References: <20210818081118.1667663-1-keescook@chromium.org>
 <20210818081118.1667663-3-keescook@chromium.org>
 <20210818095635.tm42ctkm6aydjr6g@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210818095635.tm42ctkm6aydjr6g@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_145109_654417_8F2129EB 
X-CRM114-Status: GOOD (  14.07  )
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

On Wed, Aug 18, 2021 at 11:56:35AM +0200, Marc Kleine-Budde wrote:
> On 18.08.2021 01:11:15, Kees Cook wrote:
> > diff --git a/drivers/net/can/usb/etas_es58x/es581_4.h b/drivers/net/can/usb/etas_es58x/es581_4.h
> > index 4bc60a6df697..8657145dc2a9 100644
> > --- a/drivers/net/can/usb/etas_es58x/es581_4.h
> > +++ b/drivers/net/can/usb/etas_es58x/es581_4.h
> > @@ -192,7 +192,7 @@ struct es581_4_urb_cmd {
> >  		struct es581_4_rx_cmd_ret rx_cmd_ret;
> >  		__le64 timestamp;
> >  		u8 rx_cmd_ret_u8;
> > -		u8 raw_msg[0];
> > +		flex_array(u8 raw_msg);
> >  	} __packed;
> >  
> >  	__le16 reserved_for_crc16_do_not_use;
> > diff --git a/drivers/net/can/usb/etas_es58x/es58x_fd.h b/drivers/net/can/usb/etas_es58x/es58x_fd.h
> > index ee18a87e40c0..3053e0958132 100644
> > --- a/drivers/net/can/usb/etas_es58x/es58x_fd.h
> > +++ b/drivers/net/can/usb/etas_es58x/es58x_fd.h
> > @@ -228,7 +228,7 @@ struct es58x_fd_urb_cmd {
> >  		struct es58x_fd_tx_ack_msg tx_ack_msg;
> >  		__le64 timestamp;
> >  		__le32 rx_cmd_ret_le32;
> > -		u8 raw_msg[0];
> > +		flex_array(u8 raw_msg[]);
> >  	} __packed;
> 
> This doesn't look consistent, what's preferred?
> 
> u8 raw_msg[0];  -> flex_array(u8 raw_msg);
>  - or-
>                 -> flex_array(u8 raw_msg[]);

Eek, thanks for catching that. And this helps me realize that having
"flex_array" and "[]" is redundant, and the above typo would have been
caught. I will fix this for v2.

Thanks!

-Kees

-- 
Kees Cook

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
