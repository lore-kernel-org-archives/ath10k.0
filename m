Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99711C433F5
	for <ath10k@archiver.kernel.org>; Tue, 11 Jan 2022 00:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZV3H/nHUOTNTyIO+w0hBTZ2Lg/VLDdKurZgcH/hVvcg=; b=vmQOEfwgb/1dJi
	7CtTC/KzIKVVkuelB7kSAazkD6ZtQ9KFrYLE/jLTL7ei/5JU1bqCDsdYCG4N1dtz8Qpxydyky+pU4
	E0po0409HsPMXDRHAjT1OjwKRep2uSsIpHI90rRWJbSQqr5WV0eebD1xQb4I1qvH2FiNWk3dxsWnY
	Q1x/+2rnwBkjHzLxMkd8Sq8Nr1rMxofOljbogwmaK8DR5neIaj1B1h7W9Ncg5mczWhw+0O5Sc1sad
	ImaD3vBBpuDS4aswih7Hf8gC8rs1RAAGwCoDzq8ucvc2zg9VX2Odyjmpzt6UHONnPyQ+6V/ao695C
	E0olY+2TVuUAGNaN86LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n75Ni-00E8l4-Jh; Tue, 11 Jan 2022 00:51:22 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n75Nf-00E8k4-Pa
 for ath10k@lists.infradead.org; Tue, 11 Jan 2022 00:51:21 +0000
Received: by mail-qv1-xf30.google.com with SMTP id kl12so5028747qvb.5
 for <ath10k@lists.infradead.org>; Mon, 10 Jan 2022 16:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+sLp7uiXG6rPIwVr5Lx4s12bT/foyboWbp+QYVK4VYg=;
 b=CJoRpn+Ay1jfgcksIW/QFzjNCuOTQn5w0UmXNQKEHF46aqDBvyyvaPav8fHytmAJtB
 9pwzjPaUJ5qpvgt8GFPEY+GWgg0FPf303Ql3mVUL7iMQa3xU18kWdd1RMoVvxJqsqKJw
 1JPyiVa1Mkqa8ax5O3A9U7nrkDzKR6BwmqpzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+sLp7uiXG6rPIwVr5Lx4s12bT/foyboWbp+QYVK4VYg=;
 b=pc7JpUNWmRmyN6jXkFoRBim98IJ/pFBSL/ddHs5thHEV5X4Lko3PJH9ekLrRyY6Q/1
 bQRO4sQ+Kj3ZBZmniObBKJWHPFXgyTE9grRVgaOTufVv7Jx3s8mSCiKCA7LRvMRfpKgr
 bE36QszKEK6Dl+8+NECKYM16s7/BJnzbqxooE/11ampcinn0Tx/OaIepQ+VvPN9RUagg
 XX3twABI92ucFYnyAvg0vMSrjdIKyflcYQU85G24cMM8UltfSyKqFK0BX4KKQRKf65ec
 OoTZqiTQi5Fqkr1UAp2yIQIAILJU+h+or9YZzYQF/PZMyV1/OogEOhy+uBiQxGVMoXT1
 fxqg==
X-Gm-Message-State: AOAM5312ry6G4Y0mDBkQZsHX9C29PCMMeVtpent6VkvRO24w3SNOcTeB
 PHLg1JNkCnySgGyEybYLDLQmxgi7LWBLTQ==
X-Google-Smtp-Source: ABdhPJxcBlqyr5uP7uPpBBs9+lwVWxsE5ybpdYWU98m/Kz87cTeNsOU58Sa0gZQhGrXfDqlfptx39Q==
X-Received: by 2002:a05:6214:29e6:: with SMTP id
 jv6mr1904327qvb.68.1641862277648; 
 Mon, 10 Jan 2022 16:51:17 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181])
 by smtp.gmail.com with ESMTPSA id d15sm5380915qka.3.2022.01.10.16.51.17
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 16:51:17 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id i3so42833819ybh.11
 for <ath10k@lists.infradead.org>; Mon, 10 Jan 2022 16:51:17 -0800 (PST)
X-Received: by 2002:a25:d142:: with SMTP id i63mr3201948ybg.253.1641862276626; 
 Mon, 10 Jan 2022 16:51:16 -0800 (PST)
MIME-Version: 1.0
References: <20220110231255.v2.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
In-Reply-To: <20220110231255.v2.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 10 Jan 2022 16:51:04 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VVzQFK_PwnCXkJ6OK3DcgBnoxmvNG3WXFn30ncdY-E_w@mail.gmail.com>
Message-ID: <CAD=FV=VVzQFK_PwnCXkJ6OK3DcgBnoxmvNG3WXFn30ncdY-E_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ath10k: search for default BDF name provided in DT
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath10k <ath10k@lists.infradead.org>, 
 Rakesh Pillai <pillair@codeaurora.org>,
 linux-wireless <linux-wireless@vger.kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 netdev <netdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_165119_878611_7C386912 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Jan 10, 2022 at 3:15 PM Abhishek Kumar <kuabhs@chromium.org> wrote:
>
> +int ath10k_core_parse_default_bdf_dt(struct ath10k *ar)
> +{
> +       struct device_node *node;
> +       const char *board_name = NULL;
> +
> +       ar->id.default_bdf[0] = '\0';
> +
> +       node = ar->dev->of_node;
> +       if (!node)
> +               return -ENOENT;
> +
> +       of_property_read_string(node, "qcom,ath10k-default-bdf",
> +                               &board_name);
> +       if (!board_name)
> +               return -ENODATA;
> +
> +       if (strscpy(ar->id.default_bdf,
> +                   board_name, sizeof(ar->id.default_bdf)) < 0)
> +               ath10k_warn(ar,
> +                           "default board name is longer than allocated buffer, board_name: %s; allocated size: %ld\n",
> +                           board_name, sizeof(ar->id.default_bdf));

I suspect, but don't know for sure, that you're going to get another
builder splat here. Just like sizeof() isn't guaranteed to return an
"unsigned int", it's also not guaranteed to return an "unsigned long".
I believe you want %zu. See Documentation/core-api/printk-formats.rst

> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(ath10k_core_parse_default_bdf_dt);

Boy, that function seems like overkill for something that you need
once at init time. ...and I also suspect that the lifetime of the
string returned by of_property_read_string() is valid for as long as
your "of_node" is held and thus probably you could use it directly (it
likely has a longer lifetime than the location you're storing it).

...but I guess it matches the ath10k_core_check_dt() function above
it, so I guess it's fine?

-Doug

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
