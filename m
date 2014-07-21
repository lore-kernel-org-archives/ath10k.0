Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-f52.google.com ([209.85.215.52])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9H1s-0005qd-QP
 for ath10k@lists.infradead.org; Mon, 21 Jul 2014 17:05:37 +0000
Received: by mail-la0-f52.google.com with SMTP id e16so4904885lan.25
 for <ath10k@lists.infradead.org>; Mon, 21 Jul 2014 10:05:09 -0700 (PDT)
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
Date: Mon, 21 Jul 2014 10:04:48 -0700
Message-ID: <CALCETrUXvbhkKDAvEw+643mKZtJzcJtPGhxbo35r3h=rCMOWwA@mail.gmail.com>
Subject: ath10k tx to a Macbook Pro stalls
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On my Archer C7 v2, as soon as the MBP tries to do something like
playing a video, it seems like frames *to* the MBP no longer get
there.  At the very least, arp replies don't get there.

I have:

[   13.220000] ath10k: qca988x hw2.0 (0x4100016c, 0x043202ff) fw
10.1.467.2-1 api 2 htt 2.1

Station 3c:15:c2:[redacted] (on wlan0)
    inactive time:    1400 ms
    rx bytes:    2157688
    rx packets:    10309
    tx bytes:    16102107
    tx packets:    15622
    tx retries:    0
    tx failed:    0
    signal:      -55 dBm
    signal avg:    -55 dBm
    tx bitrate:    6.0 MBit/s
    rx bitrate:    877.5 MBit/s VHT-MCS 7 80MHz VHT-NSS 3
    authorized:    yes
    authenticated:    yes
    preamble:    long
    WMM/WME:    yes
    MFP:        no
    TDLS peer:    no

Interface wlan0
    ifindex 18
    wdev 0x4
    addr e8:94:f6:[redacted]
    ssid [redacted]
    type AP
    wiphy 0
    channel 149 (5745 MHz), width: 80 MHz, center1: 5775 MHz

# cat fw_stats

             ath10k PDEV stats
             =================

           Channel noise floor       -108
              Channel TX power         46
                TX frame count          0
                RX frame count          0
                RX clear count          0
                   Cycle count        941
               PHY error count       2612
                 RTS bad count          0
                RTS good count          0
                 FCS bad count        426
               No beacon count          0
                 MIB int count   48158964

          ath10k PDEV TX stats
             =================

            HTT cookies queued      15887
             HTT cookies disp.      15887
                   MSDU queued      21200
                   MPDU queued      20982
                 MSDUs dropped          0
                  Local enqued       5313
                   Local freed       5313
                     HW queued      21655
                  PPDUs reaped      21655
                 Num underruns          0
                 PPDUs cleaned          0
                  MPDUs requed        776
             Excessive retries        767
                       HW rate          3
            Sched self tiggers        334
     Dropped due to SW retries          0
       Illegal rate phy errors          0
         Pdev continous xretry          0
                    TX timeout          0
                   PDEV resets          0
                  PHY underrun          0
  MPDU is more than txop limit          0

          ath10k PDEV RX stats
             =================

         Mid PPDU route change          0
       Tot. number of statuses      52787
        Extra frags on rings 0          0
        Extra frags on rings 1          0
        Extra frags on rings 2          1
        Extra frags on rings 3          0
        MSDUs delivered to HTT      52787
        MPDUs delivered to HTT      52263
      MSDUs delivered to stack      37576
      MPDUs delivered to stack      37576
               Oversized AMSUs          0
                    PHY errors          0
              PHY errors drops       2610
   MPDU errors (FCS, MIC, ENC)       3129

             ath10k PEER stats (1)
             =================

              Peer MAC address 3c:15:c2:[redacted]
                     Peer RSSI 40
                  Peer TX rate 975000
                  Peer RX rate 877500


This is with the a brand-new OpenWRT build that (finally!) has a
correct board.bin for the card.

Is this possibly a rate control issue?  A firmware issue?  Is there
something else I can do to give a more helpful bug report?


Thanks,
Andy

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
