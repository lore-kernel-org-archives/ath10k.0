Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2E4C433F5
	for <ath10k@archiver.kernel.org>; Wed, 27 Apr 2022 20:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R4Qo4jxw8ySI7BqdmC5gNhZ8cPF4LYzgYpl/xEQSnG0=; b=FUrR7w3n3wfRF3
	aYoeGqscxGwElUPEFvCIr/ouvCieRsPN7RLnoamDuiod9tohAHJm+7banIldDUV6+/MY99D2yMDbx
	LlpveIUiBpbfSBsR0MnPHk8MzATag/qZuO2ba112wBmH28GyAgZV5Li73FosnDDrkR8ECeFsVjybQ
	DIoFecB30VwPcyi2MQxYbfpxTJmY2/8M8g1/eNYpA0YIzxUvO9ejJzpiuvNAzxpuAac3XcdFsbHXU
	CqNEM5PHODTcteeaYJpVMRVJj/JccCmcKhh57Q6TSmYWSizzm6MiEeg3AAxR+5KoxdJ5IwZ3BuIGX
	SrrwNhdGmxWm74IWBzbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njoGW-003WIg-5n; Wed, 27 Apr 2022 20:28:00 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njoGT-003WI1-7w
 for ath10k@lists.infradead.org; Wed, 27 Apr 2022 20:27:58 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id
 b26-20020a4aba1a000000b0035e9a8d3bc9so462634oop.0
 for <ath10k@lists.infradead.org>; Wed, 27 Apr 2022 13:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gp/F1d/4pAenz5mNMTTask9wErh38GRFBpgSf17aNWY=;
 b=Y0AbeCNkAgs0mjiUiyGZ/engX4b8WVlc02Y2wUD0hDGZhyPfy6Xt5PelzXLROAIYMY
 eVpRZE834J9mmhPAjJ299MhHB3z/7Wuo1ma5GxgdRNqWE05oroUNUajPWkOIKCBk3FO8
 JUCvvnkFoHNwWAF74dhzq6T0KmyitBNxK07d8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gp/F1d/4pAenz5mNMTTask9wErh38GRFBpgSf17aNWY=;
 b=01TOVEQxFtN7Kpog3obUuUW0R8HFCqO9YDQHY+tMa8gduq6MBExOGFjcMMVXZcf+JX
 j7MNU1ASpC0otCtrAzVPkGVA/LDS6Ye7+kudymVd5yS/ms2ukUg8j32TnZoKsC9bnQTh
 RmDMuH3c60bfL4XvAktFONr+5/BbMwNTlit7RsE2Bg4tFoGr6nmGYYkO10h9iCaAMUyn
 VPbNiGjZek7ZDcivhErUzA0k7RNDg4vGrc6xAoh6eIk4Ca597M6Z9GwQ1C9Toff729MO
 0xtLa5cTtgxZfOSmmWazKg/4hb4sAuJBcdu/0BH0Pkwxl/yFLPOW+QLFp6RyJQ5RgybI
 B5Dw==
X-Gm-Message-State: AOAM532di4EEdmaeD59r6JdZA9zptDU2O0kVIFeO/U2pMRnj04AENmbQ
 rvIpA9fFm81rVTT0DiJGK5zvox8MQHAeGw==
X-Google-Smtp-Source: ABdhPJzhNHvTqEcNIj91p6rGpnHmqtuqD0GmrQ78vHdeGiVS5N0TTEQZQ12nsjpTl+4X0fGzlgm46A==
X-Received: by 2002:a05:6820:1889:b0:35e:9aea:906a with SMTP id
 bm9-20020a056820188900b0035e9aea906amr1484860oob.3.1651091274425; 
 Wed, 27 Apr 2022 13:27:54 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com.
 [209.85.210.54]) by smtp.gmail.com with ESMTPSA id
 t28-20020a056808159c00b00325361c4fbesm3508611oiw.5.2022.04.27.13.27.52
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 13:27:52 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id
 88-20020a9d0ee1000000b005d0ae4e126fso1844683otj.5
 for <ath10k@lists.infradead.org>; Wed, 27 Apr 2022 13:27:52 -0700 (PDT)
X-Received: by 2002:a9d:58c3:0:b0:605:9fa7:f5b6 with SMTP id
 s3-20020a9d58c3000000b006059fa7f5b6mr7777249oth.230.1651091272112; Wed, 27
 Apr 2022 13:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220426221859.v2.1.I650b809482e1af8d0156ed88b5dc2677a0711d46@changeid>
 <CA+ASDXPNFwvYVBMHjbTNQ-uTnQrs5TvPAH2jXgPKuFLUw2GbZA@mail.gmail.com>
 <CACTWRwtXSHnhxTEZ+pWWNpfd-BANtHuNUDimmwxJ=COL6HJQTA@mail.gmail.com>
In-Reply-To: <CACTWRwtXSHnhxTEZ+pWWNpfd-BANtHuNUDimmwxJ=COL6HJQTA@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Wed, 27 Apr 2022 13:27:40 -0700
X-Gmail-Original-Message-ID: <CA+ASDXNLnb4OEZtFVb4D64QNkK=sGYUUVuZPwO1-zOOD0hfqyg@mail.gmail.com>
Message-ID: <CA+ASDXNLnb4OEZtFVb4D64QNkK=sGYUUVuZPwO1-zOOD0hfqyg@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: skip ath10k_halt during suspend for driver
 state RESTARTING
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: kvalo@kernel.org, quic_wgong@quicinc.com, 
 Linux Kernel <linux-kernel@vger.kernel.org>, 
 linux-wireless <linux-wireless@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>, 
 "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_132757_322188_CDB9DF41 
X-CRM114-Status: GOOD (  13.73  )
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

On Tue, Apr 26, 2022 at 10:20 PM Abhishek Kumar <kuabhs@chromium.org> wrote:
> On Tue, Apr 26, 2022 at 3:34 PM Brian Norris <briannorris@chromium.org> wrote:
> > You could have retained my:
> >
> > Reviewed-by: Brian Norris <briannorris@chromium.org>
> >
> > but no worries; it's just a few characters ;)
> Oh! sorry about that, I was under the impression that if the next
> iteration is posted, then I cannot just add the Reviewed-by tag
> provided in the previous iteration by myself.

You certainly *can* add it, but it's a judgment call on whether you
should. In this case, you were only making cosmetic changes (commit
message and comments, requested by reviewers) between versions, so IMO
that's totally fine. If there are more substantial changes between
versions, it may be better to skip it, and let the reviewer re-review.
Sometimes a reviewer might even explicitly say, "with changes X and Y,
consider this Reviewed-by: foo <foo@bar.tld>", which is a pretty
strong indication you can add it.

Anyway, it's probably better to omit a review line that should have
been included, rather than include one that should not have been
(e.g., because undesirable changes were made). So again, no worries
from me!

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
