Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x22e.google.com ([2607:f8b0:400d:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfwk0-0003dB-Ce
 for ath10k@lists.infradead.org; Fri, 02 Sep 2016 22:15:17 +0000
Received: by mail-qk0-x22e.google.com with SMTP id l2so135105936qkf.3
 for <ath10k@lists.infradead.org>; Fri, 02 Sep 2016 15:14:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <35fa0be2-6ac6-0f7f-cb4e-e8bfced4199c@candelatech.com>
References: <CAAnMG+NUtOyxrzyXc4TyzPR8nuz2RcG80+GBwEZdfBFDknL2eQ@mail.gmail.com>
 <35fa0be2-6ac6-0f7f-cb4e-e8bfced4199c@candelatech.com>
From: Alexis Green <agreen@cococorp.com>
Date: Fri, 2 Sep 2016 15:14:53 -0700
Message-ID: <CAAnMG+ORJDToFPnn0hB4h33F4zKbmT7QyNKDM26Jao_sT24APA@mail.gmail.com>
Subject: Re: Throughput weirdness on 9984
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

I just ran run AP + STA mode and it appears to behave the same way.
Also, as far as reported rates, it appears that the rates are similar.

------------------------
CT - 10.4.3-ct-fW-007-71d92ff
QCA - 10.4-3.2-00072

AP running  CT, STA running QCA:
Station dump on AP device:
Station 00:34:56:78:24:24 (on wlan0)
        inactive time:  4590 ms
        rx bytes:       37230937
        rx packets:     24305
        tx bytes:       1049354
        tx packets:     12201
        tx retries:     0
        tx failed:      0
        signal:         -36 dBm
        signal avg:     -34 dBm
        tx bitrate:     1404.0 MBit/s VHT-MCS 8 80MHz VHT-NSS 4
        rx bitrate:     1733.3 MBit/s VHT-MCS 9 80MHz short GI VHT-NSS 4
        authorized:     yes
        authenticated:  yes
        preamble:       long
        WMM/WME:        yes
        MFP:            no
        TDLS peer:      no
        connected time: 41 seconds

Station dump on STA:
Station 00:34:56:78:fe:fe (on wlan0)
        inactive time:  88780 ms
        rx bytes:       1275608
        rx packets:     14647
        tx bytes:       37230967
        tx packets:     24305
        tx retries:     0
        tx failed:      0
        signal:         -25 dBm
        signal avg:     -26 dBm
        tx bitrate:     6.0 MBit/s
        rx bitrate:     1560.0 MBit/s VHT-MCS 8 80MHz short GI VHT-NSS 4
        authorized:     yes
        authenticated:  yes
        preamble:       long
        WMM/WME:        yes
        MFP:            no
        TDLS peer:      no
        connected time: 126 seconds

iperf output
Connecting to host 192.168.1.2, port 5201
[  4] local 192.168.1.1 port 48788 connected to 192.168.1.2 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.00   sec  3.19 MBytes  26.7 Mbits/sec    0   35.4 KBytes
[  4]   1.00-2.00   sec  3.31 MBytes  27.8 Mbits/sec    0   35.4 KBytes
[  4]   2.00-3.00   sec  3.31 MBytes  27.8 Mbits/sec    0   35.4 KBytes
[  4]   3.00-4.00   sec  3.27 MBytes  27.4 Mbits/sec    0   35.4 KBytes
[  4]   4.00-5.00   sec  3.48 MBytes  29.2 Mbits/sec    0   35.4 KBytes
[  4]   5.00-6.00   sec  3.28 MBytes  27.5 Mbits/sec    0   35.4 KBytes
[  4]   6.00-7.00   sec  3.31 MBytes  27.8 Mbits/sec    0   35.4 KBytes
[  4]   7.00-8.00   sec  3.32 MBytes  27.9 Mbits/sec    0   35.4 KBytes
[  4]   8.00-9.00   sec  3.59 MBytes  30.1 Mbits/sec    0   35.4 KBytes
[  4]   9.00-10.00  sec  3.49 MBytes  29.3 Mbits/sec    0   35.4 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec  33.5 MBytes  28.1 Mbits/sec    0             sender
[  4]   0.00-10.00  sec  33.5 MBytes  28.1 Mbits/sec                  receiver

------------------------------------------------
AP running  QCA, STA running CT:
Station dump on AP:
Station 00:34:56:78:00:00 (on wlan0)
        inactive time:  8470 ms
        rx bytes:       31376541
        rx packets:     20483
        tx bytes:       898358
        tx packets:     10451
        tx retries:     0
        tx failed:      0
        signal:         -33 dBm
        signal avg:     -33 dBm
        tx bitrate:     6.0 MBit/s
        rx bitrate:     1560.0 MBit/s VHT-MCS 8 80MHz short GI VHT-NSS 4
        authorized:     yes
        authenticated:  yes
        preamble:       long
        WMM/WME:        yes
        MFP:            no
        TDLS peer:      no
        connected time: 178 seconds

Station dump on STA:
Station 00:34:56:78:1d:1d (on wlan0)
        inactive time:  4260 ms
        rx bytes:       1209897
        rx packets:     13819
        tx bytes:       31376571
        tx packets:     20483
        tx retries:     0
        tx failed:      0
        signal:         -25 dBm
        signal avg:     -25 dBm
        tx bitrate:     1404.0 MBit/s VHT-MCS 8 80MHz VHT-NSS 4
        rx bitrate:     1733.3 MBit/s VHT-MCS 9 80MHz short GI VHT-NSS 4
        authorized:     yes
        authenticated:  yes
        preamble:       long
        WMM/WME:        yes
        MFP:            no
        TDLS peer:      no
        connected time: 174 seconds

iperf output:
Connecting to host 192.168.1.2, port 5201
[  4] local 192.168.1.1 port 58162 connected to 192.168.1.2 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.00   sec  2.13 MBytes  17.9 Mbits/sec    0   32.5 KBytes
[  4]   1.00-2.00   sec  2.45 MBytes  20.6 Mbits/sec    0   33.9 KBytes
[  4]   2.00-3.00   sec  2.97 MBytes  24.9 Mbits/sec    0   38.2 KBytes
[  4]   3.00-4.00   sec  2.93 MBytes  24.6 Mbits/sec    0   52.3 KBytes
[  4]   4.00-5.00   sec  2.96 MBytes  24.8 Mbits/sec    0   73.5 KBytes
[  4]   5.00-6.00   sec  3.01 MBytes  25.2 Mbits/sec    0    115 KBytes
[  4]   6.00-7.00   sec  3.01 MBytes  25.3 Mbits/sec    0    168 KBytes
[  4]   7.00-8.00   sec  3.02 MBytes  25.3 Mbits/sec    0    242 KBytes
[  4]   8.00-9.00   sec  3.20 MBytes  26.9 Mbits/sec    0    335 KBytes
[  4]   9.00-10.00  sec  3.36 MBytes  28.1 Mbits/sec    0    462 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.00  sec  29.0 MBytes  24.3 Mbits/sec    0             sender
[  4]   0.00-10.00  sec  28.2 MBytes  23.6 Mbits/sec                  receiver

-------------------------------------------------
Both devices running QCA:
Station dump on AP:
Station 00:34:56:78:05:05 (on wlan0)
        inactive time:  7460 ms
        rx bytes:       358469390
        rx packets:     233800
        tx bytes:       6435927
        tx packets:     74855
        tx retries:     0
        tx failed:      0
        signal:         -33 dBm
        signal avg:     -33 dBm
        tx bitrate:     6.0 MBit/s
        rx bitrate:     1560.0 MBit/s VHT-MCS 8 80MHz short GI VHT-NSS 4
        authorized:     yes
        authenticated:  yes
        preamble:       long
        WMM/WME:        yes
        MFP:            no
        TDLS peer:      no
        connected time: 115 seconds

Station dump on STA:
Station 00:34:56:78:09:09 (on wlan0)
        inactive time:  3590 ms
        rx bytes:       6633321
        rx packets:     76989
        tx bytes:       358469420
        tx packets:     233800
        tx retries:     0
        tx failed:      0
        signal:         -27 dBm
        signal avg:     -25 dBm
        tx bitrate:     6.0 MBit/s
        rx bitrate:     1733.3 MBit/s VHT-MCS 9 80MHz short GI VHT-NSS 4
        authorized:     yes
        authenticated:  yes
        preamble:       long
        WMM/WME:        yes
        MFP:            no
        TDLS peer:      no
        connected time: 111 seconds

iperf output:
Connecting to host 192.168.1.2, port 5201
[  4] local 192.168.1.1 port 47046 connected to 192.168.1.2 port 5201
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  4]   0.00-1.00   sec  24.3 MBytes   203 Mbits/sec    0    129 KBytes
[  4]   1.00-2.00   sec  27.2 MBytes   228 Mbits/sec    0    153 KBytes
[  4]   2.00-3.00   sec  25.3 MBytes   213 Mbits/sec    0    168 KBytes
[  4]   3.00-4.00   sec  26.2 MBytes   220 Mbits/sec    0    168 KBytes
[  4]   4.00-5.00   sec  26.1 MBytes   219 Mbits/sec    0    262 KBytes
[  4]   5.00-6.01   sec  35.3 MBytes   294 Mbits/sec    0    843 KBytes
[  4]   6.01-7.01   sec  41.7 MBytes   351 Mbits/sec    0   1.29 MBytes
[  4]   7.01-8.01   sec  37.3 MBytes   311 Mbits/sec    0   1.62 MBytes
[  4]   8.01-9.00   sec  40.3 MBytes   342 Mbits/sec    0   1.88 MBytes
[  4]   9.00-10.01  sec  41.0 MBytes   340 Mbits/sec    0   1.88 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-10.01  sec   325 MBytes   272 Mbits/sec    0             sender
[  4]   0.00-10.01  sec   322 MBytes   270 Mbits/sec                  receiver


Hope this helps,

Alexis

On Fri, Sep 2, 2016 at 2:51 PM, Ben Greear <greearb@candelatech.com> wrote:
> On 09/02/2016 02:11 PM, Alexis Green wrote:
>>
>> Hello,
>>
>> As I was working with ath10k drivers, I have discovered that only CT
>> firmware/driver combination is able to report tx_info to mac80211
>> layer. I've built latest LEDE image for my hardware (Netgear Nighthawk
>> X4S R7800) with both ath10k-ct driver from Ben and CT firmware. This
>> combination of software provides the data I need, however, the
>> throughput is severely limited :/
>>
>> All tests are performed between two of these devices in mesh mode with
>> no encryption. Here are some of the iperf results:
>
>
> I have not actually tested mesh-mode on my firmware, so maybe I caused
> regressions related to that.
>
> If you use AP + STA config, is throughput better?
>
> What about IBSS?
>
> What tx/rx rates is CT firmware actually reporting?  Maybe it is not
> enabling HT/VHT for some reason?
>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
