Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x229.google.com ([2607:f8b0:400c:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdGfx-0004gq-Ld
 for ath10k@lists.infradead.org; Thu, 24 Apr 2014 10:14:42 +0000
Received: by mail-vc0-f169.google.com with SMTP id im17so2632250vcb.14
 for <ath10k@lists.infradead.org>; Thu, 24 Apr 2014 03:14:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <874n1jm54z.fsf@kamboji.qca.qualcomm.com>
References: <1398327250-12923-1-git-send-email-yeohchunyeow@gmail.com>
 <87d2g7m90w.fsf@kamboji.qca.qualcomm.com>
 <CAEFj986h0FtMOpbTbYYQzLxZrEcL_og0+qpQkfj36xMWM9LG5g@mail.gmail.com>
 <878uqvm7yz.fsf@kamboji.qca.qualcomm.com>
 <CAEFj986VVHkgSnv=xGo_WAYg+n4Sp0_qJGkpmzjNk9thoizZCA@mail.gmail.com>
 <874n1jm54z.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 24 Apr 2014 18:14:19 +0800
Message-ID: <CAEFj986mx-9UsV=PapWYmJf_vgkxAZowq9CbtguVHpKw-Er8cg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: don't allow stand alone monitor mode for non-AP
 firmware
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

>
> Yeah, maybe should change the documentation to recommend using 10.1
> branch for AP, STA and monitor modes? And recommended main branch only
> for Ad-Hoc and P2P?
>
Eventually, we need a single firmware that can support all the modes,
including mesh.

For the 10.1, it cited " STA specific features might not work". Can
someone comment what working and what not working?

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
