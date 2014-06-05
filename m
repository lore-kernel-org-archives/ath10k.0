Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.duncanthrax.net ([2001:470:70c5:1111::170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WsW7v-0008G1-Ud
 for ath10k@lists.infradead.org; Thu, 05 Jun 2014 11:46:37 +0000
Message-ID: <5390594F.4070801@stackframe.org>
Date: Thu, 05 Jun 2014 13:49:35 +0200
From: Sven Schnelle <svens@stackframe.org>
MIME-Version: 1.0
Subject: Re: compat-wireless-2014-05-22 breaks ath10k in an Archer C7 v2
References: <CALCETrU=8+tnptdfva4p27nA-5=E31DwXagoLqUxYcLtEKrB+w@mail.gmail.com>
 <CA+BoTQmUyvTr+ga81EacbMkE4UVtMBP2PfBs_vH-PF4OvHuZQg@mail.gmail.com>
 <53905134.8010303@stackframe.org> <87tx7zoafw.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87tx7zoafw.fsf@kamboji.qca.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

Hi Kalle,

On 06/05/2014 01:36 PM, Kalle Valo wrote:
> Sven Schnelle <svens@stackframe.org> writes:
>
>> On 05/29/2014 09:48 AM, Michal Kazior wrote:
>>> +ath10k@lists.infradead.org
>>>
>>> On 28 May 2014 20:35, Andy Lutomirski <luto@amacapital.net> wrote:
>>>> It dies with 'otp calibration failed: 2'.
>>>>
>>>> Some older version of the driver seemed to work fine.
>>> ath10k did not verify otp result before so it could load successfully
>>> despite errors.
>>>
>>> Someone raised this problem yesterday on IRC. I'm not really sure how
>>> we should deal with this properly.
>>>
>>>
>>> http://lists.infradead.org/mailman/listinfo/ath10k
>> I see the following output on the firmware console:
>>
>> otp main...
>> Table initialized..
>> streamCnt 0
>> Golden Bin/fake Board Template used ...
>> otp done...
>> assertion failed? pc=0x948f19, line=5555, dump area=0x40ad04
>> Target ID: 0x4100016c (1090519404)
>> Debug Info:
>> 0x4100016c 0x000015b3 0x00948f19 0x00955b31
>> 0x00948f19 0x00060530 0x00000004 0x00000000
>> 0x00000000 0x004045f0 0x00404610 0x00955a00
>> 0x0000
>>
>> However, the AP where OTP now fails is an engineering sample,
>> and probably doesn't contain any valid calibration. It did work
>> in the past, but with the latest ath10k the driver doesn't load
>> because of OTP failing. So maybe that output is helpful here.
> What we could do is add 'skip_otp' (or similar) module parameter,
> otp.bin is not run and then you just get the default calibration data.
>
Looking at the backtrace, can you tell whether the calibration data is 
really
the issue? I tried now with the firmware-2.bin and board.bin files from
https://github.com/kvalo/ath10k-firmware/ath10k/QCA988X/hw2.0/ and
i'm getting the same error.

Regards
Sven

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
