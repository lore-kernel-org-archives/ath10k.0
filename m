Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-f47.google.com ([209.85.215.47])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCBa8-0008Vg-RI
 for ath10k@lists.infradead.org; Tue, 29 Jul 2014 17:53:01 +0000
Received: by mail-la0-f47.google.com with SMTP id mc6so5470lab.34
 for <ath10k@lists.infradead.org>; Tue, 29 Jul 2014 10:52:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQ=q-Xfk6+FwcT7yLd+YpcZobNVhszfwhLHeyL3XExps4w@mail.gmail.com>
References: <CALCETrUXvbhkKDAvEw+643mKZtJzcJtPGhxbo35r3h=rCMOWwA@mail.gmail.com>
 <87vbqqwoks.fsf@kamboji.qca.qualcomm.com>
 <CALCETrXtvTyFbc0RM0kHcW_UiX+eurRTdp0vdQER2ysUrd4FcQ@mail.gmail.com>
 <CA+BoTQ=q-Xfk6+FwcT7yLd+YpcZobNVhszfwhLHeyL3XExps4w@mail.gmail.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 29 Jul 2014 10:52:11 -0700
Message-ID: <CALCETrUrqGzGvzbjyc2uMo0cA3HWZi=roPx0vFJRxEY7ii_PBA@mail.gmail.com>
Subject: Re: ath10k tx to a Macbook Pro stalls
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Mon, Jul 28, 2014 at 11:26 PM, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 22 July 2014 06:12, Andy Lutomirski <luto@amacapital.net> wrote:
>> On Mon, Jul 21, 2014 at 11:31 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>>> Andy Lutomirski <luto@amacapital.net> writes:
>>>
>>>> On my Archer C7 v2, as soon as the MBP tries to do something like
>>>> playing a video, it seems like frames *to* the MBP no longer get
>>>> there.  At the very least, arp replies don't get there.
>>>
>>> A multicast problem? Can you run for example 'arping -b <macbook's ip>'
>>> to check if multicast stops working at some point? What if you hardcode
>>> the ARP address, do unicast packets go to the macbook still?
>>
>> It's a unicast problem, actually.  arping -b works.  arping w/o -b
>> gets one reply.
>>
>> arp -s <IP> ff:ff:ff:ff:ff:ff allows me to ping the MBP (with
>> moderately high loss).  (I'm actually a bit surprised that Linux is
>> okay with that.)
>>
>> Does this mean that the MBP is failing to notice TIM entries, or that
>> ath10k somehow stops buffering packets to power-saving stations?
>
> Do you have u-APSD enabled in your OpenWRT configuration by any chance?

How do I tell?  The docs seem out of date here.  I have:

config wifi-device 'radio0'
    option type 'mac80211'
    option hwmode '11a'
    option path 'pci0000:01/0000:01:00.0'
    option htmode 'VHT80'
    #option htmode 'HT40'
    option disabled '0'
    option channel '149'

The relevant part (I think) of /var/run/hostapd.conf is:

ieee80211n=1
ht_capab=[HT40+][LDPC][SHORT-GI-20][SHORT-GI-40][TX-STBC][RX-STBC1][DSSS_CCK-40
]
vht_oper_chwidth=1
vht_oper_centr_freq_seg0_idx=155
ieee80211ac=1
vht_capab=[RXLDPC][SHORT-GI-80][TX-STBC-2BY1][RX-ANTENNA-PATTERN][TX-ANTENNA-PA
TTERN][RX-STBC1][MAX-MPDU-11454][MAX-A-MPDU-LEN-EXP7]

--Andy

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
