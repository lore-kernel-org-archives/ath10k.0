Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x230.google.com ([2607:f8b0:400c:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSOdu-0007Xa-MY
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 10:31:39 +0000
Received: by mail-ve0-f176.google.com with SMTP id cz12so269356veb.35
 for <ath10k@lists.infradead.org>; Tue, 25 Mar 2014 03:31:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnG4QAYrinu3LLj9PbSAdvuUzqyAZQvgrWme5Qd2Hpq6Q@mail.gmail.com>
References: <1395734146-10907-1-git-send-email-yeohchunyeow@gmail.com>
 <CA+BoTQmVw1fiDU_Pu_fowRfFdme-AZ1-qLmxhCHuxFPSK831rw@mail.gmail.com>
 <CAEFj9867Z+x3orcwUpwjwQB-9c5r4FfAuZBHYDGZ1hNe=6Z1pA@mail.gmail.com>
 <CA+BoTQn4ji2boTV8x-owO8PbaPm510wYEKmbKqf+VS+MS+DXnQ@mail.gmail.com>
 <CAEFj9854WN5qJ4L4V1vkLeGhj=pstjoha19iJMQ8Vy-g24a66A@mail.gmail.com>
 <CA+BoTQmNVHj-rNvVgvTx=Adq6J1kpra2qwi3Pmzh2G2Npn-jGg@mail.gmail.com>
 <CAEFj984srRCqzFmzjGuE2nFLrC-V+PEgDPC-mejsZnfGH52g_Q@mail.gmail.com>
 <CA+BoTQnG4QAYrinu3LLj9PbSAdvuUzqyAZQvgrWme5Qd2Hpq6Q@mail.gmail.com>
Date: Tue, 25 Mar 2014 18:31:17 +0800
Message-ID: <CAEFj985jyNgSR18xuitL73mqwkgYSV=v7cXSDLVqE5wJfN3fpw@mail.gmail.com>
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

>
> The second stats event has pdev stats. As per my other mail, 10.1 has
> extra pdev stats. Since ath10k doesn't account that it reads peer
> stats too early from the buffer. What you see is a tail of pdev stats
> for 10.1.
>
> You can try the following to test *10.1*:
>
> --- a/drivers/net/wireless/ath/ath10k/wmi.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
> @@ -2804,6 +2804,12 @@ struct wmi_pdev_stats {
>         __le32 phy_err_count;  /* Phy error count */
>         __le32 chan_tx_pwr;    /* channel tx power */
>         struct wal_dbg_stats wal; /* WAL dbg stats */
> +       __le32 ack_rx_bad;
> +       __le32 rts_bad;
> +       __le32 rts_good;
> +       __le32 fcs_bad;
> +       __le32 no_beacons;
> +       __le32 mib_int_count;
>  } __packed;
>

Ok. Probably can come out with a patch extending the pdev stats on this.

I get the self STA stats as follow on 10.1 firmware:

AP:
[  754.280000] ath10k: pdev 1 vdev 0 peer 1
[  754.280000] ath10k: MAC 04:f0:21:0c:a5:43
[  754.280000] ath10k: RSSI 0
[  754.290000] ath10k: Tx 6000
[  754.290000] ath10k: Rx 0

STA:
[  880.060000] ath10k: pdev 1 vdev 0 peer 1
[  880.060000] ath10k: MAC 00:00:00:00:00:01
[  880.070000] ath10k: RSSI 0
[  880.070000] ath10k: Tx 6000
[  880.070000] ath10k: Rx 0

Similar to 636. But on 636, I don't find any tx rate, only rssi.

---
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
