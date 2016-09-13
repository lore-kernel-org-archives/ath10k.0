Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjlEX-0000aj-Go
 for ath10k@lists.infradead.org; Tue, 13 Sep 2016 10:46:47 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: accessing ath10k calibration data
Date: Tue, 13 Sep 2016 10:46:06 +0000
Message-ID: <87lgywjcwi.fsf@kamboji.qca.qualcomm.com>
References: <CAOiWkA-VhhARncY-E9XnKXm=XmUraCgjDsM+eDLJW2Wx7Jn4Qw@mail.gmail.com>
 <CAJ-VmonT9SNipiMQdmgN4__4QMxgGKYg_-SwH4bieWKwfwdX5A@mail.gmail.com>
 <CAOiWkA8NSv1VskZi4AnTgjt6p-NsRoTMzHqyAPwCsMKU-c9ujg@mail.gmail.com>
 <CA+BoTQn5L58sPyE=u79GACoMEXSrdfmJi-OGv3K3kEX46k6sxA@mail.gmail.com>
 <CAOiWkA8P-qR6HHyMFNszmc7CcypuN1+RLSXPrmH6Q6EeYCa4aw@mail.gmail.com>
In-Reply-To: <CAOiWkA8P-qR6HHyMFNszmc7CcypuN1+RLSXPrmH6Q6EeYCa4aw@mail.gmail.com>	(Marty
 Faltesek's message of "Mon, 12 Sep 2016 15:47:59 -0400")
Content-Language: en-US
Content-ID: <FEB7E1A333D3EA49AB3E6BE508A50252@qualcomm.com>
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
To: Marty Faltesek <mfaltesek@google.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Marty Faltesek <mfaltesek@google.com> writes:

> On Mon, Sep 12, 2016 at 4:50 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
>> On 9 September 2016 at 19:42, Marty Faltesek <mfaltesek@google.com> wrote:
>>> It's blocked by the code below which I tried to ifdef out, but then it
>>> returns all 0's.
>>>
>>> diff --git a/drivers/net/wireless/ath/ath10k/debug.c
>>> b/drivers/net/wireless/ath/ath10k/debug.c
>>> index 8b01e3e..bb8b7ec 100644
>>> --- a/drivers/net/wireless/ath/ath10k/debug.c
>>> +++ b/drivers/net/wireless/ath/ath10k/debug.c
>>> @@ -1433,12 +1433,13 @@ static int ath10k_debug_cal_data_open(struct
>>> inode *inode, struct file *file)
>>>         int ret;
>>>
>>>         mutex_lock(&ar->conf_mutex);
>>> -
>>> +#if 0
>>>         if (ar->state != ATH10K_STATE_ON &&
>>>             ar->state != ATH10K_STATE_UTF) {
>>>                 ret = -ENETDOWN;
>>>                 goto err;
>>>         }
>>> +#endif
>>
>> This won't work. The driver needs to go through ath10k_start(), i.e.
>> firmware must be loaded. Cal data is cooked as part of that.
>>
>> You could get away with just `ifconfig wlan0 up`. You don't need to
>> connect or anything.
>
> This does not work:
>
> hexdump: ./kernel/debug/ieee80211/phy1/ath10k/cal_data: Network is down
>
> But it works after starting the AP. Are you sure about what you said?

It should work:

# ip link show wlan0
5: wlan0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN mode DEFAULT group default qlen 1000
    link/ether 00:03:7f:48:d6:05 brd ff:ff:ff:ff:ff:ff
# ip link set wlan0 up
# hexdump /sys/kernel/debug/ieee80211/phy0/ath10k/cal_data
# ip link set wlan0 down
# hexdump /sys/kernel/debug/ieee80211/phy0/ath10k/cal_data
hexdump: /sys/kernel/debug/ieee80211/phy0/ath10k/cal_data: Network is down
# 

What's odd is that I got a file with zero bytes, but no time to
investigate it now.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
