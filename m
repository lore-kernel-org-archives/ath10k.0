Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wsnrw-0003cN-33
 for ath10k@lists.infradead.org; Fri, 06 Jun 2014 06:43:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: compat-wireless-2014-05-22 breaks ath10k in an Archer C7 v2
References: <CALCETrU=8+tnptdfva4p27nA-5=E31DwXagoLqUxYcLtEKrB+w@mail.gmail.com>
 <CA+BoTQmUyvTr+ga81EacbMkE4UVtMBP2PfBs_vH-PF4OvHuZQg@mail.gmail.com>
 <CALCETrUDWvXddiACacre3erhwrKCjO53iHVKmPrApTi65Z5yBA@mail.gmail.com>
 <87r433ps7w.fsf@kamboji.qca.qualcomm.com>
 <53909602.5010703@candelatech.com>
Date: Fri, 6 Jun 2014 09:39:51 +0300
In-Reply-To: <53909602.5010703@candelatech.com> (Ben Greear's message of "Thu, 
 5 Jun 2014 09:08:34 -0700")
Message-ID: <87oay6mthk.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: Linux Wireless List <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Andy Lutomirski <luto@amacapital.net>

Ben Greear <greearb@candelatech.com> writes:

>> Michal already did. The error means that for some reason the
>> calibaration data was not found from OTP. OTP is the storage area where
>> the calibration data is normally stored within QCA9880.
>
> I fought this with .387 firmware and WLE900VX NICs.  If it's a common
> problem with more than a single NIC (ie, not just a bad piece of
> hardware), then one could load my firmware and my ath10k patches.

That's XB143, right? I think that's different as firmware started to
support XB143 only starting from 10.1.467.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
