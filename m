Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x235.google.com ([2607:f8b0:400c:c01::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkTSy-0002ok-7m
 for ath10k@lists.infradead.org; Wed, 14 May 2014 07:19:04 +0000
Received: by mail-ve0-f181.google.com with SMTP id pa12so1840139veb.40
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 00:18:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAEFj98471PcLD_qpZrWh93CejQzC=u+0dtsGUmkvMQy=OX+C0w@mail.gmail.com>
References: <1399942355-19993-1-git-send-email-apenwarr@gmail.com>
 <1400015472-4647-1-git-send-email-apenwarr@gmail.com>
 <CAEFj984Lk-QK67koxUYx=7-xpM5Y_ATr2ZD-ogMsAs6Jfg5A0g@mail.gmail.com>
 <CAHqTa-23jdHZnpJFwKgqDC05yVHhQsgxHm+7qQd3Thp1qsUagg@mail.gmail.com>
 <CAEFj98471PcLD_qpZrWh93CejQzC=u+0dtsGUmkvMQy=OX+C0w@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Wed, 14 May 2014 03:18:22 -0400
Message-ID: <CAHqTa-3o2-4E+5kptgr-e2uPQLQ3ygCfB1SKEH+WZx6X-9semw@mail.gmail.com>
Subject: Re: [PATCH v3] ath10k: support get/set antenna configurations.
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Wed, May 14, 2014 at 2:25 AM, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
> Here is from the fw_stats:
>
>              ath10k PEER stats (1)
>              =================
>
>               Peer MAC address 04:f0:21:0c:a5:1c
>                      Peer RSSI 43
>                   Peer TX rate 877500
>                   Peer RX rate 877500
>
> TCP throughput is roughly around 151Mbps.

In my tests it's easy to achieve >151 Mbps with a 40 MHz channel and
2x2.  So if you're using an 80 MHz channel (twice the speed) and only
one antenna (half the speed) you could still get 151 Mbps pretty
easily.

I wouldn't be surprised if your speed is being limited by something
else, maybe the host CPU or a slow interconnect on the station or AP
(USB perhaps?), so it doesn't look "worse" with only one antenna
because it should be at least twice as good when operating normally.

If you use wireshark or tcpdump you should be able to check the MCS
level of the packets and see that it's lower with fewer antennas.

Have fun,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
