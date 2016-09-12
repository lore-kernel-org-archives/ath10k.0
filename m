Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjZaz-0005CD-Iu
 for ath10k@lists.infradead.org; Mon, 12 Sep 2016 22:20:58 +0000
Received: by mail-oi0-x231.google.com with SMTP id y2so340289806oie.0
 for <ath10k@lists.infradead.org>; Mon, 12 Sep 2016 15:20:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQn5L58sPyE=u79GACoMEXSrdfmJi-OGv3K3kEX46k6sxA@mail.gmail.com>
References: <CAOiWkA-VhhARncY-E9XnKXm=XmUraCgjDsM+eDLJW2Wx7Jn4Qw@mail.gmail.com>
 <CAJ-VmonT9SNipiMQdmgN4__4QMxgGKYg_-SwH4bieWKwfwdX5A@mail.gmail.com>
 <CAOiWkA8NSv1VskZi4AnTgjt6p-NsRoTMzHqyAPwCsMKU-c9ujg@mail.gmail.com>
 <CA+BoTQn5L58sPyE=u79GACoMEXSrdfmJi-OGv3K3kEX46k6sxA@mail.gmail.com>
From: Marty Faltesek <mfaltesek@google.com>
Date: Mon, 12 Sep 2016 18:20:35 -0400
Message-ID: <CAOiWkA9V2h45Ziju=gtE2EeHEGPVykG+VV=Y-vnEs9ktmdwogQ@mail.gmail.com>
Subject: Re: accessing ath10k calibration data
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
Cc: Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Mon, Sep 12, 2016 at 4:50 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 9 September 2016 at 19:42, Marty Faltesek <mfaltesek@google.com> wrote:
>> It's blocked by the code below which I tried to ifdef out, but then it
>> returns all 0's.
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/debug.c
>> b/drivers/net/wireless/ath/ath10k/debug.c
>> index 8b01e3e..bb8b7ec 100644
>> --- a/drivers/net/wireless/ath/ath10k/debug.c
>> +++ b/drivers/net/wireless/ath/ath10k/debug.c
>> @@ -1433,12 +1433,13 @@ static int ath10k_debug_cal_data_open(struct
>> inode *inode, struct file *file)
>>         int ret;
>>
>>         mutex_lock(&ar->conf_mutex);
>> -
>> +#if 0
>>         if (ar->state != ATH10K_STATE_ON &&
>>             ar->state != ATH10K_STATE_UTF) {
>>                 ret = -ENETDOWN;
>>                 goto err;
>>         }
>> +#endif
>
> This won't work. The driver needs to go through ath10k_start(), i.e.
> firmware must be loaded. Cal data is cooked as part of that.
>
> You could get away with just `ifconfig wlan0 up`. You don't need to
> connect or anything.
>
> I guess the driver *could* cache the end resulting cal data when the
> device is probed and re-use it in subsequent firmware boot-up attempts
> (instead of re-computing it) making it available when the device is
> stopped as well. Any volunteers to try *and* test if it doesn't break
> anything? :)
>

I see what you mean now. This might actually work for us. I'll give it a shot
and see.

thanks,

Marty

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
