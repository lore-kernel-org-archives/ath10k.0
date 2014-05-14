Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x235.google.com ([2607:f8b0:400c:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkSd0-0001oC-EH
 for ath10k@lists.infradead.org; Wed, 14 May 2014 06:25:23 +0000
Received: by mail-vc0-f181.google.com with SMTP id ld13so1817032vcb.40
 for <ath10k@lists.infradead.org>; Tue, 13 May 2014 23:25:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHqTa-23jdHZnpJFwKgqDC05yVHhQsgxHm+7qQd3Thp1qsUagg@mail.gmail.com>
References: <1399942355-19993-1-git-send-email-apenwarr@gmail.com>
 <1400015472-4647-1-git-send-email-apenwarr@gmail.com>
 <CAEFj984Lk-QK67koxUYx=7-xpM5Y_ATr2ZD-ogMsAs6Jfg5A0g@mail.gmail.com>
 <CAHqTa-23jdHZnpJFwKgqDC05yVHhQsgxHm+7qQd3Thp1qsUagg@mail.gmail.com>
Date: Wed, 14 May 2014 14:25:01 +0800
Message-ID: <CAEFj98471PcLD_qpZrWh93CejQzC=u+0dtsGUmkvMQy=OX+C0w@mail.gmail.com>
Subject: Re: [PATCH v3] ath10k: support get/set antenna configurations.
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Here is from the fw_stats:

             ath10k PEER stats (1)
             =================

              Peer MAC address 04:f0:21:0c:a5:1c
                     Peer RSSI 43
                  Peer TX rate 877500
                  Peer RX rate 877500

TCP throughput is roughly around 151Mbps.

----
Chun-Yeow


On Wed, May 14, 2014 at 2:21 PM, Avery Pennarun <apenwarr@gmail.com> wrote:
> On Wed, May 14, 2014 at 2:20 AM, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>> I try to test by setting of antennas in my AP (firmware version
>> 10.1.467.2-1) using ath10k to the following:
>>
>> iw phy0 info | grep Antennas
>> Available Antennas: TX 0x7 RX 0x7
>> Configured Antennas: TX 0x1 RX 0x1
>>
>> But my STA (using ath10k) seems to get the same throughput even with
>> single tx and rx antenna.
>
> What throughput are you getting, and what is the signal strength?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
