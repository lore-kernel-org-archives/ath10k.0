Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13465C43334
	for <ath10k@archiver.kernel.org>; Wed,  8 Jun 2022 06:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=XOHGH3nF47VdhgOgrn2yq+QKZRUDm/K52l2+mqfR8Kc=; b=p4N
	NPecHBqLoqc0P30xChZ3bONIyICC228Qon2RdX0JU2eOEVJ5jR64FcELw0EmUr5JmzmcGLvQUPuZ6
	T+Y2Hpks/H/jSOcSUsJZMRzlJW5LISp+eOeIYjE0pDu2xm4XfGPAfmXZ+vop3tCxl0oXl9xCYb/Om
	Nx/G3HCSvlSblwKF1U6g2t10zSyEwM8bOI50JZMg6zHuTMKtgpNFtso85UaoahUzo0uywOxrAYg5K
	LD43E6df1wCyJeM/BldM/GMV1MK80O7vBX0saheVUHewASuSUqMlz39wUuGDI5wBRI8TzP/IyV3nW
	FLYu6C60bbioFNEFAQoiM+mC1sPTUxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyovk-00BFuO-Sc; Wed, 08 Jun 2022 06:12:36 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyovh-00BFsP-KW
	for ath10k@lists.infradead.org; Wed, 08 Jun 2022 06:12:34 +0000
Received: by mail-lf1-x136.google.com with SMTP id w20so9960557lfa.11
        for <ath10k@lists.infradead.org>; Tue, 07 Jun 2022 23:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=V1VOXPDjrX7n9GUKntjEnhmW5y7OTBtdfnTLOl1ODUo=;
        b=kaz2frvGl6u4T5AyjKPHTNUzYiGLHxRcrsptxVvrE4GJD8OT2QLJqdL28p+I0Pmzt+
         qG3mpUXfQmmTHfkitWgSh6bpUoS6mAyF6LK3A5QQAWMkSAhA8GPteTAU6eq7AD0G0Jua
         yliqHC0+gsC5+jBpPDCr8U1qEvQD14A1F+SnCwZTIOd5vnBs9CCt1sOWvWblNYuljH/K
         WHV1Cm/JY5RzFKNPpeCAg77Is64BwuFSTOlxQKp5jxAKt6RAxEfbNhKeVnYIjZvgHuAX
         Rk3TpOrnHlzczbiKUGzTFVavsoXUvLeFbfomSSiZV+4jv+iAIKaXlcuHaHHEWgtgGUVP
         42Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=V1VOXPDjrX7n9GUKntjEnhmW5y7OTBtdfnTLOl1ODUo=;
        b=yJ4Ujw8UlgE/U/lMY8ajiwy9YqVjMToZrpUbq/eNQrxDvcHCYn00RBiheIhQMF3nrl
         TqZVfKBZc92Pt7cy3eCe6Co/2wZehMxa8RPb8wrajmDpV0alUBH5DqNkyXkoRSdautA+
         1y8s5wG9SeqZBEMRPqivJ1AS8Bh7fRK57E1Jg4NYKythwbbsUxwcvYJEJ+IYYqxLyaZ/
         33d272feA7A5+lYwUgsuDZujUgdll0/PAApF9SAQtXMmj/73ER+8LeVdkMb10WkNrwNA
         Z1yBR6bHW0c5c/UfbIVJtGD+F4O+Ofl6ZIajUbJYhDqWPKhj6i4st0yLKottHkNz3ntQ
         AtLg==
X-Gm-Message-State: AOAM5312vSSNQ46fnHhcmSotiEGxpznqSIFbHQzEuS3IpDWiOTfrJvET
	pigCZ1B03VEaAsbCbKzMHQSbkxgQUIEeIBawANq1DXYdJmg=
X-Google-Smtp-Source: ABdhPJxcutCMDaIv59rKIjF2/qEzahtZ0JW7l3+jiMtFuQsucF/oU4sREAxE3k2shAo0IVZcbkpXZlz6BOby6OfZWu8=
X-Received: by 2002:a05:6512:13a3:b0:474:2642:d00e with SMTP id
 p35-20020a05651213a300b004742642d00emr20829633lfa.328.1654668748244; Tue, 07
 Jun 2022 23:12:28 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Nicol=C3=B2_Sprea?= <nsprea@gmail.com>
Date: Wed, 8 Jun 2022 08:12:17 +0200
Message-ID: <CA+BgFQXJr2FFdS5wK=it=sKck3htDXFFO50Px=scvL62xh41bw@mail.gmail.com>
Subject: Firmware 4 vs Firmware 6 for QCA6174 hw3.0
To: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_231233_729677_BF1B8E2F 
X-CRM114-Status: UNSURE (   3.80  )
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

Hi,
What are the differences between firmware 4 and firmware 6 for QCA6174 hw3.0?
Is there a release note?

Regards,
nsprea

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
