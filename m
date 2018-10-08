Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9ZiO-00076k-Ua
 for ath10k@lists.infradead.org; Mon, 08 Oct 2018 17:53:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id 189-v6so8973572wmw.2
 for <ath10k@lists.infradead.org>; Mon, 08 Oct 2018 10:52:57 -0700 (PDT)
From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add ZyXEL NBG6617 + RT-AC58U
 update
Date: Mon, 08 Oct 2018 19:52:53 +0200
Message-ID: <2724638.XVLu5Q2NFm@debian64>
In-Reply-To: <87efd0ehtv.fsf@kamboji.qca.qualcomm.com>
References: <8339818.cMSNGYG2iH@debian64>
 <87efd0ehtv.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org

On Monday, October 8, 2018 2:36:12 PM CEST Kalle Valo wrote:
> Christian Lamparter <chunkeey@gmail.com> writes:
> > Hi, 
> >
> > This is a set of board.bin files for the ZyXEL NBG6617 Router [0],
> > which I wish to be added to the ath10k-firmware repository.
> >
> > As per the current "Submitting board files" guidelines [1]:
> >
> > * description for what hardware this is:
> >
> >   - it is a IPQ4018 based board [0]
> >   - one QCA40xx radio is used as 2.4GHz radio
> >   - one QCA40xx radio is used as 5GHz radio
> >
> > * origin of the board file (did you create it yourself or where you
> >   downloaded)
> >
> >   - All files were extracted from latest official vendor firmware
> >     V1.00(ABCT.6)CO [1]
> >     (Path /lib/firmware/IPQ4019/hw.1/boardData_IC/)
> >
> > * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k) 
> >   - QCA4019 hw1.0
> >     + bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=ZyXEL-NBG6617
> >
> >     + bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=ZyXEL-NBG6617
> >
> > * md5sum of each new board file to add
> >    - bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=ZyXEL-NBG6617
> >      has md5sum: 774dc40c3490572a34721a05ce0f0a55
> >
> >    - bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=ZyXEL-NBG6617
> >      has md5sum: ed05754d83b5001f441e1ec8383c099f
> >
> > * attach the actual board file (board.bin)
> >
> >   - The name of the files are equal to the id string in the board-2.bin
> >     (minus the ".bin")
> 
> Added, thanks. But please do double check that I didn't do any mistakes.
>
> https://github.com/kvalo/ath10k-firmware/commit/4b89c2b7efef0ba663339c1a42c673e97c7562bd
> https://github.com/kvalo/ath10k-firmware/commit/cb57d2d6b0aff8dacf1606074cd78bacbcf0d0ea

Thanks.

I double checked the ZyXEL NBG6617 and the ASUS RT-AC58u boardfile v2 update.
Both are fine.

Regards,
Christian



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
