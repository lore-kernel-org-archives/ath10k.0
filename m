Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6B4C433F5
	for <ath10k@archiver.kernel.org>; Wed, 12 Jan 2022 02:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w1aptZjmXkulm56dQU1ReiT3pSQOTeHtxUuvkxSvSFA=; b=t9nGePMZhb0Ctp
	usS03dSbyyjyCU9tOOqHKsAWOmUT8UuuH2ihXm2TnmGtPYUZ9RZe46VjyR2tdiDWNtMHqFldiW0XG
	YueRWFAnGtuKHAR+MGB8YzMU9QdU/t+axKu6yFAXHUg3Gq3irpkHxQJPUyyFB81GKUnCMgJtxnttB
	ExxVN8dJy41F/Mn4jFeyH++AHKEAMAokKy0+BJyUH1xB2c/ygDAiDDdbpzz8U2tt6QD1ZXc6p4Z3A
	Nl8b0ExLEWrC+D1cxc/6tYb4coQwcGdQD5zMRb1YKb2YqsaMlIHXKkz4gUuBc+3STa/gFAxCtaE/t
	VVoUT67riT5EUP01Ccdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7TG8-000pXH-2V; Wed, 12 Jan 2022 02:21:08 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7TG5-000pWm-AJ
 for ath10k@lists.infradead.org; Wed, 12 Jan 2022 02:21:06 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 w19-20020a056830061300b0058f1dd48932so932856oti.11
 for <ath10k@lists.infradead.org>; Tue, 11 Jan 2022 18:21:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qSz9nqMvLNyS6aeY5fUaSL26SyAlQ9l55+SxfRywHfw=;
 b=RNhpOu2Vr4ImBs1ssReugKpG2BDf9+rE3Ew6yAiv2BgLfUsautHTqDwOa8hzgyzrE2
 o3Zfo4u3NxdAZ6RxPQBPj1pYv60aXDL6T7fukgF6Tg2m2OONjsdsEU2MMQE/4FQeaSRs
 inGwNFB4ksV67oQDa5HNTotnQBRCSM+89Y1KPLj1et1c9Xi/mRpqGH6T8Gi78oeG3mSa
 xut5KFbKb8TYiVyOTpAd3doaLFOqPCbvx4spN7KWCcqhHB6OHtFb8NMypWmBXlTnqmfX
 H8cZPbZbP8kBb0qpo5yqXsuoNpOcrk9En4frrZzOdIVsCx6E1c9ujSnHL/jGTpFw8XJM
 V71A==
X-Gm-Message-State: AOAM530SrmKAVbhNpBv/3xVoyZuBus8apCjpnMxnXwsoTrAT3CUlfY0N
 RMbqO0nabOekHqALqlzM2g==
X-Google-Smtp-Source: ABdhPJxI82YkGfNmAqCIMJ/wSuUgCxzRZYE5VokdiLCTNQR4r9d1Ns1/A+MGaXe+wOOZUsTN0zDyfw==
X-Received: by 2002:a9d:6452:: with SMTP id m18mr1492762otl.99.1641954064626; 
 Tue, 11 Jan 2022 18:21:04 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id d21sm668955oti.5.2022.01.11.18.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 18:21:04 -0800 (PST)
Received: (nullmailer pid 3943654 invoked by uid 1000);
 Wed, 12 Jan 2022 02:21:03 -0000
Date: Tue, 11 Jan 2022 20:21:03 -0600
From: Rob Herring <robh@kernel.org>
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, pillair@codeaurora.org,
 Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>,
 Rob Herring <robh+dt@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 dianders@chromium.org, kvalo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt: bindings: add dt entry for ath10k default BDF
 name
Message-ID: <Yd47D9GjbAFaWXEo@robh.at.kernel.org>
References: <20220110231255.v2.1.Ie4dcc45b0bf365077303c596891d460d716bb4c5@changeid>
 <20220110231255.v2.2.Ia0365467994f8f9085c86b5674b57ff507c669f8@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110231255.v2.2.Ia0365467994f8f9085c86b5674b57ff507c669f8@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_182105_379098_3EC26424 
X-CRM114-Status: GOOD (  14.39  )
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

On Mon, 10 Jan 2022 23:14:15 +0000, Abhishek Kumar wrote:
> It is possible that BDF name with board-id+chip-id+variant
> combination is not found in the board-2.bin. Such cases can
> cause wlan probe to fail and completely break wifi. In such
> case there can be an optional property to define a default
> BDF name to search for in the board-2.bin file when none of
> the combinations (board-id,chip-id,variant) match.
> To address the above concern provide an optional proptery:
> qcom,ath10k-default-bdf
> 
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
> ---
> 
> Changes in v2:
>  - Changes in v2: none
> 
>  .../devicetree/bindings/net/wireless/qcom,ath10k.txt          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
