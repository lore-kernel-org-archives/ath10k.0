Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCcVq-0002un-95
 for ath10k@lists.infradead.org; Wed, 30 Jul 2014 22:38:23 +0000
Received: by mail-lb0-f175.google.com with SMTP id 10so1387603lbg.6
 for <ath10k@lists.infradead.org>; Wed, 30 Jul 2014 15:37:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkq9N6uGRYSh=T_8Wrv7XgiGtzjG3fQwOE_B69ayF==Zw@mail.gmail.com>
References: <CALCETrUXvbhkKDAvEw+643mKZtJzcJtPGhxbo35r3h=rCMOWwA@mail.gmail.com>
 <87vbqqwoks.fsf@kamboji.qca.qualcomm.com>
 <CALCETrXtvTyFbc0RM0kHcW_UiX+eurRTdp0vdQER2ysUrd4FcQ@mail.gmail.com>
 <CA+BoTQ=q-Xfk6+FwcT7yLd+YpcZobNVhszfwhLHeyL3XExps4w@mail.gmail.com>
 <CALCETrUrqGzGvzbjyc2uMo0cA3HWZi=roPx0vFJRxEY7ii_PBA@mail.gmail.com>
 <CA+BoTQkq9N6uGRYSh=T_8Wrv7XgiGtzjG3fQwOE_B69ayF==Zw@mail.gmail.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 30 Jul 2014 15:37:30 -0700
Message-ID: <CALCETrX+NczOb=U2QOf9Bqoh0ECVM=GSXwPDH=rAW+d5XQePHA@mail.gmail.com>
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

On Tue, Jul 29, 2014 at 11:15 PM, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 29 July 2014 19:52, Andy Lutomirski <luto@amacapital.net> wrote:
>> On Mon, Jul 28, 2014 at 11:26 PM, Michal Kazior <michal.kazior@tieto.com> wrote:
>>> On 22 July 2014 06:12, Andy Lutomirski <luto@amacapital.net> wrote:
>>>> On Mon, Jul 21, 2014 at 11:31 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>>>>> Andy Lutomirski <luto@amacapital.net> writes:
> [...]
>>>> Does this mean that the MBP is failing to notice TIM entries, or that
>>>> ath10k somehow stops buffering packets to power-saving stations?
>>>
>>> Do you have u-APSD enabled in your OpenWRT configuration by any chance?
>>
>> How do I tell?  The docs seem out of date here.  I have:
>>
>> config wifi-device 'radio0'
>>     option type 'mac80211'
>>     option hwmode '11a'
>>     option path 'pci0000:01/0000:01:00.0'
>>     option htmode 'VHT80'
>>     #option htmode 'HT40'
>>     option disabled '0'
>>     option channel '149'
>>
>> The relevant part (I think) of /var/run/hostapd.conf is:
>>
>> ieee80211n=1
>> ht_capab=[HT40+][LDPC][SHORT-GI-20][SHORT-GI-40][TX-STBC][RX-STBC1][DSSS_CCK-40
>> ]
>> vht_oper_chwidth=1
>> vht_oper_centr_freq_seg0_idx=155
>> ieee80211ac=1
>> vht_capab=[RXLDPC][SHORT-GI-80][TX-STBC-2BY1][RX-ANTENNA-PATTERN][TX-ANTENNA-PA
>> TTERN][RX-STBC1][MAX-MPDU-11454][MAX-A-MPDU-LEN-EXP7]
>
> Do you have `uapsd_advertisement_enabled=1` set in /var/run/hostapd.conf?
>

Here's the whole file, with the obvious redactions:

driver=nl80211
logger_syslog=127
logger_syslog_level=2
logger_stdout=127
logger_stdout_level=2
hw_mode=a
channel=149

ieee80211n=1
ht_capab=[HT40+][LDPC][SHORT-GI-20][SHORT-GI-40][TX-STBC][RX-STBC1][DSSS_CCK-40]
vht_oper_chwidth=1
vht_oper_centr_freq_seg0_idx=155
ieee80211ac=1
vht_capab=[RXLDPC][SHORT-GI-80][TX-STBC-2BY1][RX-ANTENNA-PATTERN][TX-ANTENNA-PATTERN][RX-STBC1][MAX-MPDU-11454][MAX-A-MPDU-LEN-EXP7]

interface=wlan0
ctrl_interface=/var/run/hostapd
disassoc_low_ack=1
preamble=1
wmm_enabled=1
ignore_broadcast_ssid=0
wpa_passphrase=PASSPHRASE
auth_algs=1
wpa=2
wpa_pairwise=CCMP
ssid=Aether Wind
bridge=br-lan
okc=0
disable_pmksa_caching=1
macaddr_acl=0
deny_mac_file=/var/run/hostapd-wlan0.maclist
bssid=BSSID

--Andy

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
