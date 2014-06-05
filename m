Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-f170.google.com ([209.85.220.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WsaA6-0003rW-D1
 for ath10k@lists.infradead.org; Thu, 05 Jun 2014 16:05:07 +0000
Received: by mail-vc0-f170.google.com with SMTP id lc6so1407653vcb.29
 for <ath10k@lists.infradead.org>; Thu, 05 Jun 2014 09:04:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87r433ps7w.fsf@kamboji.qca.qualcomm.com>
References: <CALCETrU=8+tnptdfva4p27nA-5=E31DwXagoLqUxYcLtEKrB+w@mail.gmail.com>
 <CA+BoTQmUyvTr+ga81EacbMkE4UVtMBP2PfBs_vH-PF4OvHuZQg@mail.gmail.com>
 <CALCETrUDWvXddiACacre3erhwrKCjO53iHVKmPrApTi65Z5yBA@mail.gmail.com>
 <87r433ps7w.fsf@kamboji.qca.qualcomm.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Thu, 5 Jun 2014 09:04:22 -0700
Message-ID: <CALCETrUQxF68b86POMfAurBcR0bZbXc8NmhXopksWh3nojeauA@mail.gmail.com>
Subject: Re: compat-wireless-2014-05-22 breaks ath10k in an Archer C7 v2
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
Cc: Linux Wireless List <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, Jun 5, 2014 at 3:26 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Andy Lutomirski <luto@amacapital.net> writes:
>
>> On Thu, May 29, 2014 at 12:48 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
>>> +ath10k@lists.infradead.org
>>>
>>> On 28 May 2014 20:35, Andy Lutomirski <luto@amacapital.net> wrote:
>>>> It dies with 'otp calibration failed: 2'.
>>>>
>>>> Some older version of the driver seemed to work fine.
>>>
>>> ath10k did not verify otp result before so it could load successfully
>>> despite errors.
>>>
>>> Someone raised this problem yesterday on IRC. I'm not really sure how
>>> we should deal with this properly.
>>
>> Ideally, someone from Atheros could figure out what the error is.
>
> Michal already did. The error means that for some reason the
> calibaration data was not found from OTP. OTP is the storage area where
> the calibration data is normally stored within QCA9880.

Ah -- I misunderstood.  I assumed that the OTP read was failing
mysteriously and that expert input was needed to resolve that mystery
:)

>
>> Barring that, the card seems to work okay without otp (I don't even
>> know what otp is), so just warning and continuing to load might be
>> better than bailing.
>
> This means that your card is not properly calibrated and it doesn't
> function in an optimal way (for example range or throughput is less than
> what it could be).
>
> Do you see that with all Archer C7 v2 devices or with just one? One
> possibility is that the calibration data is actually stored outside of
> QCA9880 board, for example in the host flash or similar. I don't have
> that AP, can someone else see where the calibration data is stored?

I only have one of these.  I put a likely looking directory of the GPL
sources here:

http://web.mit.edu/luto/www/archerc7_gpl/atheros/

I'm not entirely sure what I'm looking for, but this might be it:

http://web.mit.edu/luto/www/archerc7_gpl/atheros/otp.c

I don't really know what I'm looking for, though.

--Andy

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
