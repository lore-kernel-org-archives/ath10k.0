Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from vs14.mail.saunalahti.fi ([62.142.117.201])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wsq0K-0006iW-70
 for ath10k@lists.infradead.org; Fri, 06 Jun 2014 09:00:05 +0000
Received: from vams (localhost [127.0.0.1])
 by vs14.mail.saunalahti.fi (Postfix) with SMTP id 33726740069
 for <ath10k@lists.infradead.org>; Fri,  6 Jun 2014 11:59:38 +0300 (EEST)
Received: from gw02.mail.saunalahti.fi (gw02.mail.saunalahti.fi
 [195.197.172.116])
 by vs14.mail.saunalahti.fi (Postfix) with ESMTP id 19717740069
 for <ath10k@lists.infradead.org>; Fri,  6 Jun 2014 11:59:38 +0300 (EEST)
Received: from [134.61.10.67] (nbtad04.physik.rwth-aachen.de [134.61.10.67])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by gw02.mail.saunalahti.fi (Postfix) with ESMTPSA id F2AD740008
 for <ath10k@lists.infradead.org>; Fri,  6 Jun 2014 11:59:36 +0300 (EEST)
Message-ID: <539182F4.1080804@elisanet.fi>
Date: Fri, 06 Jun 2014 10:59:32 +0200
From: Matti Laakso <malaakso@elisanet.fi>
MIME-Version: 1.0
Subject: Re: Re: compat-wireless-2014-05-22 breaks ath10k in an Archer C7
 v2
References: <87r433ps7w.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87r433ps7w.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org

> ------------------------------------------------------------------------
> Andy Lutomirski <luto at amacapital.net <http://lists.infradead.org/mailman/listinfo/ath10k>> writes:
>
> >/ On Thu, May 29, 2014 at 12:48 AM, Michal Kazior <michal.kazior at tieto.com <http://lists.infradead.org/mailman/listinfo/ath10k>> wrote:
> />>/ +ath10k at lists.infradead.org <http://lists.infradead.org/mailman/listinfo/ath10k>
> />>/
> />>/ On 28 May 2014 20:35, Andy Lutomirski <luto at amacapital.net <http://lists.infradead.org/mailman/listinfo/ath10k>> wrote:
> />>>/ It dies with 'otp calibration failed: 2'.
> />>>/
> />>>/ Some older version of the driver seemed to work fine.
> />>/
> />>/ ath10k did not verify otp result before so it could load successfully
> />>/ despite errors.
> />>/
> />>/ Someone raised this problem yesterday on IRC. I'm not really sure how
> />>/ we should deal with this properly.
> />/
> />/ Ideally, someone from Atheros could figure out what the error is.
> /
> Michal already did. The error means that for some reason the
> calibaration data was not found from OTP. OTP is the storage area where
> the calibration data is normally stored within QCA9880.
>
> >/ Barring that, the card seems to work okay without otp (I don't even
> />/ know what otp is), so just warning and continuing to load might be
> />/ better than bailing.
> /
> This means that your card is not properly calibrated and it doesn't
> function in an optimal way (for example range or throughput is less than
> what it could be).
>
> Do you see that with all Archer C7 v2 devices or with just one? One
> possibility is that the calibration data is actually stored outside of
> QCA9880 board, for example in the host flash or similar. I don't have
> that AP, can someone else see where the calibration data is stored?
>
> I know that ath9k supports this kind of setup, most likely ath10k should
> as well.
>
> -- 
> Kalle Valo
>
C7 v1 has the AR9550 calibration data in flash in the last 64 kiB,
likely C7 v2 as well. Could someone with v2 and OpenWrt use dd to dump
the contents of the "art" partition (/dev/mtdblock4 IIRC) and upload it
somewhere? I think it would be easy to see whether there is just the
calibration data for AR9550 or if there is also data for QCA9880.

Matti

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
