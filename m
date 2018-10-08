Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9Xjq-0004mz-4L
 for ath10k@lists.infradead.org; Mon, 08 Oct 2018 15:46:31 +0000
Received: by mail-qt1-x830.google.com with SMTP id j46-v6so5733042qtc.9
 for <ath10k@lists.infradead.org>; Mon, 08 Oct 2018 08:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAOX2RU449+7k_z2HF_x1d=+_YLt7j1Yfq8npppRX+OBFsUuqPQ@mail.gmail.com>
 <871s90egx2.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <871s90egx2.fsf@kamboji.qca.qualcomm.com>
From: Robert Marko <robimarko@gmail.com>
Date: Mon, 8 Oct 2018 17:46:07 +0200
Message-ID: <CAOX2RU7WqKU6vWnDR-kh+XjOb2uy1-yZzNj++HW3LTaFSkAQFA@mail.gmail.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Netgear WAC510 specific BDFs
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
On Mon, 8 Oct 2018 at 14:55, Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Robert Marko <robimarko@gmail.com> writes:
>
> > I am currently working on the Netgear WAC510 support for
> > OpenWrt.
> > This AP requires two special BDFs to get the Wi-Fi PHYs working (correctly). The
> > bmi-board-id='s would clash with one of the the IPQ401X AP-DK boards because
> > QCA doesn't provide special IDs for customers and seems to use the AP-DK
> > board-ids in the wifi firmware to change its behavior.
> >
> > Now to the questions from the wiki page [1]:
> >
> > * description for what hardware this is:
> >
> >   - it is a QCA4019 based module (based on qcom-ipq4019-ap.dk01.1-c1)
> >   - one QCA4019 radio is used as 2.4GHz radio
> >   - one QCA4019 radio is used as 5GHz radio
> >
> > * origin of the board file (did you create it yourself or where you
> >   downloaded)
> >
> >   - it was pulled from the factory firmware image
> >   - it is based on latest 5.0.54 firmware
> >
> > * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
> >
> >   - QCA4019 hw1.0
> >
> >   + bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=Netgear-WAC510
> >      md5sum:
> >      8fd3e1b98d30be3cd14ae4b110be37f7
> >
> >   + bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=Netgear-WAC510
> >      md5sum:
> >      5a42cb70b249e704bb50561bf274e468
> >
> > * attach the actual board file (board.bin)
> >
> >   - The name of the files are equal to the id string in the board-2.bin
> >     (minus the ".bin")
>
> Added, thanks. Please double check my changes:
>
> https://github.com/kvalo/ath10k-firmware/commit/d13a7c4722e97ad60b66d23033266fe908dab6cf
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
