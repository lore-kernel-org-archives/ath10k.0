Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJ4BY-0004m1-2U
 for ath10k@lists.infradead.org; Thu, 27 Feb 2014 16:51:48 +0000
Message-ID: <530F6CFA.7090702@candelatech.com>
Date: Thu, 27 Feb 2014 08:51:06 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Anyone have a working hostapd conf file for AC?
References: <530D128B.3030509@candelatech.com>
 <87sir5kc5t.fsf@kamboji.qca.qualcomm.com> <530E2873.8000506@candelatech.com>
 <530E6DBF.4060407@candelatech.com>
 <CAEFj985joW0f6EnOriFoY6cLSQVSBEj7jc5JQMjG0wXPt54NKg@mail.gmail.com>
In-Reply-To: <CAEFj985joW0f6EnOriFoY6cLSQVSBEj7jc5JQMjG0wXPt54NKg@mail.gmail.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k <ath10k@lists.infradead.org>

On 02/27/2014 05:42 AM, Yeoh Chun-Yeow wrote:
>> With this I can get around 380Mbps TCP throughput downloading,
>> over the air, using the .467 firmware.  I have not yet tried to
>> do any significant tuning to improve this throughput.
> 
> Quite impressive. Is this tested using iperf? I saw that even though
> the rx rate is MCS9 NSS 3 SGI 80MHz. I only get about 98Mbps TCP
> throughput using IPerf.

It was our own traffic generator, but iperf should work fine.  Try using
multiple streams, larger send/receive buffers, 64k or so write sizes, etc.

Thanks,
Ben

> 
> ----
> Chun-Yeow
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
