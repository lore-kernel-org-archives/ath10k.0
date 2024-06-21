Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF288C2BA1A
	for <ath10k@archiver.kernel.org>; Fri, 21 Jun 2024 10:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBOHhE1MiOyev8w2dqWF2XtGTCQMoiHwW0KiP/RGv9Q=; b=j6iLq6KK3+7EZVoFg0dlkvQcyD
	ayiE+VqEuisLIrDBgnRYiWQKmPlN4npqTmtZhBqPIaq6yaEdKcoW3g1lypwfSqWRmr8ZKbMWiHVT2
	pN71At+jxYaIKpQRZ785XbhPWTEH+Jq7AR6zQr9an+Mard/QblHI9q+KX3hRvBCMYABS2qCXUfeXF
	hLG+UzH7nd7z5O6Jpn8a2ZNcMBJKFDK682y45MD8wfmdhBd53ihIl0YsqmG28PxkBZnYlQUnRQWel
	MpyQ49M0KOB2NLZ4FiDC509rreXwRpQ+M2WVLjU36EjxFTds0+TQvdXLoN2rCgfouYfKjSYYiq9ic
	J75MvTaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKbY5-00000008mm4-1niB;
	Fri, 21 Jun 2024 10:31:17 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKbY2-00000008mk7-0Yme
	for ath10k@lists.infradead.org;
	Fri, 21 Jun 2024 10:31:15 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-57cbc2a2496so2201094a12.0
        for <ath10k@lists.infradead.org>; Fri, 21 Jun 2024 03:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citymesh.com; s=google; t=1718965872; x=1719570672; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBOHhE1MiOyev8w2dqWF2XtGTCQMoiHwW0KiP/RGv9Q=;
        b=YXd4F1cYUL4EgbY68Vdg9qO0/rNd7CLQTPOB7pzomxrszqfv3l7yy4lbqHFNVj/Eop
         k34tSOYFQsx5q7Q1dDrAt7504Vp9KrZxy0RTFYrooOn3a3mobcPmzMXom/hQ+sbYHPCv
         d3zCf0gGCtuRukzts+stmDLGz5M8D8J4qo88ngRiL7Lf14Y8a0uQ7CNvusxqmPU24XQ4
         1fnkzFbiFqOuecGYQZ405KzTtPZxzBqyhKWwtGBLVY9kXsdHnGiYZ/tMRolrzngLGPuk
         SPNDaLXbHK7/prsIFhUt8OcB7FcuEByqzRYHdQUdx1yoP/U0B9inrAnYB0qLBLbRM3Gm
         FVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718965872; x=1719570672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBOHhE1MiOyev8w2dqWF2XtGTCQMoiHwW0KiP/RGv9Q=;
        b=OGTLKEtVmwM/+J/S65Y1uPs1asTZu7cwT5HbzK/0wi6opUNTEaRitTvUicXS004aOt
         A4RfmFyGO6at1/l63TF3OJMRNpPkakFzieZOaTbzrowcsd+TG63olvTHNb+UOkaghssx
         CU3K1oYiUS7gzJlPpQEEEGnDMjjQV5ViTptwUlFCnm/kjRXE2+5eRYjPbXakiKOpP64m
         r2RoXLCOlki2L7gNygjZgNNdSth/3BEbdwy7LmjyeTiA7+cdENgSXLnNhUCiMXkdeAhY
         hMmh7bjizY89OCUbLf288jSbbVAD7cnIvJU/GcF/B9h+C2VfkWYjxmeQaTxXpXFSmtFM
         dSZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAfOrpqpdCYADcHUvWuDuiHsSlIXkz/IqnQE1yGP64oiJpGMD/6vA78AmgowDfs2EJpHKlqkxbVJYxrxKVQFaWkw7IBSZUZS2snw==
X-Gm-Message-State: AOJu0YyERd936EGACS6BP1ArpHYcCHcbt0eEgFa3MbSUdNU1hRBi8bs4
	vPmPCpX0w4ZpSa6DS1Hbu72cbWJRy6ywFU3rnb7dQr6bMSQVsjMFmn1OnmmCSL3yMgcJRIZcWgD
	hOjZcCbpDl/74S7L3AfyTntVG65N9Ycy6W03c9g==
X-Google-Smtp-Source: AGHT+IGKLwy1FF45ea+S+UHbyw7AC3VPyEGJzQG+CliR1MRDmrMbiusd4p08/41SD2+uJ4amap86quQYp6/RCLP2Oj4=
X-Received: by 2002:a50:bb44:0:b0:57c:c2b6:176d with SMTP id
 4fb4d7f45d1cf-57d07ed3a19mr5254671a12.32.1718965871951; Fri, 21 Jun 2024
 03:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAPh3n83zb1PwFBFijJKChBqY95zzpYh=2iPf8tmh=YTS6e3xPw@mail.gmail.com>
 <efc8cdc0853a921ce4dad1a36b084608fe0b01a8.camel@sipsolutions.net>
 <CAPh3n834eg1_+gmh_LMTQnc95aLBWNVOANjZsMap=_szOY2nHQ@mail.gmail.com> <83fcb33e3fadb457466126255297899fbc4186f8.camel@sipsolutions.net>
In-Reply-To: <83fcb33e3fadb457466126255297899fbc4186f8.camel@sipsolutions.net>
From: Koen Vandeputte <koen.vandeputte@citymesh.com>
Date: Fri, 21 Jun 2024 12:31:00 +0200
Message-ID: <CAPh3n80PF4NULjKJVVMEiGuuJZhLQszYSTCv+f6e9LfVJbKesw@mail.gmail.com>
Subject: Re: ieee80211.h virtual_map splat
To: Johannes Berg <johannes@sipsolutions.net>
Cc: quic_jjohnson@quicinc.com, ath10k@lists.infradead.org, 
	linux-wireless <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_033114_196698_C82927C0 
X-CRM114-Status: UNSURE (   6.97  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Fri, Jun 21, 2024 at 11:30=E2=80=AFAM Johannes Berg
<johannes@sipsolutions.net> wrote:
>
>
> > will this one get backported also?
>
> Why? It's not even a bug.
>
> johannes

Because without this patch, it produces a splat on kernel 6.6 (which
is an LTS) at least ? :-)

