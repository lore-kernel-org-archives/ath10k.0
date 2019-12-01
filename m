Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibULV-0006UL-LG
 for ath10k@lists.infradead.org; Sun, 01 Dec 2019 18:53:27 +0000
Received: by mail-ot1-x32b.google.com with SMTP id d17so5550758otc.0
 for <ath10k@lists.infradead.org>; Sun, 01 Dec 2019 10:53:25 -0800 (PST)
MIME-Version: 1.0
References: <CAMrEMU8A49OwSPKN+YP7z5LYjiopNpEq-MdACBvkZi6W=vJO9Q@mail.gmail.com>
 <CAJ-VmokD1E8s99PE-XhDkmu=dzkFB0r_QvV_0z6cbHcC3j0FHA@mail.gmail.com>
 <CAMrEMU_nahLwE39DX=6e=Pr9S8R7oyC0mFFCqis4b8-FPC80YA@mail.gmail.com>
 <CAJ-Vmo=RZNXi273vGp+4H_mQVGghKeeMSOUpStz+wXQq=awCqA@mail.gmail.com>
In-Reply-To: <CAJ-Vmo=RZNXi273vGp+4H_mQVGghKeeMSOUpStz+wXQq=awCqA@mail.gmail.com>
From: Justin Capella <justincapella@gmail.com>
Date: Sun, 1 Dec 2019 10:53:10 -0800
Message-ID: <CAMrEMU9CpXhSG4bbcYbqD=W6DR9a-mFFFqh7mj1ObpRHbobwPQ@mail.gmail.com>
Subject: Re: duplicate authentications / excessive missing ACKs / deauth due
 to inactivity timer
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: ath10k <ath10k@lists.infradead.org>

Just to note, some of the devices have not been updated, the AP
however has been, kernel upgrade  coincides with start of issue.

Name            : linux-lts
Install Date    : Sat Nov 16 12:58:43 2019
Name            : linux-firmware
Install Date    : Thu Oct 17 05:27:14 2019
Name            : hostapd
Install Date    : Thu Sep 19 17:51:31 2019
Name            : wpa_supplicant
Install Date    : Tue Sep  3 07:06:51 2019

The linux package is built from:
https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/linux-lts&id=6d82129ac6719690fa5c0fd09d1ddb1883c292cf

Link to the 4.19.84 ath10k drivers tree:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/drivers/net/wireless/ath/ath10k?h=v4.19.84

Happy to provide any info but I'm sure this is an issue on the AP side
(where the ATH10k is the base station)

I'll enable debug logging, and see if upgrading/downgrading kernel
makes a difference, if there is any sort of tracepoints anyone is
aware of I can enable those

Client devices:

*Pixel 2 XL cell phone:
Snapdragon X16 LTE modem: mobile connectivity with LTE download speeds
up to 1 Gbps, multi-gigabit 802.11ad, and integrated 2x2 802.11ac
Wi-Fi with MU-MIMO

*Intel AC 9560

*Samsung TV... Unsure of wifi chipset


Station 84:d6:d0:xx:xx:fa (on wlp1s0)
        inactive time:  1310 ms
        rx bytes:       81380769
        rx packets:     522284
        tx bytes:       745819867
        tx packets:     685665
        tx retries:     0
        tx failed:      0
        rx drop misc:   64
        signal:         -54 [-60, -56, -62] dBm
        signal avg:     -59 [-64, -62, -66] dBm
        tx bitrate:     468.0 MBit/s VHT-MCS 5 80MHz VHT-NSS 2
        rx bitrate:     6.0 MBit/s
        rx duration:    40567184 us
        last ack signal:-95 dBm
        authorized:     yes
        authenticated:  yes
        associated:     yes
        preamble:       long
        WMM/WME:        yes
        MFP:            no
        TDLS peer:      no
        DTIM period:    2
        beacon interval:100
        short slot time:yes
        connected time: 1220604 seconds
Station 64:16:66:xx:xx:c6 (on wlp1s0)
        inactive time:  8530 ms
        rx bytes:       13854367
        rx packets:     134992
        tx bytes:       11651515
        tx packets:     38495
        tx retries:     0
        tx failed:      15
        rx drop misc:   110
        signal:         -60 [-71, -68, -61] dBm
        signal avg:     -59 [-71, -67, -60] dBm
        tx bitrate:     72.2 MBit/s MCS 7 short GI
        rx bitrate:     6.0 MBit/s
        rx duration:    13006672 us
        last ack signal:-95 dBm
        authorized:     yes
        authenticated:  yes
        associated:     yes
        preamble:       long
        WMM/WME:        yes
        MFP:            no
        TDLS peer:      no
        DTIM period:    2
        beacon interval:100
        short slot time:yes
        connected time: 522598 seconds
Station 18:b4:30:xx:xx:be (on wlp1s0) < "Nest"
        inactive time:  8530 ms
        rx bytes:       8920217
        rx packets:     85624
        tx bytes:       7452573
        tx packets:     24475
        tx retries:     0
        tx failed:      29
        rx drop misc:   1686
        signal:         -76 [-85, -85, -77] dBm
        signal avg:     -75 [-83, -83, -76] dBm
        tx bitrate:     39.0 MBit/s MCS 4
        rx bitrate:     6.0 MBit/s
        rx duration:    9793456 us
        last ack signal:-95 dBm
        authorized:     yes
        authenticated:  yes
        associated:     yes
        preamble:       long
        WMM/WME:        yes
        MFP:            no
        TDLS peer:      no
        DTIM period:    2
        beacon interval:100
        short slot time:yes
        connected time: 332504 seconds
Station 54:bd:79:xx:xx:9a (on wlp1s0)
        inactive time:  22850 ms
        rx bytes:       715096377
        rx packets:     7165084
        tx bytes:       40932559821
        tx packets:     27114376
        tx retries:     0
        tx failed:      8764
        rx drop misc:   58230
        signal:         -71 [-78, -77, -75] dBm
        signal avg:     -71 [-77, -77, -74] dBm
        tx bitrate:     117.0 MBit/s VHT-MCS 3 80MHz VHT-NSS 1
        rx bitrate:     6.0 MBit/s
        rx duration:    224061996 us
        last ack signal:-95 dBm
        authorized:     yes
        authenticated:  yes
        associated:     yes
        preamble:       long
        WMM/WME:        yes
        MFP:            no
        TDLS peer:      no
        DTIM period:    2
        beacon interval:100
        short slot time:yes
        connected time: 80393 seconds
Station 10:f1:f2:xx:xx:30 (on wlp1s0) < Android
        inactive time:  42780 ms
        rx bytes:       24355519
        rx packets:     138402
        tx bytes:       112776405
        tx packets:     136049
        tx retries:     0
        tx failed:      163
        rx drop misc:   6487
        signal:         -64 [-77, -75, -64] dBm
        signal avg:     -64 [-72, -70, -67] dBm
        tx bitrate:     175.6 MBit/s VHT-MCS 2 80MHz VHT-NSS 2
        rx bitrate:     6.0 MBit/s
        rx duration:    11787408 us
        last ack signal:-95 dBm
        authorized:     yes
        authenticated:  yes
        associated:     yes
        preamble:       long
        WMM/WME:        yes
        MFP:            no
        TDLS peer:      no
        DTIM period:    2
        beacon interval:100
        short slot time:yes
        connected time: 46408 seconds
Station 48:d6:d5:xx:xx:23 (on wlp1s0)
        inactive time:  7940 ms
        rx bytes:       2867427
        rx packets:     19173
        tx bytes:       3553640
        tx packets:     13790
        tx retries:     0
        tx failed:      4
        rx drop misc:   0
        signal:         -48 [-52, -50, -61] dBm
        signal avg:     -47 [-50, -49, -59] dBm
        tx bitrate:     325.0 MBit/s VHT-MCS 7 80MHz short GI VHT-NSS 1
        rx bitrate:     433.3 MBit/s VHT-MCS 9 80MHz short GI VHT-NSS 1
        rx duration:    1589600 us
        last ack signal:-95 dBm
        authorized:     yes
        authenticated:  yes
        associated:     yes
        preamble:       long
        WMM/WME:        yes
        MFP:            no
        TDLS peer:      no
        DTIM period:    2
        beacon interval:100
        short slot time:yes
        connected time: 24731 seconds


On Sun, Dec 1, 2019 at 9:21 AM Adrian Chadd <adrian@freebsd.org> wrote:
>
> It'd be good to at least post the client devices, with the
> kernel/firmware versions if you know them. That way people can check
> for regressions.
>
>
> -a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
