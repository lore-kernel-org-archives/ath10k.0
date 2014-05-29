Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-f175.google.com ([209.85.220.175])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wq4Vv-0002Bk-AE
 for ath10k@lists.infradead.org; Thu, 29 May 2014 17:53:15 +0000
Received: by mail-vc0-f175.google.com with SMTP id id10so781285vcb.6
 for <ath10k@lists.infradead.org>; Thu, 29 May 2014 10:52:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQmUyvTr+ga81EacbMkE4UVtMBP2PfBs_vH-PF4OvHuZQg@mail.gmail.com>
References: <CALCETrU=8+tnptdfva4p27nA-5=E31DwXagoLqUxYcLtEKrB+w@mail.gmail.com>
 <CA+BoTQmUyvTr+ga81EacbMkE4UVtMBP2PfBs_vH-PF4OvHuZQg@mail.gmail.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Thu, 29 May 2014 10:52:32 -0700
Message-ID: <CALCETrUDWvXddiACacre3erhwrKCjO53iHVKmPrApTi65Z5yBA@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Linux Wireless List <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, May 29, 2014 at 12:48 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> +ath10k@lists.infradead.org
>
> On 28 May 2014 20:35, Andy Lutomirski <luto@amacapital.net> wrote:
>> It dies with 'otp calibration failed: 2'.
>>
>> Some older version of the driver seemed to work fine.
>
> ath10k did not verify otp result before so it could load successfully
> despite errors.
>
> Someone raised this problem yesterday on IRC. I'm not really sure how
> we should deal with this properly.
>

Ideally, someone from Atheros could figure out what the error is.
Barring that, the card seems to work okay without otp (I don't even
know what otp is), so just warning and continuing to load might be
better than bailing.

--Andy

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
