Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22e.google.com ([2a00:1450:4010:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1di01F-0007ie-92
 for ath10k@lists.infradead.org; Wed, 16 Aug 2017 15:14:12 +0000
Received: by mail-lf0-x22e.google.com with SMTP id g25so17950101lfh.1
 for <ath10k@lists.infradead.org>; Wed, 16 Aug 2017 08:13:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87ziaz60ce.fsf@kamboji.qca.qualcomm.com>
References: <CAPYrjBWL8LmVyWcXRZZDE1pEpwq-E6vRh5Ed_kG=ieZfsZdeiA@mail.gmail.com>
 <87lgmj7g75.fsf@kamboji.qca.qualcomm.com>
 <CAM8JFhD0qFeDnHywTXmsHSdp4dzWeL_by1a=a4btaMcCbibmEw@mail.gmail.com>
 <87ziaz60ce.fsf@kamboji.qca.qualcomm.com>
From: Gilbert Moisio <gmoisio@gmail.com>
Date: Wed, 16 Aug 2017 17:13:42 +0200
Message-ID: <CAM8JFhBEkiRoyO+10ShcU2UDbz3a+zFxKVvxkipvqd2e3B9u3w@mail.gmail.com>
Subject: Re: ath10k firmware-6.bin bug: Disconnections every 20 minutes on
 QCA6174
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
Cc: Kouroche Bouchiat <kouroche.bouchiat@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

I'm using qca988x hw2.0.
Do you want that I replace the
/usr/lib/firmware/ath10k/QCA988X/hw2.0/firmware-5.bin with the
QCA6174/hw3.0/4.4.1/firmware-6.bin you gave me?

2017-08-16 16:42 GMT+02:00 Kalle Valo <kvalo@qca.qualcomm.com>:
> (please don't top post)
>
> Gilbert Moisio <gmoisio@gmail.com> writes:
>
>> I tried from a fresh install, directly with the last linux-firmware
>> package and the issue in avaliable at the first boot.
>
> That does not answer my question if it's WPA rekeying related but let's
> forget that for now.
>
> Can you try this firmware:
>
> https://github.com/kvalo/ath10k-firmware/blob/master/QCA6174/hw3.0/4.4.1/firmware-6.bin_WLAN.RM.4.4.1-00026-QCARMSWP-1
>
> If you try it, double check that you are really testing the correct
> firmware version, it's pretty easy to use the wrong version. Even better
> if you can provide me the desmg output so that I can confirm that.
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
