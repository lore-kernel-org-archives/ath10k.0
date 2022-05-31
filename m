Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D28CC433F5
	for <ath10k@archiver.kernel.org>; Tue, 31 May 2022 16:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jORFMO/ApHmMHmgx/ucIgEUyGLgjegj8NTzWUmikLlg=; b=KJt4rQy2wYy0Aq
	4khPGG0FGbvN0ygJnPktSReopJHOa28+IxJGNBORJZDIEM6TyZ+WvV0N4G7KWjVZbC+lctnuaG+yA
	mA6Gk/3Wc0TWkNSKJd+rwA0+/MG6eYQFLohUGWA1HbO9xN9kx4SL2kdZ170NPckMg/VZW9DOeiEtq
	y6vKKN6w7EqRUV5mBmWjGoi03tyhOpZ6WJcuMrn2Evztb5eDHMe4AvZlLjz8zeSlEmuWg3fm+NuOh
	29eVxl1G766myJteGFHbLdkP+nqnVIX5GN1VSWrNDNlC7rRKjm33qVYuFkIhqKj/vbuXHQdqNP7aS
	ajcwO2yt/JrYInoap14g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw5AD-00Bvqu-S2; Tue, 31 May 2022 16:56:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw5AA-00Bvny-9P; Tue, 31 May 2022 16:56:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 92FA460B9F;
	Tue, 31 May 2022 16:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B0EC385A9;
	Tue, 31 May 2022 16:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654016169;
	bh=O7ipYc08a1ud4PjM8jqwqP/HB7ejnhs+7FiRg2RkfLU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ARiBuyJNKGzgJxTFlEh85RbXEWiAvTBEBYqj51JzXFx6PIVpDQSWsRY1Xb83VdGT1
	 LBpbaFpxD0dARTBGBpkBN3x6CqL5NLBLtrQtmHeIcavQfnsbUo60w+kD7VBykl0zoj
	 U9JWDVMO9/1RnSops7og4rVrWikJjFgdP+wSIiedWwR3Jvf8wEEaID0TDbfV34FJqY
	 k/iqr9rCl23AHjJN6k1MGgIk5zxGssd+s31tGRXjmDsgbOkaOeBcf+XIDBI97pJKSx
	 tmbYBxtaoaCizpg8iejPhaZVjMeCG9dLAO10G4vzhrLNC6srqoJvYRJvGxgTbcrXBH
	 au++AavwSQZfQ==
Received: by mail-il1-f177.google.com with SMTP id y16so5022949ili.13;
        Tue, 31 May 2022 09:56:08 -0700 (PDT)
X-Gm-Message-State: AOAM531H3Y2+SAw1wvO6i4/vGfPyY5DD1aBYcmeD7Omzj/W/P9FK/ZT+
	N4AUEWC6QRX/WpKQSBn8Ef7PoRUn+7JsE9zTPOs=
X-Google-Smtp-Source: ABdhPJxW+nTmxFvqbYpDjoFa7oeGIavAu7C0DnzXXxPNcupiot1bCXCkfM4+/OZWL4MT60K33XCTLL5unppXnmNnBqQ=
X-Received: by 2002:a05:6e02:1bef:b0:2d3:c3d5:823d with SMTP id
 y15-20020a056e021bef00b002d3c3d5823dmr1602680ilv.2.1654016168137; Tue, 31 May
 2022 09:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR02MB4567904C36E83634CB0ED09292DD9@BYAPR02MB4567.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB4567904C36E83634CB0ED09292DD9@BYAPR02MB4567.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 31 May 2022 12:55:57 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4UzaOXNentsgrgeqOV0N+qPpnvBmTuwDOS0fzb6bCGjQ@mail.gmail.com>
Message-ID: <CA+5PVA4UzaOXNentsgrgeqOV0N+qPpnvBmTuwDOS0fzb6bCGjQ@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20220530
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, 
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_095610_464233_41488C58 
X-CRM114-Status: GOOD (  20.65  )
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

On Mon, May 30, 2022 at 9:08 AM Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
> Hi,
>
> Here's a new pull request for ath10k and ath11k. Here I'm adding a missing board file for
> WCN3990, otherwise just regular firmware and board file updates.
>
> Please let me know if there are any problems.
>
> Kalle
>
> The following changes since commit 251d29004ffce3462779dbd08073a2cd8dfd2087:
>
>   amdgpu: update beige goby firmware for 22.10 (2022-05-16 15:25:38 -0400)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20220530
>
> for you to fetch changes up to 82b0ef7166e2b7f9d12e7745a2af4e4c75c1aea8:
>
>   ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9 (2022-05-30 16:01:56 +0300)
>
> ----------------------------------------------------------------
> Kalle Valo (7):
>       ath10k: WCN3990 hw1.0: add board-2.bin
>       ath10k: QCA4019 hw1.0: update board-2.bin
>       ath10k: QCA9888 hw2.0: update firmware-5.bin to 10.4-3.9.0.2-00157
>       ath10k: QCA9888 hw2.0: update board-2.bin
>       ath10k: QCA9984 hw1.0: update firmware-5.bin to 10.4-3.9.0.2-00157
>       WHENCE: ath11k: move regdb.bin before board-2.bin
>       ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9

Pulled and pushed out.

josh

>
>  WHENCE                              |  11 ++++++-----
>  ath10k/QCA4019/hw1.0/board-2.bin    | Bin 1129788 -> 1154076 bytes
>  ath10k/QCA9888/hw2.0/board-2.bin    | Bin 133540 -> 145684 bytes
>  ath10k/QCA9888/hw2.0/firmware-5.bin | Bin 693604 -> 693700 bytes
>  ath10k/QCA9984/hw1.0/firmware-5.bin | Bin 681568 -> 681672 bytes
>  ath10k/WCN3990/hw1.0/board-2.bin    | Bin 0 -> 461060 bytes
>  ath11k/WCN6855/hw2.0/amss.bin       | Bin 4972544 -> 4972544 bytes
>  7 files changed, 6 insertions(+), 5 deletions(-)
>  create mode 100644 ath10k/WCN3990/hw1.0/board-2.bin

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
