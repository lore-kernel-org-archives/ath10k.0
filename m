Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9XiI-00032J-1Y
 for ath10k@lists.infradead.org; Mon, 08 Oct 2018 15:44:55 +0000
Received: by mail-qt1-x82f.google.com with SMTP id q41-v6so21378691qtq.10
 for <ath10k@lists.infradead.org>; Mon, 08 Oct 2018 08:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAOX2RU6KQssdeZu74TWKrrFhgdwr7fMN8BCExmE0W=EKVwhYdA@mail.gmail.com>
 <875zycehar.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <875zycehar.fsf@kamboji.qca.qualcomm.com>
From: Robert Marko <robimarko@gmail.com>
Date: Mon, 8 Oct 2018 17:44:29 +0200
Message-ID: <CAOX2RU5gHp0WmKbsHmKVFpeKFKxp+mcOrdUuMom+QT=-BsO+gA@mail.gmail.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Netgear Orbi Pro SRK60
 specific BDFs
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
To: kvalo@codeaurora.org
Cc: ath10k@lists.infradead.org

Thanks, checked with ath10k-bdencoder and its correct.

Regards
Robert Marko
On Mon, 8 Oct 2018 at 14:47, Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Robert Marko <robimarko@gmail.com> writes:
>
> > I am currently working on the Netgear Orbi Prok SRK60 support for
> > OpenWrt. This
> > AP requires three special BDFs to get the Wi-Fi PHYs working (correctly). The
> > bmi-board-id='s would clash with one of the the IPQ401X AP-DK boards because
> > QCA doesn't provide special IDs for customers and seems to use the AP-DK
> > board-ids in the wifi firmware to change its behavior.
> >
> > Now to the questions from the wiki page [1]:
> >
> > * description for what hardware this is:
> >
> >   - it is a QCA4019 based module (based on qcom-ipq4019-ap.dk04.1-c1)
> >   - one QCA4019 radio is used as 2.4GHz radio
> >   - one QCA4019 radio is used as 5GHz radio
> >   - an additional QCA9984 5GHz radio is attached via PCI
> >
> > * origin of the board file (did you create it yourself or where you
> >   downloaded)
> >
> >   - it was pulled from the factory firmware image
> >   - it is based on latest 2.1.4.16 firmware
> >
> > * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
> >
> >   - QCA4019 hw1.0
> >
> >   + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Netgear-Orbi-Pro-SRK60
> >      md5sum:
> >      a64d3a593d2447cd41886d695932ddfd
> >
> >   + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Netgear-Orbi-Pro-SRK60
> >      md5sum:
> >      b2195b47a2e88e28c31c4aceaaccfebe
> >
> > * attach the actual board file (board.bin)
> >
> >   - The name of the files are equal to the id string in the board-2.bin
> >     (minus the ".bin")
>
> Added, thanks. Please double check my changes:
>
> https://github.com/kvalo/ath10k-firmware/commit/ca050e3c8e16bc43b67cd5d752007372498c5a54
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
