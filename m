Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRjnw-0001FO-29
 for ath10k@lists.infradead.org; Wed, 10 Sep 2014 15:27:32 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Firmware crash w/ 10.2 diagnosis?
References: <CABnBrYV4Lh7EF9xaEK6zkPk0HhU=iP283WhH+wA9=i7XfHroGg@mail.gmail.com>
 <CA+BoTQ=tDMX4TKwmGcML4n-r-LPV3aici=X4Ms4rACoBhq2cKA@mail.gmail.com>
 <CABnBrYVb+BN4BFxrj82dj0KypxEy6GGYXtOitVW7twtzTeCArA@mail.gmail.com>
 <87tx4h8096.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQnC0Px3gi6nK1MTjFMTr2cY0dTntCi+KBcvnEd31ELVZA@mail.gmail.com>
 <CABnBrYV6MSw1LgcgbL4O4sgR0K_P-9jCMEhOvMDmPt8yw2UeXQ@mail.gmail.com>
Date: Wed, 10 Sep 2014 18:26:52 +0300
In-Reply-To: <CABnBrYV6MSw1LgcgbL4O4sgR0K_P-9jCMEhOvMDmPt8yw2UeXQ@mail.gmail.com>
 (Denton Gentry's message of "Tue, 9 Sep 2014 13:05:21 -0700")
Message-ID: <8761gv7ayr.fsf@kamboji.qca.qualcomm.com>
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
To: Denton Gentry <denton.gentry@gmail.com>
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Denton Gentry <denton.gentry@gmail.com> writes:

> I'm using backports, and the kernel version is 3.2.
> hostapd says it is indeed using the cooked monitor:
>
>     monitor mode needed: 1 (poll_cmd=1 data_tx_status=0)
>
> I'll look at updating the kernel, if not to 3.16 then at least to
> something recent enough to stop using the monitor interface from
> hostapd.

Good. But if you use bridging the monitor vdev is created anyway. So
most likely switching to nl80211 management frame interface is not going
to workaround the firmware bug.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
