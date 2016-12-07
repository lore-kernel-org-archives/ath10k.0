Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x234.google.com ([2607:f8b0:400d:c09::234])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEccM-0003DE-AV
 for ath10k@lists.infradead.org; Wed, 07 Dec 2016 13:50:44 +0000
Received: by mail-qk0-x234.google.com with SMTP id x190so413889706qkb.0
 for <ath10k@lists.infradead.org>; Wed, 07 Dec 2016 05:50:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQ=kXyjtNFmj_bvym2-OxOP84XKhxpTgX0PmeMd7y52=kw@mail.gmail.com>
References: <CAMfKPAXXtuwbn2nQC19NwN=XuF-B8XQEzuk0pMPS8tHRMUV3Yg@mail.gmail.com>
 <CA+BoTQ=kXyjtNFmj_bvym2-OxOP84XKhxpTgX0PmeMd7y52=kw@mail.gmail.com>
From: Zoilo Gomez <zoilo214.gomez@gmail.com>
Date: Wed, 7 Dec 2016 14:50:20 +0100
Message-ID: <CAMfKPAWq-RvnE2neYMTSQUdmOEwjk5wpy58kCtzab8ebqiywHQ@mail.gmail.com>
Subject: Re: ath10k qca988x: hostapd does not start properly
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Thank you very much Michal, I have installed CRDA and wireless-regdb
now and got it to work!



On Thu, Nov 24, 2016 at 8:21 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 23 November 2016 at 23:02, Zoilo Gomez <zoilo214.gomez@gmail.com> wrote:
>> Hi guys,
>>
>> I am trying to build an AP using QCA988X. All seems to go well to the
>> point where I can load the ath10k drivers, and (after installing
>> firmware in /lib/firmware/QCA988X/HW2.0), firmware seems to be loaded
>> properly. I can run iw and get results (see below), however hostapd
>> does not start properly, throwing errors (a.o.):
>> => Channel list update timeout - try to continue anyway
>> => channel [0] (36) is disabled for use in AP mode, flags: 0x853 NO-IR
>> => wlan0: IEEE 802.11 Configured channel (36) not found from the
>> channel list of current mode (2) IEEE 802.11a
>>
>> This must be really easy, but I have just started working on this, so
>> your help to get me going is very much appreciated!
>>
>> Thank you in advance for your time and help,
>>
>> Zoilo.
>>
>>
>>
>> Kernel is 3.10.87 with backport-3.18.1-1.
>>
>> I use these firware versions:
>>
>> ~ # ls -l /root/firmware-*
>> -rwxr-xr-x    1 root     root        197244 Nov 16  2016
>> /root/firmware-2.bin_10.1.467.2-1
>> -rwxr-xr-x    1 root     root        235056 Nov 17  2016
>> /root/firmware-3.bin_10.2.2.39.6-1
>>
>>
>> ~ # iw list
>> Wiphy phy1
>>                 Frequencies:
>>                         * 5180 MHz [36] (30.0 dBm) (no IR)
>>                         * 5200 MHz [40] (30.0 dBm) (no IR)
>>                         * 5220 MHz [44] (30.0 dBm) (no IR)
>>                         * 5240 MHz [48] (30.0 dBm) (no IR)
>>                         * 5260 MHz [52] (30.0 dBm) (no IR, radar detection)
>>                           DFS state: usable (for 207721 sec)
>>                           DFS CAC time: 0 ms
>>                         * 5280 MHz [56] (30.0 dBm) (no IR, radar detection)
>>                           DFS state: usable (for 207721 sec)
>>                           DFS CAC time: 0 ms
>>                         * 5300 MHz [60] (30.0 dBm) (no IR, radar detection)
>>                           DFS state: usable (for 207721 sec)
>>                           DFS CAC time: 0 ms
>>                         * 5320 MHz [64] (30.0 dBm) (no IR, radar detection)
>>                           DFS state: usable (for 207721 sec)
>>                           DFS CAC time: 0 ms
>>                         * 5500 MHz [100] (disabled)
>>                         * 5520 MHz [104] (disabled)
>>                         * 5540 MHz [108] (disabled)
>>                         * 5560 MHz [112] (disabled)
>>                         * 5580 MHz [116] (disabled)
>>                         * 5600 MHz [120] (disabled)
>>                         * 5620 MHz [124] (disabled)
>>                         * 5640 MHz [128] (disabled)
>>                         * 5660 MHz [132] (disabled)
>>                         * 5680 MHz [136] (disabled)
>>                         * 5700 MHz [140] (disabled)
>>                         * 5745 MHz [149] (30.0 dBm) (no IR)
>>                         * 5765 MHz [153] (30.0 dBm) (no IR)
>>                         * 5785 MHz [157] (30.0 dBm) (no IR)
>>                         * 5805 MHz [161] (30.0 dBm) (no IR)
>>                         * 5825 MHz [165] (30.0 dBm) (no IR)
> [...]
>> Here is my configuration file for hostapd:
>>
>> /root # cat test.80211ac.conf
>> interface=wlan0
>> driver=nl80211
>>
>> ssid=ath10k-test
>>
>> country_code=US
>> hw_mode=a
>> channel=36
> [...]
>> Channel list update timeout - try to continue anyway
>> nl80211: Regulatory information - country=00
>> nl80211: 2402-2472 @ 40 MHz 20 mBm
>> nl80211: 2457-2482 @ 40 MHz 20 mBm (no IR)
>> nl80211: 2474-2494 @ 20 MHz 20 mBm (no OFDM) (no IR)
>> nl80211: 5170-5250 @ 160 MHz 20 mBm (no IR)
>> nl80211: 5250-5330 @ 160 MHz 20 mBm (DFS) (no IR)
>> nl80211: 5490-5730 @ 160 MHz 20 mBm (DFS) (no IR)
>> channel [0] (36) is disabled for use in AP mode, flags: 0x853 NO-IR
>> wlan0: IEEE 802.11 Configured channel (36) not found from the channel
>> list of current mode (2) IEEE 802.11a
>> wlan0: IEEE 802.11 Hardware does not support configured channel
>> Could not select hw_mode and channel. (-3)
>> wlan0: interface state COUNTRY_UPDATE->DISABLED
>> wlan0: AP-DISABLED
>
> Your regulatory domain doesn't seem to get updated and all 5GHz
> channels remain to be restricted by the (conservative) world
> regulatory which disallows initiating radiation (NO-IR).
>
> Your regulatory update seems to timeout suggesting you're missing CRDA.
>
>
> Michal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
