Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRKE8-00010t-SN
 for ath10k@lists.infradead.org; Tue, 09 Sep 2014 12:08:53 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Firmware crash w/ 10.2 diagnosis?
References: <CABnBrYV4Lh7EF9xaEK6zkPk0HhU=iP283WhH+wA9=i7XfHroGg@mail.gmail.com>
 <CA+BoTQ=tDMX4TKwmGcML4n-r-LPV3aici=X4Ms4rACoBhq2cKA@mail.gmail.com>
 <CABnBrYVb+BN4BFxrj82dj0KypxEy6GGYXtOitVW7twtzTeCArA@mail.gmail.com>
Date: Tue, 9 Sep 2014 15:08:21 +0300
In-Reply-To: <CABnBrYVb+BN4BFxrj82dj0KypxEy6GGYXtOitVW7twtzTeCArA@mail.gmail.com>
 (Denton Gentry's message of "Mon, 8 Sep 2014 05:42:02 -0700")
Message-ID: <87tx4h8096.fsf@kamboji.qca.qualcomm.com>
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

> The ath10k is operating in AP mode.
>
> Its using a base ath10k driver from a few months ago:
>
>        git fetch git://github.com/kvalo/ath.git ath-next
>        git checkout v3.15-rc1-237-gd9bc4b9

What is the kernel version? Do you use backports?

> The data from the firmware shows something about a monitor vdev being
> removed? hostapd does create a monitor interface, though I don't see
> an indication that it was being removed at the time of the crash.
> hostapd had exited and restarted well before though, is it possible
> that removal of a monitor interface some time ago might be
> contributing?

So are you still using the old cooked monitor interface for management
frames? I strongly recommend switching to the new way of transmitting
and receiving management frames through nl80211 as then hostapd will not
a create monitor interface. This is what most people use and is most
extensively tested.

Commit 6e3e939f3b1bf8534b32ad09ff199d88800835a0 ('net: add wireless TX
status socket option') adds this capability to the kernel, first
released in Linux 3.3. There might be some dependencies in case you are
porting it to an older kernel, so be extra careful.

Please note that updating backports is not enough for SO_WIFI_STATUS
status, you need to update the kernel itself.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
