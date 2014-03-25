Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x233.google.com ([2607:f8b0:400c:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSNoQ-0005ne-TG
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 09:38:27 +0000
Received: by mail-ve0-f179.google.com with SMTP id db12so207451veb.24
 for <ath10k@lists.infradead.org>; Tue, 25 Mar 2014 02:38:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQmNVHj-rNvVgvTx=Adq6J1kpra2qwi3Pmzh2G2Npn-jGg@mail.gmail.com>
References: <1395734146-10907-1-git-send-email-yeohchunyeow@gmail.com>
 <CA+BoTQmVw1fiDU_Pu_fowRfFdme-AZ1-qLmxhCHuxFPSK831rw@mail.gmail.com>
 <CAEFj9867Z+x3orcwUpwjwQB-9c5r4FfAuZBHYDGZ1hNe=6Z1pA@mail.gmail.com>
 <CA+BoTQn4ji2boTV8x-owO8PbaPm510wYEKmbKqf+VS+MS+DXnQ@mail.gmail.com>
 <CAEFj9854WN5qJ4L4V1vkLeGhj=pstjoha19iJMQ8Vy-g24a66A@mail.gmail.com>
 <CA+BoTQmNVHj-rNvVgvTx=Adq6J1kpra2qwi3Pmzh2G2Npn-jGg@mail.gmail.com>
Date: Tue, 25 Mar 2014 17:38:05 +0800
Message-ID: <CAEFj984srRCqzFmzjGuE2nFLrC-V+PEgDPC-mejsZnfGH52g_Q@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix printing of peer stats in non-AP firmware
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> I don't think that's true for 10.1 firmware and AP interface types.

I try to play around with 10.1 firmware as AP (3 connected STAs) and I
get the following:

The first WMI_UPDATE_STATS_EVENTID as follow:
[  338.290000] ath10k: pdev 0 vdev 0 peer 3
[  338.300000] ath10k: MAC 04:f0:21:0c:a5:44
[  338.300000] ath10k: RSSI 60
[  338.300000] ath10k: Tx 1170000
[  338.310000] ath10k: Rx 1170000
[  338.310000] ath10k: MAC 04:f0:21:0c:a5:19
[  338.320000] ath10k: RSSI 64
[  338.320000] ath10k: Tx 1300000
[  338.320000] ath10k: Rx 975000
[  338.320000] ath10k: MAC 04:f0:21:0c:a5:1c
[  338.330000] ath10k: RSSI 71
[  338.330000] ath10k: Tx 975000
[  338.330000] ath10k: Rx 1300000

I think that above is correct.

The second WMI_UPDATE_STATS_EVENTID as follow:
[  338.340000] ath10k: pdev 1 vdev 0 peer 1
[  338.350000] ath10k: MAC a8:02:00:00:00:00
[  338.350000] ath10k: RSSI 0
[  338.350000] ath10k: Tx 565
[  338.360000] ath10k: Rx 0

Although indicating 1 peer, but the data seems to be not the peer
stats, not even self STA stats. Any idea?

---
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
