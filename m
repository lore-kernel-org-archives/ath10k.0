Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WsVyA-0003Kb-Fl
 for ath10k@lists.infradead.org; Thu, 05 Jun 2014 11:36:31 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: compat-wireless-2014-05-22 breaks ath10k in an Archer C7 v2
References: <CALCETrU=8+tnptdfva4p27nA-5=E31DwXagoLqUxYcLtEKrB+w@mail.gmail.com>
 <CA+BoTQmUyvTr+ga81EacbMkE4UVtMBP2PfBs_vH-PF4OvHuZQg@mail.gmail.com>
 <53905134.8010303@stackframe.org>
Date: Thu, 5 Jun 2014 14:36:03 +0300
In-Reply-To: <53905134.8010303@stackframe.org> (Sven Schnelle's message of
 "Thu, 05 Jun 2014 13:15:00 +0200")
Message-ID: <87tx7zoafw.fsf@kamboji.qca.qualcomm.com>
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
To: Sven Schnelle <svens@stackframe.org>
Cc: ath10k@lists.infradead.org

Sven Schnelle <svens@stackframe.org> writes:

> On 05/29/2014 09:48 AM, Michal Kazior wrote:
>> +ath10k@lists.infradead.org
>>
>> On 28 May 2014 20:35, Andy Lutomirski <luto@amacapital.net> wrote:
>>> It dies with 'otp calibration failed: 2'.
>>>
>>> Some older version of the driver seemed to work fine.
>> ath10k did not verify otp result before so it could load successfully
>> despite errors.
>>
>> Someone raised this problem yesterday on IRC. I'm not really sure how
>> we should deal with this properly.
>>
>>
>> http://lists.infradead.org/mailman/listinfo/ath10k
> I see the following output on the firmware console:
>
> otp main...
> Table initialized..
> streamCnt 0
> Golden Bin/fake Board Template used ...
> otp done...
> assertion failed? pc=0x948f19, line=5555, dump area=0x40ad04
> Target ID: 0x4100016c (1090519404)
> Debug Info:
> 0x4100016c 0x000015b3 0x00948f19 0x00955b31
> 0x00948f19 0x00060530 0x00000004 0x00000000
> 0x00000000 0x004045f0 0x00404610 0x00955a00
> 0x0000
>
> However, the AP where OTP now fails is an engineering sample,
> and probably doesn't contain any valid calibration. It did work
> in the past, but with the latest ath10k the driver doesn't load
> because of OTP failing. So maybe that output is helpful here.

What we could do is add 'skip_otp' (or similar) module parameter,
otp.bin is not run and then you just get the default calibration data.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
