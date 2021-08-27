Return-Path: <SRS0=Z+PP=NS=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67781C432BE
	for <ath10k@archiver.kernel.org>; Fri, 27 Aug 2021 16:09:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FA9760E78
	for <ath10k@archiver.kernel.org>; Fri, 27 Aug 2021 16:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FA9760E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ojARPxSZaFgS2Cyq8K9di23rKlIp2Cr/k5k50rSG/IU=; b=b+Ekd7If6iXd3G
	GvhzTur6J2yXDEB+mmu02Xx5BxCtYW3RRwzihlh12/IozJK0ZK1L9poWKOnyWDUMNqJ/RQsT1Gn5k
	I3l+ahFMce9vI3EmMXhyV5PrEBeH4kmyllnNmZRwyV+g+CL16hO8H6ZRfI90J5cbmGOhJ7mfVh6eW
	CyYMc6Iuqu2m+QV0v0IYHn4aJGLnxzQ7bJlV3GgJUXIUtHwFW2ytBJ5qEq6uwWkZhGPU9Xs5Mw+Aq
	7Eyk9erKj7XA439r/SVi36LB80eWEy8bw3C7MJD0JHOwZtkE+qkBMqdf5SGk1op0Yi8xrBojGJGp8
	LfWNEDpAkf845wDtnSPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJeP7-00Cixt-4I; Fri, 27 Aug 2021 16:08:29 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJeP1-00Ciwh-GD
 for ath10k@lists.infradead.org; Fri, 27 Aug 2021 16:08:27 +0000
Received: by mail-pj1-x1032.google.com with SMTP id fs6so4848301pjb.4
 for <ath10k@lists.infradead.org>; Fri, 27 Aug 2021 09:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3BOREjcUGdekjt/HzJv8JPNZZV+WRxv1ga5r5CaLfMg=;
 b=LgSMkv8yRY6NcFjGg/J63Y2GpE2F2TGefzma4o9g5HEhtSAND6DhVddNHYYks45NsN
 vl/76kMWgkZPlkAHgvJTPVgljvSFRJ7Ui/2QED3sjgSLOAoCwiEAsmgZNMGT/LdlCbMz
 6XWQqYT5qF5nKBsTivPFzvO7iyOTn/hubgj2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3BOREjcUGdekjt/HzJv8JPNZZV+WRxv1ga5r5CaLfMg=;
 b=sfstJbba73P+3Ux4/CVzCG8ixyfjMxf3avUtqONELP/GT1OycGvBhKRlv4aKSclvN1
 kNNtbtAFuaF0LM1wzzqo2SuqGOEUNfaZBGxveAL6NtNs0RPjfnrMpvKub0E0teerjN8x
 ogWWB3qAyS26U4Lmus/DhsYYUNVVP2qifJ21GGjTzHJYgiQeBulNGSak7KbRt3JjfpHV
 FKM72GLrJk8eSJAnNvvgMLO/g25kq8ktcIPK+GleTjr1A0UWNyIg/Gv/Nti46nMHs4ek
 VgEilVhGGVTeZ8+hKELn+TnIEUzOmIPE3AvYLby47MWmSQ5Xhekh405S96eV8aVEqY9V
 B3yA==
X-Gm-Message-State: AOAM5300gs/q4yrOYIm1hoXiG64MDEV0oBEoZRo4MMHLd6EQ8GPowsDb
 u+X7DbhqxbA3E6APrIfA/l8vaQ==
X-Google-Smtp-Source: ABdhPJz9b21uTH+fuc32V76US0q/VM+qkB83+nJU8q4xHvgfI8nk8UEzE23GCJMggnW3rTr9tTvrxA==
X-Received: by 2002:a17:90b:357:: with SMTP id
 fh23mr8796487pjb.140.1630080502650; 
 Fri, 27 Aug 2021 09:08:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id h9sm13930821pjg.9.2021.08.27.09.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 09:08:21 -0700 (PDT)
Date: Fri, 27 Aug 2021 09:08:19 -0700
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
 bpf@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Keith Packard <keithp@keithp.com>, Dan Williams <dan.j.williams@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 clang-built-linux@googlegroups.com, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 2/5] treewide: Replace open-coded flex arrays in unions
Message-ID: <202108270906.7C85982525@keescook>
References: <20210826050458.1540622-1-keescook@chromium.org>
 <20210826050458.1540622-3-keescook@chromium.org>
 <20210826062452.jekmoo43f4xu5jxk@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210826062452.jekmoo43f4xu5jxk@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_090823_604661_24DE2436 
X-CRM114-Status: GOOD (  19.30  )
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

On Thu, Aug 26, 2021 at 08:24:52AM +0200, Marc Kleine-Budde wrote:
> On 25.08.2021 22:04:55, Kees Cook wrote:
> > In support of enabling -Warray-bounds and -Wzero-length-bounds and
> > correctly handling run-time memcpy() bounds checking, replace all
> > open-coded flexible arrays (i.e. 0-element arrays) in unions with the
> > flex_array() helper macro.
> > 
> > This fixes warnings such as:
> > 
> > fs/hpfs/anode.c: In function 'hpfs_add_sector_to_btree':
> > fs/hpfs/anode.c:209:27: warning: array subscript 0 is outside the bounds of an interior zero-length array 'struct bplus_internal_node[0]' [-Wzero-length-bounds]
> >   209 |    anode->btree.u.internal[0].down = cpu_to_le32(a);
> >       |    ~~~~~~~~~~~~~~~~~~~~~~~^~~
> > In file included from fs/hpfs/hpfs_fn.h:26,
> >                  from fs/hpfs/anode.c:10:
> > fs/hpfs/hpfs.h:412:32: note: while referencing 'internal'
> >   412 |     struct bplus_internal_node internal[0]; /* (internal) 2-word entries giving
> >       |                                ^~~~~~~~
> > 
> > drivers/net/can/usb/etas_es58x/es58x_fd.c: In function 'es58x_fd_tx_can_msg':
> > drivers/net/can/usb/etas_es58x/es58x_fd.c:360:35: warning: array subscript 65535 is outside the bounds of an interior zero-length array 'u8[0]' {aka 'unsigned char[]'} [-Wzero-length-bounds]
> >   360 |  tx_can_msg = (typeof(tx_can_msg))&es58x_fd_urb_cmd->raw_msg[msg_len];
> >       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > In file included from drivers/net/can/usb/etas_es58x/es58x_core.h:22,
> >                  from drivers/net/can/usb/etas_es58x/es58x_fd.c:17:
> > drivers/net/can/usb/etas_es58x/es58x_fd.h:231:6: note: while referencing 'raw_msg'
> >   231 |   u8 raw_msg[0];
> >       |      ^~~~~~~
> > 
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Ayush Sawal <ayush.sawal@chelsio.com>
> > Cc: Vinay Kumar Yadav <vinay.yadav@chelsio.com>
> > Cc: Rohit Maheshwari <rohitm@chelsio.com>
> > Cc: Herbert Xu <herbert@gondor.apana.org.au>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Kalle Valo <kvalo@codeaurora.org>
> > Cc: Jakub Kicinski <kuba@kernel.org>
> > Cc: Stanislaw Gruszka <stf_xl@wp.pl>
> > Cc: Luca Coelho <luciano.coelho@intel.com>
> > Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
> > Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> > Cc: Alexei Starovoitov <ast@kernel.org>
> > Cc: Daniel Borkmann <daniel@iogearbox.net>
> > Cc: Andrii Nakryiko <andrii@kernel.org>
> > Cc: Martin KaFai Lau <kafai@fb.com>
> > Cc: Song Liu <songliubraving@fb.com>
> > Cc: Yonghong Song <yhs@fb.com>
> > Cc: John Fastabend <john.fastabend@gmail.com>
> > Cc: KP Singh <kpsingh@kernel.org>
> > Cc: Johannes Berg <johannes.berg@intel.com>
> > Cc: Mordechay Goodstein <mordechay.goodstein@intel.com>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Wolfgang Grandegger <wg@grandegger.com>
> > Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> > Cc: Arunachalam Santhanam <arunachalam.santhanam@in.bosch.com>
> > Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > Cc: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
> > Cc: linux-crypto@vger.kernel.org
> > Cc: ath10k@lists.infradead.org
> > Cc: linux-wireless@vger.kernel.org
> > Cc: netdev@vger.kernel.org
> > Cc: linux-scsi@vger.kernel.org
> > Cc: linux-can@vger.kernel.org
> > Cc: bpf@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  drivers/net/can/usb/etas_es58x/es581_4.h          |  2 +-
> >  drivers/net/can/usb/etas_es58x/es58x_fd.h         |  2 +-
> 
> For the can drivers:
> 
> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>

Thanks!

> BTW: Is there opportunity for conversion, too?
> 
> | drivers/net/can/peak_canfd/peak_pciefd_main.c:146:32: warning: array of flexible structures

Oh, hrmpf. This isn't a sane use of flex arrays:


struct __packed pucan_rx_msg {
	...
	__le32	can_id;
	u8	d[];
};

struct pciefd_rx_dma {
        __le32 irq_status;
        __le32 sys_time_low;
        __le32 sys_time_high;
        struct pucan_rx_msg msg[];
} __packed __aligned(4);

I think that needs to be handled separately. How are you building to get
that warning, by the way? I haven't seen that in my builds...

-- 
Kees Cook

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
