Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPt3k-0000DN-JL
 for ath10k@lists.infradead.org; Thu, 13 Aug 2015 14:00:45 +0000
Received: by wijp15 with SMTP id p15so260044894wij.0
 for <ath10k@lists.infradead.org>; Thu, 13 Aug 2015 07:00:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <874mk3pjht.fsf@kamboji.qca.qualcomm.com>
References: <874mk3pjht.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 13 Aug 2015 16:00:21 +0200
Message-ID: <CAAKLdA_TRF_NcA5csNc496SaZtatLzu6LtxYsQVKU_dso4G4gA@mail.gmail.com>
Subject: Re: ath10k: first qca6174 hw2.1 firmware released
From: Lapo Calamandrei <calamandrei@gmail.com>
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
Cc: ath10k@lists.infradead.org

2015-08-13 12:31 GMT+02:00 Kalle Valo <kvalo@qca.qualcomm.com>:
> Hi,
>
> I just pushed the first qca6174  hw2.1 firmware to ath10k-firmware.git:
>
> https://github.com/kvalo/ath10k-firmware/commit/7f7e7dda33676ced293de477b03711199ffe5256
>
> Please test and provide feedback.
>
> --
> Kalle Valo
>

Loads w/o skip_otp and works fine here (qca6174), except it crashes on
5GHz network connection attempt as the one created from the window
drivers.

Ciao
Lapo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
