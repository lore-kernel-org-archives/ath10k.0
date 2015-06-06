Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1EV8-0005P8-8W
 for ath10k@lists.infradead.org; Sat, 06 Jun 2015 13:51:06 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Warnings/errors in use with a QCA989x card
References: <D38B2BA4-0B08-4B7B-A295-E95D1CF3FDBB@gmail.com>
 <CA+BoTQm735L-TQ0ZjSZ2gHud_AwvP+kZAh+Wc4iQtaGSiC2GLw@mail.gmail.com>
Date: Sat, 6 Jun 2015 16:50:34 +0300
In-Reply-To: <CA+BoTQm735L-TQ0ZjSZ2gHud_AwvP+kZAh+Wc4iQtaGSiC2GLw@mail.gmail.com>
 (Michal Kazior's message of "Fri, 5 Jun 2015 07:17:41 +0200")
Message-ID: <87sia5lzdh.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Matthew Robbetts <wingfeathera@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> This is the dreaded tx credit starvation.
>
> In some cases if disassoc+deauth is sent and target station is asleep
> and unresponsive it'll cause firmware to stall causing ath10k timeouts
> during sta_state station removal. Due to insufficient credits beacons
> can't be sent for ~10 seconds, sta_state station removal fails causing
> mac80211 call trace splat and later spurious kickout events because
> peer was never removed from firmware.
>
> There's no easy/sane fix for that, yet.
>
> You can read more on the subject:
>
>  http://thread.gmane.org/gmane.linux.kernel.wireless.general/121954
> http://thread.gmane.org/gmane.linux.drivers.ath10k.devel/638

Should we write an entry to the FAQ about this?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
