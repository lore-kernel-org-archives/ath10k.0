Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF607C433EF
	for <ath10k@archiver.kernel.org>; Thu, 23 Dec 2021 12:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LfgtZB4NAv4W3ktsUGlFlocx9huNQqfgrpg+BZPGhJo=; b=paZl/smelUWyZz
	VN46yotyKeurM4+BWmsIZDkEZ9v6NqR5NbzhcCrrrML1YwcrWk2Wz7yA7uYacDkdXARy9AFFwLjXF
	UqeULmdhxchoZ+liEobcaAn7yrP/8f4IBg/sJ8tOGOl++3zFyXIBHUdGNu2VXV8R/jEwsaDRzYhiZ
	ZYiPr0H2WFA1jurnpZZYbuNl4ekeRHyQD1Y3WxzmBlPyPAqR3P5ZK6SXrOYp+HgdmJxVynet7v0kS
	TBcHfhC/7JLEhEKXTcpbsP3eO5fNnUUJqaSUjd1Zz62MufrZvBKo/dScZmMPaueM6vvrjvMpyNd+S
	OLHbINug+5WtmTMXXg0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0N7b-00Cgqi-1l; Thu, 23 Dec 2021 12:22:59 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0N7X-00Cgpu-IE
 for ath10k@lists.infradead.org; Thu, 23 Dec 2021 12:22:57 +0000
Received: by mail-il1-x133.google.com with SMTP id q6so4097126ilt.6
 for <ath10k@lists.infradead.org>; Thu, 23 Dec 2021 04:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oM6MaUkmGCWK/nE5Zly668nWRNW8HC6Iu4witE8kZKg=;
 b=ZUqcYTanj8hxfE5cWOIcJ63VdqDKeTZRJL6fGQOX/ZPvG6XkInCfHUhKsqz8MCnfB0
 SnYp8d/+kEI94y65U6eulRrSGLv9n45/u8+OWRu7/AfR01sMtRjp1JgovMjXxrsPitC7
 96XSpVki0XRQpbFwTfJfHn5iXS0OY/H0wEuDpd0Irwgv6oNdsNtEbiLs9BrekJxBufva
 zuRyHc0alNLR1A5gvugMmobfsmo75pWGoPVkrqkKJn1fuFpVhkM984IpUFoy1p8US1Pq
 mH0I1kWSJE8rB29gJFa8sVyAsal8wDYCsABpEHehHT38E20INbRl8zoJauyKLPOZgGNC
 lNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oM6MaUkmGCWK/nE5Zly668nWRNW8HC6Iu4witE8kZKg=;
 b=a/EQGhiYbcZKX6osKFkdndoiBk7Lhloa6UI5wwr7PWSCvhx3qMRRODfvAH+wAr7mFa
 tl0S0/MB3uE+7D6DJ08bSX6cVQzZfCoWF8sdLpoZaXDp6SrAhAtNCAhlroCB2NWsaFT4
 SHM2vG/K1NRTaubacoj/loWYyPVF45AfQhOaw8z+X1SpC5g45NlnncVv6P8IJG7Rz+UY
 2uGsjigp7kQq0fsrPTmF7e/D7/+of5xkEIUas0IRal62zYnpBtjdAL+IEsOy7ZmQ5rAl
 K5uws/GwIaqqJBNNbw2UEFjxTCsGBM0KqCvN9j4kOQgaEJV+Dy1HA2K8Y2n0eHeDHMD+
 qQ/g==
X-Gm-Message-State: AOAM530sZrNihdOGZ/UmemqTBROSybKAg6fSgc6ruTQmisaxux4T5Rz1
 xzH5TKVsaH6xZNclhZQacTRsfigdhV9oxMbMV8o=
X-Google-Smtp-Source: ABdhPJzBbwUCcsVQnILfCSxJo4blBinSkUioh6bxDCkGLMjyWdNHgwgLZUyuF1s/apK3RboTNKLyv/HRpYW/xPbBoc8=
X-Received: by 2002:a92:6406:: with SMTP id y6mr840749ilb.179.1640262173675;
 Thu, 23 Dec 2021 04:22:53 -0800 (PST)
MIME-Version: 1.0
References: <20211216151823.68878-1-franciman12@gmail.com>
 <87bl192hxl.fsf@kernel.org>
In-Reply-To: <87bl192hxl.fsf@kernel.org>
From: Francesco Magliocca <franciman12@gmail.com>
Date: Thu, 23 Dec 2021 13:23:48 +0100
Message-ID: <CAH4F6uuC=iQs-oOkor8naLGdb0DAbi=2zKLfh80_ufea4WQ0QA@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: abstract htt_rx_desc structure
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 Enrico Lumetti <enrico@fracta.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_042255_641689_3EB08E4F 
X-CRM114-Status: GOOD (  34.85  )
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

> > --- a/drivers/net/wireless/ath/ath10k/core.c
> > +++ b/drivers/net/wireless/ath/ath10k/core.c
> > @@ -75,6 +75,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
> >                       .board_size = QCA988X_BOARD_DATA_SZ,
> >                       .board_ext_size = QCA988X_BOARD_EXT_DATA_SZ,
> >               },
> > +             .rx_desc_ops = &qca988x_rx_desc_ops,
> >               .hw_ops = &qca988x_ops,

> Any particular reason why you didn't use the existing hw_ops?

I didn't use the hw_ops, because while the preWCN3990 cards have
different hw_ops implementations,
they all share the same rx_desc (i tried having a dedicated rx_desc
for each card, but this made the firmware seldom crash,
while the current memory layout seems to be the most stable) so having
a separate rx_desc_ops requires the least number of changes.

> This looks, but I did some changes in the pending branch. Please check
> my changes:

> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=c9a516b946c4b3ce25d422890ca78d0ca730b065

> Below are my comments.

Woops, I apologise for the typos and extra whitespaces, I thought I
had gotten rid of them all.

Anyways, everything looks good to me.

I was a bit worried about performance regression due to the
introduction of getters and setters
for accessing the rx descriptor, but so far it seems to consistently
work fine. I cannot test on the WCN3990 unfortunately,
where we also pay for the further indirection due to function pointers.

Il giorno mer 22 dic 2021 alle ore 08:54 Kalle Valo <kvalo@kernel.org>
ha scritto:
>
> Francesco Magliocca <franciman12@gmail.com> writes:
>
> > QCA6174 card often hangs with the current htt_rx_desc
> > memory layout in some circumstances, because its firmware
> > fails to handle length differences.
> > Therefore we must abstract the htt_rx_desc structure
> > and operations on it, to allow different wireless cards
> > to use different, unrelated rx descriptor structures.
> >
> > Define a base htt_rx_desc structure and htt_rx_desc_qca_old
> > for use with the QCA family of ath10k supported cards
> > and htt_rx_desc_new for use with the WCN3990 card.
> >
> > Define htt_rx_desc_ops which contains the abstract operations
> > to access the generic htt_rx_desc, give implementations
> > for each card and update htt_rx.c to use the defined
> > abstract interface to rx descriptors.
> >
> > Fixes: e3def6f7ddf8 ("ath10k: Update rx descriptor for WCN3990 target")
> >
> > Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00157-QCARMSWPZ-1
> >
> > Co-developed-by: Enrico Lumetti <enrico@fracta.dev>
> > Signed-off-by: Enrico Lumetti <enrico@fracta.dev>
> > Signed-off-by: Francesco Magliocca <franciman12@gmail.com>
> > Link: https://lore.kernel.org/ath10k/CAH4F6usFu8-A6k5Z7rU9__iENcSC6Zr-NtRhh_aypR74UvN1uQ@mail.gmail.com/
>
> This looks, but I did some changes in the pending branch. Please check
> my changes:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=c9a516b946c4b3ce25d422890ca78d0ca730b065
>
> Below are my comments.
>
> drivers/net/wireless/ath/ath10k/htt.c:141: line length of 98 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/htt.c:149: line length of 98 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/htt_rx.c:374: line length of 91 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/htt_rx.c:1098: line length of 98 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/htt_rx.c:1234: line length of 98 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/htt_rx.c:1261: line length of 93 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/htt_rx.c:1417: line length of 92 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/htt_rx.c:1553: line length of 92 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/htt_rx.c:1600: line length of 92 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/htt_rx.c:1654: line length of 92 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/htt_rx.c:1710: line length of 92 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/htt_rx.c:1753: line length of 92 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/htt_rx.c:1788: line length of 91 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/htt_rx.c:1814: line length of 91 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/htt_rx.c:1930: line length of 93 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/htt_rx.c:1962: line length of 92 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/htt_rx.c:2172: line length of 93 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/htt_rx.c:2211: line length of 93 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/htt_rx.c:3139: line length of 100 exceeds 90 columns
> drivers/net/wireless/ath/ath10k/htt_rx.c:3148: line length of 92 exceeds 90 columns
>
> ath10k-check warned about long lines, so I fixed those.
>
> > --- a/drivers/net/wireless/ath/ath10k/core.c
> > +++ b/drivers/net/wireless/ath/ath10k/core.c
> > @@ -75,6 +75,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
> >                       .board_size = QCA988X_BOARD_DATA_SZ,
> >                       .board_ext_size = QCA988X_BOARD_EXT_DATA_SZ,
> >               },
> > +             .rx_desc_ops = &qca988x_rx_desc_ops,
> >               .hw_ops = &qca988x_ops,
>
> Any particular reason why you didn't use the existing hw_ops?
>
> > +static void ath10k_rx_desc_wcn3990_get_offsets(struct htt_rx_ring_rx_desc_offsets *off)
> > +{
> > +#define desc_offset(x) (offsetof(struct htt_rx_desc_new, x) / 4)
> > +     off->mac80211_hdr_offset = __cpu_to_le16(desc_offset(rx_hdr_status));
> > +     off->msdu_payload_offset = __cpu_to_le16(desc_offset(msdu_payload));
> > +     off->ppdu_start_offset = __cpu_to_le16(desc_offset(ppdu_start));
> > +     off->ppdu_end_offset = __cpu_to_le16(desc_offset(ppdu_end));
> > +     off->mpdu_start_offset = __cpu_to_le16(desc_offset(mpdu_start));
> > +     off->mpdu_end_offset = __cpu_to_le16(desc_offset(mpdu_end));
> > +     off->msdu_start_offset = __cpu_to_le16(desc_offset(msdu_start));
> > +     off->msdu_end_offset = __cpu_to_le16(desc_offset(msdu_end));
> > +     off->rx_attention_offset = __cpu_to_le16(desc_offset(attention));
> > +     off->frag_info_offset = __cpu_to_le16(desc_offset(frag_info));
> > +#undef desc_metadata_offset
> > +#undef metadata_offset
>
> I couldn't find these two defined anywhere so removed the undefs.
>
> > +/* rx descriptor for wcn3990 and possibly extensible for newer cards
> > + * Buffers like this are placed on the rx ring.
> > + */
> > +struct htt_rx_desc_new {
> > +     struct htt_rx_desc base;
> >       struct {
> >               struct rx_attention attention;
> >               struct rx_frag_info frag_info;
> > @@ -2210,6 +2221,240 @@ struct htt_rx_desc {
> >       u8 msdu_payload[];
> >  };
>
> Using old and new is not a good idea when versioning something because
> when a third one is added the naming will be hard. So I renamed old to
> v1 and new to v2 everywhere in the patch.
>
> > +extern const struct ath10k_htt_rx_desc_ops qca988x_rx_desc_ops;
> > +extern const struct ath10k_htt_rx_desc_ops qca99x0_rx_desc_ops;
> > +extern const struct ath10k_htt_rx_desc_ops wcn3990_rx_desc_ops;
>
> These should be use "ath10k_" prefix, but forgot to change that. Will do
> it later.
>
> > +static inline struct rx_msdu_end_common      *
> > +ath10k_htt_rx_desc_get_msdu_end(struct ath10k_hw_params      *hw, struct htt_rx_desc *rxd)
>
> Are there extra space before '*'? Need to check that.
>
> > +static inline struct rx_ppdu_end_common      *
> > +ath10k_htt_rx_desc_get_ppdu_end(struct ath10k_hw_params      *hw, struct htt_rx_desc *rxd)
>
> Extra spaces?
>
> >  static struct ieee80211_channel *
> >  ath10k_htt_rx_h_peer_channel(struct ath10k *ar, struct htt_rx_desc *rxd)
> >  {
> > +     struct ath10k_hw_params *hw = &ar->hw_params;
> > +     struct rx_attention *rxd_attention = ath10k_htt_rx_desc_get_attention(hw, rxd);
> > +     struct rx_msdu_end_common *rxd_msdu_end_common = ath10k_htt_rx_desc_get_msdu_end(hw, rxd);
> > +     struct rx_mpdu_start *rxd_mpdu_start = ath10k_htt_rx_desc_get_mpdu_start(hw, rxd);
> >       struct ath10k_peer *peer;
> >       struct ath10k_vif *arvif;
> >       struct cfg80211_chan_def def;
> > @@ -1069,15 +1107,15 @@ ath10k_htt_rx_h_peer_channel(struct ath10k *ar, struct htt_rx_desc *rxd)
> >       if (!rxd)
> >               return NULL;
>
> Here I moved the variable initialisation after the rxd null check to
> avoid null pointer issues and also reduce long lines.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
