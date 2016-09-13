Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjufj-00080C-B4
 for ath10k@lists.infradead.org; Tue, 13 Sep 2016 20:51:16 +0000
Received: by mail-it0-x242.google.com with SMTP id n143so139974ita.3
 for <ath10k@lists.infradead.org>; Tue, 13 Sep 2016 13:50:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOiWkA_Xm3pXGzHEWnCO9JKhahJkKQ6yEVt8DXaHi1cFvoFzew@mail.gmail.com>
References: <CAOiWkA-VhhARncY-E9XnKXm=XmUraCgjDsM+eDLJW2Wx7Jn4Qw@mail.gmail.com>
 <CAJ-VmonT9SNipiMQdmgN4__4QMxgGKYg_-SwH4bieWKwfwdX5A@mail.gmail.com>
 <CAOiWkA8NSv1VskZi4AnTgjt6p-NsRoTMzHqyAPwCsMKU-c9ujg@mail.gmail.com>
 <CA+BoTQn5L58sPyE=u79GACoMEXSrdfmJi-OGv3K3kEX46k6sxA@mail.gmail.com>
 <CAOiWkA8P-qR6HHyMFNszmc7CcypuN1+RLSXPrmH6Q6EeYCa4aw@mail.gmail.com>
 <87lgywjcwi.fsf@kamboji.qca.qualcomm.com>
 <CAOiWkA_Xm3pXGzHEWnCO9JKhahJkKQ6yEVt8DXaHi1cFvoFzew@mail.gmail.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Tue, 13 Sep 2016 13:50:53 -0700
Message-ID: <CAJ-VmomfenPKSdhCxfy0Gm0_o-kKp6XmqO1343dmk1hw0w2KYA@mail.gmail.com>
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
To: Marty Faltesek <mfaltesek@google.com>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Yes! :)


-a


On 13 September 2016 at 13:49, Marty Faltesek <mfaltesek@google.com> wrote:
> Hey Kalle
>
> OK this does work for me after all. Thanks.
>
> I wrote a patch to cache cal_data only while the core is off. I don't
> need it now, but wondering if there is any benefit
> to submitting it?
>
> thanks,
>
> Marty
>
>
>
>
>
> On Tue, Sep 13, 2016 at 6:46 AM, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
>> Marty Faltesek <mfaltesek@google.com> writes:
>>
>>> On Mon, Sep 12, 2016 at 4:50 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
>>>> On 9 September 2016 at 19:42, Marty Faltesek <mfaltesek@google.com> wrote:
>>>>> It's blocked by the code below which I tried to ifdef out, but then it
>>>>> returns all 0's.
>>>>>
>>>>> diff --git a/drivers/net/wireless/ath/ath10k/debug.c
>>>>> b/drivers/net/wireless/ath/ath10k/debug.c
>>>>> index 8b01e3e..bb8b7ec 100644
>>>>> --- a/drivers/net/wireless/ath/ath10k/debug.c
>>>>> +++ b/drivers/net/wireless/ath/ath10k/debug.c
>>>>> @@ -1433,12 +1433,13 @@ static int ath10k_debug_cal_data_open(struct
>>>>> inode *inode, struct file *file)
>>>>>         int ret;
>>>>>
>>>>>         mutex_lock(&ar->conf_mutex);
>>>>> -
>>>>> +#if 0
>>>>>         if (ar->state != ATH10K_STATE_ON &&
>>>>>             ar->state != ATH10K_STATE_UTF) {
>>>>>                 ret = -ENETDOWN;
>>>>>                 goto err;
>>>>>         }
>>>>> +#endif
>>>>
>>>> This won't work. The driver needs to go through ath10k_start(), i.e.
>>>> firmware must be loaded. Cal data is cooked as part of that.
>>>>
>>>> You could get away with just `ifconfig wlan0 up`. You don't need to
>>>> connect or anything.
>>>
>>> This does not work:
>>>
>>> hexdump: ./kernel/debug/ieee80211/phy1/ath10k/cal_data: Network is down
>>>
>>> But it works after starting the AP. Are you sure about what you said?
>>
>> It should work:
>>
>> # ip link show wlan0
>> 5: wlan0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN mode DEFAULT group default qlen 1000
>>     link/ether 00:03:7f:48:d6:05 brd ff:ff:ff:ff:ff:ff
>> # ip link set wlan0 up
>> # hexdump /sys/kernel/debug/ieee80211/phy0/ath10k/cal_data
>> # ip link set wlan0 down
>> # hexdump /sys/kernel/debug/ieee80211/phy0/ath10k/cal_data
>> hexdump: /sys/kernel/debug/ieee80211/phy0/ath10k/cal_data: Network is down
>> #
>>
>> What's odd is that I got a file with zero bytes, but no time to
>> investigate it now.
>>
>> --
>> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
