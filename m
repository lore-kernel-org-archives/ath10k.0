Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83B8C433EF
	for <ath10k@archiver.kernel.org>; Tue, 26 Apr 2022 22:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWrAkBllqKRDCM6whtcDd0Z0/Y68LWaWGONiOk/X5u4=; b=a+ZO7JJS0KfcEo
	ZQRHFWS6YCXU525k+5ol8ScocG8pVBI1D1PBz5uI2fXAJRSwgaHQ31rOsvT2Dy8HeXn9i/P0ZL7vV
	wfCLcfFtG3QRXYwufJkHX3FB6CVMDgv/xYxDgZP9vziYTBXKEui4s9QCQtr2R7n7lTnv2I+uOMQ2F
	Ex+omvzpgSOdxSuPrQhD4rFoDY8tAn1I0d4GhmLMMV3zBT15P6GVeaFs6nMhatIWR0i5vd/wv4hHN
	N5yqQgObtCpiwMAbn7RGZTP9AFVITpayEwwYR+oKVjgEaRSUf/4F+Q5qEQ62Wmqhg0CD6g9vaUjg+
	duH43N6L0NoJ4r80oeaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njTdR-00GS4L-QM; Tue, 26 Apr 2022 22:26:17 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njTdP-00GS3R-JC
 for ath10k@lists.infradead.org; Tue, 26 Apr 2022 22:26:16 +0000
Received: by mail-io1-xd33.google.com with SMTP id z26so425776iot.8
 for <ath10k@lists.infradead.org>; Tue, 26 Apr 2022 15:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XGlGbLh6bEnbqOguFAazlvyQUWTc8WoVl/XZIwb2vyg=;
 b=KhX8zq4519Alh989oGQbOZ5TD0FfPavnroKpD1epUR5av138znn1aeOTaIy9SwywYV
 cN2kt/OEAwASJYsLDLLfqQkBCYhXt44Oq96SrBBtj0p+SVtCUGlwfw7Pd5mK2ZyR5JQz
 T/rHz34Txh87pT+3eCq/JxYnzUC+lIdBV8UGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XGlGbLh6bEnbqOguFAazlvyQUWTc8WoVl/XZIwb2vyg=;
 b=a2I5jr2nJsZtHij4nqpFaRRGFx52AUtGZUr9rimkiVS/kW+Xt21KwHFnLVIs8CgnjC
 nQ1uk4ooft8f8wb5djK7Wx5Z5w3jB8mBcg/hxqhdpshyAMkpM2dbb88KoDn7XaENrnFZ
 Mu8Hun0xGkr67eu42Jg1CxOUuot/thexmeAmygyp2OcR+tMQmvQ0tfSGbuPrbf1MCeof
 yeJOfB6ONw+CguQya8Sw9D0turmoSP0qhzGMbiwpPTLFUBIGAtODXjS7VKHGjpICNllB
 k3lAFtAEePNpUZlXHLIj0pj9r0ble4rRciiNNTN+bMsbncA7pj48g3qT5ysZowMe6aeQ
 njPw==
X-Gm-Message-State: AOAM531Ky2uo0szAi94ydTT3hvj7FlWX4LfWgw0Bx8r/k8MdTDeftycO
 LE6SjFwtUwRIm26Rfmrd3LORgrQREy/Yzz/g9SpH3A==
X-Google-Smtp-Source: ABdhPJy3moSd+V0OFpev/Wt0vtSGfTMg2CNNKnetIpazSzWmk9Bz3+Qal22zLcONmUG7ZARSZKv9onHgxNQtZMAMe6I=
X-Received: by 2002:a05:6e02:2190:b0:2cd:8a7d:2d8 with SMTP id
 j16-20020a056e02219000b002cd8a7d02d8mr6141006ila.28.1651011973871; Tue, 26
 Apr 2022 15:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220425021442.1.I650b809482e1af8d0156ed88b5dc2677a0711d46@changeid>
 <f429219f-e5e5-6107-473f-a4566f4e7ee1@quicinc.com>
 <71858a31-4667-b358-194c-95a2ffc0c593@quicinc.com>
In-Reply-To: <71858a31-4667-b358-194c-95a2ffc0c593@quicinc.com>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Tue, 26 Apr 2022 15:26:01 -0700
Message-ID: <CACTWRwtUMFjw4vnDZVEXvGB5kH2KhJr5fwcXZn7TMan73OtOHA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: skip ath10k_halt during suspend for driver state
 RESTARTING
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: kvalo@kernel.org, linux-kernel@vger.kernel.org, 
 linux-wireless@vger.kernel.org, briannorris@chromium.org, 
 ath10k@lists.infradead.org, netdev@vger.kernel.org, 
 Wen Gong <quic_wgong@quicinc.com>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_152615_736192_2BF9CC67 
X-CRM114-Status: UNSURE (   7.12  )
X-CRM114-Notice: Please train this message.
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

Addressed all the above comments and pushed out a v2 patch. Fixes in V2:
- Fixed typo, replaced ath11k by ath10k in comments.
- Adjusted the position of the S-O-B tag.
- Added tested on tag.

Thanks
Abhishek

On Tue, Apr 26, 2022 at 9:23 AM Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>
> (sorry for the 2nd message with no content -- operator error)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
