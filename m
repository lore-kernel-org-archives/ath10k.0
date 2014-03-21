Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR4Xp-0007Wn-Im
 for ath10k@lists.infradead.org; Fri, 21 Mar 2014 18:51:54 +0000
Message-ID: <532C8A32.70501@candelatech.com>
Date: Fri, 21 Mar 2014 11:51:30 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix getting stats from firmware.
References: <1395360324-20433-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQn1B6g19Ks41kzcoVyhYbHAcJGTNAyucmPMupbRAy1SNg@mail.gmail.com>
 <CAEFj98541uEFjHxjzUeim4nrjELToYrnbJTGuR5WgzwRvF9gkw@mail.gmail.com>
 <532C62DE.6060309@candelatech.com> <87eh1va5um.fsf@kamboji.qca.qualcomm.com>
 <CAEFj985WKAOp9vewgZW8LYB9KdUxh2GJG5uhAjRdCSiAd-y1sQ@mail.gmail.com>
 <CAEFj985bx2ZK-Y08yrJirqNhBQFt_CF_1hGPaj_qTRSvnU4DJw@mail.gmail.com>
In-Reply-To: <CAEFj985bx2ZK-Y08yrJirqNhBQFt_CF_1hGPaj_qTRSvnU4DJw@mail.gmail.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 03/21/2014 09:48 AM, Yeoh Chun-Yeow wrote:

>> I did a quick check again on STA mode. With or without your patch, the
>> printed peer stats are both identical but both wrong. See below:
>>
>>              ath10k PEER stats
>>              =================
>>
>>               Peer MAC address 00:00:00:00:00:00
>>                      Peer RSSI 256
>>                   Peer TX rate 0
>>
>>               Peer MAC address 00:00:00:00:04:f0
>>                      Peer RSSI 17317
>>                   Peer TX rate 73
>>
>> So I think that your patch makes no difference but do indeed providing
>> "correct" peer stats on latest AP firmware.

It looks like the peer stats are broken on my 10.x firmware as well.  Other pdev tx/rx
stats look like they are at least possibly correct.

Since ath10k supports more than one vdev, we also will want to extend it to
get peer for the rest of the vdevs some day.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
