Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WtZAm-0000ZB-Is
 for ath10k@lists.infradead.org; Sun, 08 Jun 2014 09:13:53 +0000
Message-ID: <1402218792.4406.2.camel@jlt4.sipsolutions.net>
Subject: Re: Firmware debugging patches?
From: Johannes Berg <johannes@sipsolutions.net>
Date: Sun, 08 Jun 2014 11:13:12 +0200
In-Reply-To: <8738ffiysv.fsf@kamboji.qca.qualcomm.com>
 (sfid-20140608_103606_337478_803FD86E)
References: <53891ACD.7070902@candelatech.com>
 <87wqczz3h9.fsf@kamboji.qca.qualcomm.com>
 <538CA904.4000508@candelatech.com>
 <87ioojz1b1.fsf@kamboji.qca.qualcomm.com>
 <538CB782.1000509@candelatech.com> <538CC68C.10808@gmail.com>
 <538CC949.5020901@candelatech.com>
 <CANUX_P2vbKD3zkwE=DvJJWpo=gEMORCBy=XFoC2YSFpmg9sr_A@mail.gmail.com>
 <538CD507.1050803@candelatech.com>
 <87bnu7pqe2.fsf@kamboji.qca.qualcomm.com>
 <53909372.1040707@candelatech.com>
 <87fvjimsxj.fsf@kamboji.qca.qualcomm.com>
 <5391E620.4090706@candelatech.com>
 <87vbscj2ho.fsf@kamboji.qca.qualcomm.com>
 <53932F52.2030203@candelatech.com>
 <8738ffiysv.fsf@kamboji.qca.qualcomm.com>
 (sfid-20140608_103606_337478_803FD86E)
Mime-Version: 1.0
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
Cc: Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Emmanuel Grumbach <egrumbach@gmail.com>

On Sun, 2014-06-08 at 11:35 +0300, Kalle Valo wrote:

> > I was thinking we should not add a MAC to the dump, for privacy concerns,
> > but whatever user-space tools gather the dump could add MAC if user perfers.
> 
> The MAC addresses can be extracted from the target memory anyway so I
> don't see harm from including that in the dump. Is it even possible to
> address all privacy issues when dealing with firmware dumps?

We had something of a discussion about this - it's usually not just
BSSIDs/MAC addresses, but also encryption keys (say WEP keys, or at
least temporal keys, sometimes more), SSIDs, etc. In short, there's a
whole bunch of private data that can be included in such dumps.

However, we haven't really found a good solution. Popping up big scary
warnings to the user is unlikely to be productive, trying to keep the
data private and only accessible to (the right) developers is not going
to work ... encryption might work, but who manages that?

Certainly the data shouldn't be attached to a public bug tracker
automatically...

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
